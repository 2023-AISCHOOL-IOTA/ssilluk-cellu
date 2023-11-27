import 'package:flutter/material.dart';

// 앱 전체에 걸쳐 사용되는 일관된 스타일
class AppStyles {
  // 기본 텍스트 스타일
  static const TextStyle titleStyle = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  // 링크 스타일
  static const TextStyle linkStyle = TextStyle(
    color: AppColors.blue,
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  // 에러 메시지 스타일
  static const TextStyle errorStyle = TextStyle(
    color: AppColors.red,
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle doseItemTitleStyle = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle doseItemSubtitleStyle = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle doseItemAmountStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle chartTitleStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle chartLabelStyle = TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bloodSugarLabelStyle = TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bloodSugarValueStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

// ... 다른 스타일 요소들
}

// 앱 전체에 사용되는 공간 및 크기 관련 상수
class AppDimensions {
  static const double pagePaddingHorizontal = 6.0;
  static const double cardCornerRadius = 12.0;
  static const double cardElevation = 4.0;
  static const double cardMargin = 12.0;
  static const double cardPadding = 16.0;
  static const double doseItemPadding = 10.0;

// ... 다른 디멘션 값들
}

// 앱 전체에 사용되는 색상
class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color dosePrimaryColor = Color(0xFFF99620);
  static const Color primaryColor = Color(0xFF3330C2);
  static const Color primaryColorOpacity90 = Color(0xE63330C2);
  static const Color brightBlue = Color(0xFF322EFB);
  static const Color blue = Color(0xFF0000FF);
  static const Color grey = Color(0xFF7D7D7D);
  static const Color greyOpacity80 = Color(0xCC898989);
  static const Color lightGreyOpacity20 = Color(0x33C4C4C4);
  static const Color cardBackgroundColor = Color(0xFFF5F5F5);

// ... 다른 색상 값들
}
