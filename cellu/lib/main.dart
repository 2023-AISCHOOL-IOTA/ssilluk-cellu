import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:cellu/services/logger_service.dart';
import 'viewmodels/splash_screen_viewmodel.dart';
import 'widgets/splash_screen.dart';

void main() async {
  // 앱 시작 전 환경 변수 로딩
  try {
    await dotenv.load(fileName: "assets/config/.env");
  } catch (e, s) {
    LoggerService.error('환경 변수 로딩 실패', error: e, stackTrace: s);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Provider 패턴을 사용하여 스플래시 스크린 뷰 모델 관리
    return ChangeNotifierProvider(
      create: (context) => SplashScreenViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // 디버그 배너 제거
        title: 'Cellu',
        home: SplashScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
