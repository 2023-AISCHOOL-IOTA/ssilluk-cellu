import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:cellu/widgets/custom_text_field.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/screens/login_screen.dart';

// 회원가입 화면을 구성하는 위젯
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isConfirmPasswordVisible = ValueNotifier(false);

  bool _isLoading = false; // 로딩 상태 추가

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isPasswordVisible.dispose();
    _isConfirmPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
        child: Column(
          children: [
            SizedBox(height: 60), // Top padding
            SvgPicture.asset('assets/logo-small.svg'), // 로고
            SizedBox(height: 40), // 로고와 폼 사이의 간격
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text('회원가입', style: AppStyles.titleStyle),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: '이메일',
                    hint: '이메일을 입력하세요',
                    obscureText: false,
                    prefixIcon: Icons.email,
                    controller: _emailController,
                    // 이메일 입력 컨트롤러 연결
                    onSubmitted: (value) {
                      // 여기서 필요한 로직 추가 (예: _passwordController로 포커스 이동)
                    },
                  ),
                  SizedBox(height: 20),
                  _buildPasswordInputField(
                    '비밀번호',
                    _isPasswordVisible,
                    _passwordController, // 비밀번호 입력 컨트롤러 연결
                    (value) {
                      // 여기서 필요한 로직 추가 (예: _passwordController로 포커스 이동)
                    },
                  ),
                  SizedBox(height: 20),
                  _buildPasswordInputField(
                    '비밀번호 확인',
                    _isConfirmPasswordVisible,
                    _confirmPasswordController, // 비밀번호 입력 컨트롤러 연결
                    (value) {
                      // 키보드의 엔터 키를 눌렀을 때 회원가입 시도
                      _register();
                    },
                  ),
                  SizedBox(height: 30),
                  // 회원가입 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    ),
                    onPressed: _isLoading ? null : _register,
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text('회원가입'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      '아이디가 있으신가요? 로그인',
                      style: AppStyles.linkStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  // 회원가입 로직
  Future<void> _register() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    setState(() {
      _isLoading = true; // 로딩 시작
    });

    // 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar('비밀번호가 일치하지 않습니다.');
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      // HTTP 요청 보냄
      final response = await http.post(
        Uri.parse('${dotenv.env['BACKEND_URL']}/user/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 201) {
        _showSnackBar('회원가입 성공!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        _showSnackBar('회원가입 실패');
      }
    } catch (e) {
      _showSnackBar('회원가입 중 에러 발생');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // 스낵바 표시
  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}

// 비밀번호 입력 필드 구성
Widget _buildPasswordInputField(
  String label,
  ValueNotifier<bool> visibilityNotifier,
  TextEditingController controller,
  void Function(String)? onSubmitted,
) {
  return ValueListenableBuilder(
    valueListenable: visibilityNotifier,
    builder: (context, value, child) {
      return CustomTextField(
        label: label,
        hint: label,
        obscureText: !value,
        prefixIcon: Icons.lock,
        suffixIcon: IconButton(
          icon: Icon(
            value ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => visibilityNotifier.value = !value,
        ),
        controller: controller,
        onSubmitted: onSubmitted,
      );
    },
  );
}
