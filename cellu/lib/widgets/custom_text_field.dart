import 'package:flutter/material.dart';
import '../../styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType; // updateProfile 사용 추가
  final Function(String)? onChanged; // 사용자 입력 변경 시 호출할 콜백
  final Function(String)? onSubmitted; // onSubmitted 콜백

  CustomTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.keyboardType, // updateProfile 사용 추가
    this.onChanged, // 콜백
    this.onSubmitted, // onSubmitted 초기화
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      // onChanged 콜백 사용
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      // updateProfile 사용 추가
      onSubmitted: onSubmitted, // TextField에 onSubmitted 연결
    );
  }
}
