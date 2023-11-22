import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../../styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _isCurrentPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isNewPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isConfirmNewPasswordVisible = ValueNotifier(false);

  @override
  void dispose() {
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    _isCurrentPasswordVisible.dispose();
    _isNewPasswordVisible.dispose();
    _isConfirmNewPasswordVisible.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    final email = _emailController.text;
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmNewPassword = _confirmNewPasswordController.text;

    if (email.isEmpty ||
        currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmNewPassword.isEmpty) {
      _showMessage('모든 필드를 채워주세요.');
      return;
    }

    if (newPassword != confirmNewPassword) {
      _showMessage('새 비밀번호가 일치하지 않습니다.');
      return;
    }

    // TODO: Add any additional password validation here.

    try {
      final response = await http.post(
        Uri.parse('YOUR_BACKEND_ENDPOINT'),
        // Replace with your backend endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        _showMessage('비밀번호가 성공적으로 변경되었습니다.');
        // Optionally, navigate the user away from the change password page
      } else {
        _showMessage('비밀번호 변경에 실패했습니다: ${response.body}');
      }
    } catch (e) {
      _showMessage('비밀번호 변경에 실패했습니다: $e');
    }
  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
            // 스타일링 옵션 추가
            ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(),
        // 기타 InputDecoration 속성 추가 가능
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildEmailInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('이메일'),
        _buildInputField(
          controller: _emailController,
          hintText: 'Email',
          prefixIcon: Icons.email,
        ),
      ],
    );
  }

  Widget _buildPasswordInputField(
      String label,
      ValueNotifier<bool> visibilityNotifier,
      TextEditingController controller,
      String hintText) {
    // 여기에 hintText 파라미터를 추가했습니다.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        ValueListenableBuilder(
          valueListenable: visibilityNotifier,
          builder: (context, value, child) {
            return _buildInputField(
              controller: controller,
              hintText: hintText,
              // 수정된 부분: 힌트 텍스트를 파라미터로부터 받습니다.
              prefixIcon: Icons.lock,
              obscureText: !value,
              suffixIcon: IconButton(
                icon: Icon(
                  value ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => visibilityNotifier.value = !value,
              ),
            );
          },
        ),
      ],
    );
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
              SizedBox(height: 60),
              SvgPicture.asset('assets/logo-small.svg'),
              SizedBox(height: 40),
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
                    Text('비밀번호 변경', style: AppStyles.titleStyle),
                    SizedBox(height: 20),
                    _buildEmailInputField(),
                    SizedBox(height: 20),
                    _buildPasswordInputField(
                      '현재 비밀번호',
                      _isCurrentPasswordVisible,
                      _currentPasswordController,
                      'Password', // 현재 비밀번호 힌트
                    ),
                    SizedBox(height: 20),
                    _buildPasswordInputField(
                      '새 비밀번호',
                      _isNewPasswordVisible,
                      _newPasswordController,
                      'Confrim Password', // 새 비밀번호 힌트
                    ),
                    SizedBox(height: 20),
                    _buildPasswordInputField(
                      '새 비밀번호 확인',
                      _isConfirmNewPasswordVisible,
                      _confirmNewPasswordController,
                      'Confrim Password', // 새 비밀번호 확인 힌트
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                      onPressed: _changePassword,
                      child: Text('변경 하기'),
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
