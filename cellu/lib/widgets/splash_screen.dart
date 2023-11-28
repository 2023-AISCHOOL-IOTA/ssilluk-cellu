import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/viewmodels/splash_screen_viewmodel.dart';
import 'package:cellu/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Consumer 위젯을 사용하여 SplashScreenViewModel의 상태에 따라 UI 업데이트
    return Consumer<SplashScreenViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          // 로딩 중 화면
          return _buildLoadingScreen();
        } else if (viewModel.isBackendConnected) {
          // 서버 연결 성공 시 로그인 화면으로 이동
          _navigateToLoginScreen(context);
          return _buildLoadingScreen(); // 로딩 화면 유지
        } else {
          // 서버 연결 실패 화면
          return _buildConnectionErrorScreen(context, viewModel);
        }
      },
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  Widget _buildLoadingScreen() {
    // 로딩 화면
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SvgPicture.asset(
          'assets/logo.svg',
          height: 150,
        ),
      ),
    );
  }

  Widget _buildConnectionErrorScreen(
      BuildContext context, SplashScreenViewModel viewModel) {
    // 연결 오류 화면
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '서버 연결 실패',
              style: AppStyles.errorStyle,
            ),
            ElevatedButton(
              onPressed: () {
                // 재시도 로직
                viewModel.retryConnection();
              },
              child: const Text('재시도'),
            ),
          ],
        ),
      ),
    );
  }
}
