import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/custom_text_field.dart';
import '../styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isConfirmPasswordVisible = ValueNotifier(false);

  @override
  void dispose() {
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
              Text('회원가입', style: AppStyles.titleStyle), // 헤더 추가
              SizedBox(height: 40), // 헤더와 폼 사이의 간격
              CustomTextField(
                label: '이메일',
                hint: '이메일을 입력하세요',
                obscureText: false,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20),
              // 비밀번호 입력 필드
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
              // 비밀번호 확인 입력 필드
              ValueListenableBuilder(
                  valueListenable: _isConfirmPasswordVisible,
                  builder: (context, value, child) {
                    return CustomTextField(
                        label: '비밀번호 확인',
                        hint: '비밀번호를 다시 입력하세요',
                        obscureText: !value,
                        prefixIcon: Icons.lock,
                        suffixIcon: IconButton(
                          icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              _isConfirmPasswordVisible.value = !value,
                        ));
                  }),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                onPressed: () {},
                child: Text('회원가입'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  '아이디가 있으신가요? 로그인',
                  style: AppStyles.linkStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Widget _buildTextField({
//     required String hintText,
//     required IconData icon,
//     required bool obscureText,
//     Widget? suffixIcon,
//   }) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: hintText,
//         prefixIcon: Icon(icon),
//         suffixIcon: suffixIcon,
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       obscureText: obscureText,
//     );
//   }
}
