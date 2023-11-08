import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle linkStyle = TextStyle(
    color: Colors.blue,
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );
// ... 다른 스타일 요소들
}

class AppDimensions {
  static const double pagePaddingHorizontal = 16.0;
// ... 다른 디멘션 값들
}

class AppColors {
  static const Color primaryColor = Color(0xFF322FC1);
  static const Color borderColor = Color(0xFF868686);
// ... 다른 색상 값들
}
