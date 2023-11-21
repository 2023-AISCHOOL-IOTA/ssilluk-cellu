import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/viewmodels/splash_screen_viewmodel.dart';

class SplashScreen extends StatelessWidget {
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

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 스타일 적용
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildLogoScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 스타일 적용
      body: Center(
        child: SvgPicture.asset(
          'assets/logo.svg', // 로고 이미지 경로 수정
          height: 150, // 이미지 크기 조절
        ),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Scaffold(
      backgroundColor: AppColors.white, // 스타일 적용
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
