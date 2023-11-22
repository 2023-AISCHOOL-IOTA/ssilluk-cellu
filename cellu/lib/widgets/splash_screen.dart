import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/viewmodels/splash_screen_viewmodel.dart';
import '../screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadScreen();
  }

  // 3초 딜레이 후 화면 이동
  _loadScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // 로그인 화면으로 이동
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SplashScreenViewModel>(context);

    if (viewModel.isLoading) {
      return _buildLoadingScreen();
    } else if (viewModel.isBackendConnected) {
      // 백엔드 연결 상태 확인
      return _buildLogoScreen();
    } else {
      return _buildErrorScreen();
    }
  }

// 로딩 중 화면을 구성하는 함수
  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 배경색 스타일 적용
      body: Center(
        child: CircularProgressIndicator(), // 로딩 인디케이터
      ),
    );
  }

// 연결 성공 화면을 구성하는 함수
  Widget _buildLogoScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 배경색 스타일 적용
      body: Center(
        child: SvgPicture.asset(
          'assets/logo.svg', // 로고 이미지 경로
          height: 150, // 이미지 크기
        ),
      ),
    );
  }

  // 연결 실패 화면을 구성하는 함수
  Widget _buildErrorScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 배경색 스타일 적용
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '서버 연결 실패',
              style:
                  AppStyles.titleStyle.copyWith(color: AppColors.red), // 스타일 적용
            ),
            ElevatedButton(
              onPressed: () {
                // 에러 처리를 다시 시도할 수 있는 버튼 추가
              },
              child: Text('재시도'),
            ),
          ],
        ),
      ),
    );
  }
}
