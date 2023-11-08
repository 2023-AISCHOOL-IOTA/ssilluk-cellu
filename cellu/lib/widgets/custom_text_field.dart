import 'package:flutter/material.dart';
import '../styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  CustomTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
