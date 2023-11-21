import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../services/logger_service.dart';
import '../../styles.dart';
import '../../viewmodels/splash_screen_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SplashScreenViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          future: viewModel.loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 로딩 중에 보여질 화면
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 에러 발생 시 처리
              LoggerService.error('데이터 로딩 중 에러 발생', error: snapshot.error);
              return Text('에러 발생');
            } else {
              // 로딩 완료 후 보여질 화면
              return SvgPicture.asset('assets/logo.svg'); // 로딩 완료 후 이미지 표시
            }
          },
        ),
      ),
    );
  }
}