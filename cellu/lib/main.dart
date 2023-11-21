import 'dart:async';
import 'package:flutter/material.dart';
import 'bloc/server_connection_bloc.dart';
import 'repository/server_connection_repository.dart';
import 'services/logger_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'styles.dart';
import 'ui/widgets/splash_screen.dart';

import 'package:cellu/ui/screens/drugmanagement_page.dart';
import 'package:cellu/ui/widgets/lowerbar.dart';

void main() async {  // 환경 변수 로딩
  try {
    await dotenv.load(fileName: "assets/config/.env");
  } catch (e, s) {
    LoggerService.error('환경 변수 로딩 실패', error: e, stackTrace: s);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    // BLoC 제공자 설정
    return BlocProvider(
      create: (context) => ServerConnectionBloc(ServerConnectionRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // 개발자 모드 비활성화
        title: 'Cellu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
