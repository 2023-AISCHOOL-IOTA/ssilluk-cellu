import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';

// 사용자 지정 텍스트 필드 위젯
class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText; // 비밀번호 등을 위한 텍스트 숨김 여부
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType; // 키보드 타입 지정 (예: 이메일, 숫자 등)
  final Function(String)? onChanged; // 텍스트 변경 시 호출할 함수
  final Function(String)? onSubmitted; // 제출 시 호출할 함수

  CustomTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
    );
  }
}
