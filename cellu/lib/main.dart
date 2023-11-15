import 'dart:async';

import 'package:cellu/widgets/lowerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screens/login_screen.dart';
import 'screens/biometrics_screen.dart';
import 'screens/mypage_screen.dart';


void main() {
  runApp(const MyApp());
  // Push Test 슬기
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cellu~',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Bottomnavi(), // 앱의 진입점을 SplashScreen으로 설정
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _navigateToLogin);
  }

  void _navigateToLogin() {
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dipose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset('assets/logo.svg'),
      ),
    );
  }
}
