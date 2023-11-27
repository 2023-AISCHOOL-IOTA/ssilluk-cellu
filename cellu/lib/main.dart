import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../services/logger_service.dart';
import 'viewmodels/splash_screen_viewmodel.dart';
import 'widgets/splash_screen.dart';

void main() async {
  // 환경 변수 로딩
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
    return ChangeNotifierProvider(
      create: (context) => SplashScreenViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
