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

  CustomTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.keyboardType,  // updateProfile 사용 추가
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

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
      keyboardType: keyboardType,  // updateProfile 사용 추가
    );
  }
}
