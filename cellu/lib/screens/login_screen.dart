import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles.dart'; // 상수와 스타일을 정의한 파일을 가져옵니다.

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRememberMeChecked = false;
  bool _isPasswordVisible = false;

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
              _buildTextField(
                hintText: '이메일',
                icon: Icons.email,
                obscureText: false,
              ),
              SizedBox(height: 20),
              _buildTextField(
                hintText: '비밀번호',
                icon: Icons.lock,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _isRememberMeChecked,
                    onChanged: (value) {
                      setState(() {
                        _isRememberMeChecked = value ?? false;
                      });
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
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: () {},
                child: Text('로그인'),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '아이디가 없으신가요? 회원가입',
                  style: AppStyles.linkStyle,
                ),
              ),
            ],
          ),
        ),
      ),
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
