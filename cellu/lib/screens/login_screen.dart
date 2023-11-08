import 'package:flutter/material.dart';
import '../styles.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.pagePaddingHorizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 로그인 박스
          ],
        ),
      ),
    );
  }
}
