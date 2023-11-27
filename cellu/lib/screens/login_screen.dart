import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/widgets/custom_text_field.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/repository/server_connection_repository.dart';
import 'package:cellu/services/logger_service.dart';
import 'package:cellu/screens/register_screen.dart';
import 'package:cellu/screens/Home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _isRememberMeChecked = ValueNotifier(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  String email = ''; // 사용자 이메일 상태
  String password = ''; // 사용자 비밀번호 상태

  // 추가: 로딩 상태를 관리하기 위한 ValueNotifier
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void dispose() {
    _isRememberMeChecked.dispose();
    _isPasswordVisible.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  Future<void> _login(String userId, String password) async {
    _isLoading.value = true; // 로딩 시작
    try {
      // 백엔드 서버의 로그인 API를 호출
      // 요청을 보내기 전에 로그 추가
      LoggerService.info('Sending a POST request to sign in');
      final response = await http.post(
        Uri.parse('${dotenv.env['BACKEND_URL']}/user/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': userId,
          'password': password,
        }),
      );
      // 요청 후에 로그 추가
      LoggerService.info('Received response from server: ${response.body}');

      if (!mounted) return; // 현재 위젯의 마운트 상태 확인

      if (response.statusCode == 200) {
        // 로그인 성공 처리
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String extractedToken = responseBody['token'];
        UserTokenManager.setToken(extractedToken);

        // 로그인 성공 후 다음 화면으로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      } else if (response.statusCode == 401) {
        // 로그인 실패 처리 (인증 오류)
        // TODO: 로그인 실패 메시지 표시
        LoggerService.error('로그인 실패 (인증 오류): ${response.statusCode}');
        _showSnackBar('로그인 실패');
      } else {
        // 기타 상태 코드에 대한 처리
        // TODO: 기타 실패 상태에 대한 메시지 표시 또는 처리
        LoggerService.error('로그인 실패: ${response.statusCode}');
        _showSnackBar('로그인 실패');
      }
    } catch (e) {
      // TODO: 에러 발생 시 처리
      LoggerService.error('로그인 중 에러 발생: $e');
      _showSnackBar('Error!');
    } finally {
      if (mounted) {
        _isLoading.value = false; // 로딩 종료
      }
    }
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
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
                      color: AppColors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text('로그인', style: AppStyles.titleStyle), // 헤더 추가
                    SizedBox(height: 40),
                    // 헤더와 폼 사이의 간격
                    CustomTextField(
                      label: '이메일',
                      hint: '이메일을 입력하세요',
                      obscureText: false,
                      prefixIcon: Icons.email,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: _isPasswordVisible,
                      builder: (context, value, child) {
                        return CustomTextField(
                          label: '비밀번호',
                          hint: '비밀번호를 입력하세요',
                          obscureText: !value,
                          prefixIcon: Icons.lock,
                          // 비밀번호 아이콘 추가
                          suffixIcon: IconButton(
                            icon: Icon(
                              value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () => _isPasswordVisible.value = !value,
                          ),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          onSubmitted: (value) {
                            // 엔터 키를 누르면 _login 함수 호출
                            _login(email, password);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _isRememberMeChecked,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: value,
                              onChanged: (newValue) => _isRememberMeChecked
                                  .value = newValue ?? false,
                            );
                          },
                        ),
                        Text('아이디 기억하기'),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                      onPressed: () {
                        _login(email, password);
                      }, // 로그인 버튼의 onPressed 이벤트 설정
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _isLoading,
                        builder: (context, isLoading, child) {
                          if (isLoading) {
                            return CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            );
                          }
                          return Text('로그인');
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        '아이디가 없으신가요? 회원가입',
                        style: AppStyles.linkStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required String hintText,
  required IconData icon,
  required bool obscureText,
  Widget? suffixIcon,
}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
    obscureText: obscureText,
  );
}
