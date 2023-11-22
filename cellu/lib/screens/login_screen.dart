import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../widgets/custom_text_field.dart';
import '../styles.dart';
import '../repository/server_connection_repository.dart';
import '../services/logger_service.dart';
import 'register_screen.dart';
import 'Home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _isRememberMeChecked = ValueNotifier(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  String email = ''; // 사용자 이메일 상태
  String password = ''; // 사용자 비밀번호 상태

  @override
  void dispose() {
    _isRememberMeChecked.dispose();
    _isPasswordVisible.dispose();
    super.dispose();
  }

  Future<void> _login(String userId, String password) async {
    final backendUrl = dotenv.env['BACKEND_URL'];
    if (backendUrl == null) {
      // .env 파일에 BACKEND_URL이 정의되어 있지 않으면 에러 처리
      LoggerService.error('BACKEND_URL이 .env 파일에 정의되어 있지 않습니다.');
      return;
    }
    try {
      // 백엔드 서버의 로그인 API를 호출
      final response = await http.post(
        Uri.parse('$backendUrl/user/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': userId,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        // 로그인 성공 처리
        final token = response.body; // 서버에서 받은 토큰
        // TODO: 토큰을 저장하거나 다른 작업 수행
        // 로그인 성공 후 다음 화면으로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else if (response.statusCode == 401) {
        // 로그인 실패 처리 (인증 오류)
        // TODO: 로그인 실패 메시지 표시
        LoggerService.error('로그인 실패 (인증 오류): ${response.statusCode}');
      } else {
        // 기타 상태 코드에 대한 처리
        // TODO: 기타 실패 상태에 대한 메시지 표시 또는 처리
        LoggerService.error('로그인 실패: ${response.statusCode}');
      }
    } catch (e) {
      // TODO: 에러 발생 시 처리
      LoggerService.error('로그인 중 에러 발생: $e');
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
                      child: Text('로그인'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
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
