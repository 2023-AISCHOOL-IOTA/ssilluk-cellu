import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/custom_text_field.dart';
import '../styles.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _isRememberMeChecked = ValueNotifier(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  void dispose() {
    _isRememberMeChecked.dispose();
    _isPasswordVisible.dispose();
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
          children: <Widget>[
            SizedBox(height: 60), // Top padding
            SvgPicture.asset('assets/logo-small.svg'), // 로고
            SizedBox(height: 40), // 로고와 폼 사이의 간격
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
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
                  Text('로그인', style: AppStyles.titleStyle), // 헤더 추가
                  SizedBox(height: 40),
                  // 헤더와 폼 사이의 간격
                  CustomTextField(
                    label: '이메일',
                    hint: '이메일을 입력하세요',
                    obscureText: false,
                    prefixIcon: Icons.email,
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
                            onChanged: (newValue) =>
                                _isRememberMeChecked.value = newValue ?? false,
                          );
                        },
                      ),
                      Text('아이디 기억하기'),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    ),
                    onPressed: () {},
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
      )),
    );
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
}
