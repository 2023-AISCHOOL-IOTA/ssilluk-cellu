import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cellu/widgets/custom_text_field.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/screens/register_screen.dart';
import 'package:cellu/screens/home_screen.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/services/logger_service.dart';
import 'package:cellu/widgets/lowerbar.dart';

// 로그인 화면을 구성하는 위젯
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isRememberMeChecked = ValueNotifier(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _isRememberMeChecked.dispose();
    _isPasswordVisible.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  // SharedPreferences에서 이메일을 로드하여 TextField에 설정
  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isRememberMe') ?? false) {
      final userEmail = prefs.getString('userEmail') ?? '';
      _emailController.text = userEmail;
      _isRememberMeChecked.value = true;
    }
  }

  // SharedPreferences에 이메일을 저장하는 함수
  Future<void> _saveUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRememberMe', _isRememberMeChecked.value);
    if (_isRememberMeChecked.value) {
      prefs.setString('userEmail', _emailController.text);
    } else {
      prefs.remove('userEmail');
    }
  }

  // 로그인 로직
  Future<void> _login(String email, String password) async {
    _isLoading.value = true; // 로딩 시작

    try {
      final response = await http.post(
        Uri.parse('${dotenv.env['BACKEND_URL']}/user/signin'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({'id': email, 'password': password}),
      );

      LoggerService.info('Received response from server: ${response.body}');

      if (!mounted) return; // 현재 위젯의 마운트 상태 확인

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final extractedToken = responseBody['token'];
        UserTokenManager.setToken(extractedToken);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bottomnavi()));
      } else {
        _handleLoginError(response.statusCode);
      }
    } catch (e) {
      LoggerService.error('Error during login: $e');
      _showSnackBar('Login Error!');
    } finally {
      if (mounted) {
        _isLoading.value = false;
      }
    }
  }

  void _handleLoginError(int statusCode) {
    String errorMessage = 'Login Failed';
    if (statusCode == 401) {
      errorMessage = 'Authentication Error';
    }
    LoggerService.error('Login failed: $statusCode');
    _showSnackBar(errorMessage);
  }

  // 로그인 실패 혹은 성공 시 표시될 스낵바
  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              SvgPicture.asset('assets/logo-small.svg'),
              SizedBox(height: 40),
              _loginForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Text('로그인', style: AppStyles.titleStyle),
          SizedBox(height: 40),
          _emailTextField(),
          SizedBox(height: 20),
          _passwordTextField(),
          SizedBox(height: 20),
          _rememberMeCheckbox(),
          SizedBox(height: 20),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _emailTextField() {
    return CustomTextField(
      controller: _emailController,
      label: '이메일',
      hint: '이메일을 입력하세요',
      obscureText: false,
      prefixIcon: Icons.email,
    );
  }

  Widget _passwordTextField() {
    return ValueListenableBuilder(
      valueListenable: _isPasswordVisible,
      builder: (context, value, child) {
        return CustomTextField(
          controller: _passwordController,
          label: '비밀번호',
          hint: '비밀번호를 입력하세요',
          obscureText: !value,
          prefixIcon: Icons.lock,
          suffixIcon: IconButton(
            icon: Icon(value ? Icons.visibility : Icons.visibility_off),
            onPressed: () => _isPasswordVisible.value = !value,
          ),
          onSubmitted: (value) {
            _login(_emailController.text, _passwordController.text);
          },
        );
      },
    );
  }

  Widget _rememberMeCheckbox() {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _isRememberMeChecked,
          builder: (context, value, child) {
            return Checkbox(
              value: value,
              onChanged: (newValue) {
                _isRememberMeChecked.value = newValue ?? false;
                _saveUserEmail();
              },
            );
          },
        ),
        Text('아이디 기억하기'),
      ],
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      ),
      onPressed: () {
        _login(_emailController.text, _passwordController.text);
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (context, isLoading, child) {
          if (isLoading) {
            return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
          }
          return Text('로그인');
        },
      ),
    );
  }

  Widget _registerButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Text('아이디가 없으신가요? 회원가입', style: AppStyles.linkStyle),
    );
  }
}
