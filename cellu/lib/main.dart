import 'dart:async';

import 'package:cellu/screens/drugmanagement_page.dart';
import 'package:cellu/widgets/lowerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/server_connection_bloc.dart';
import 'repository/server_connection_repository.dart';
import 'services/logger_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'widgets/splash_screen.dart';

void main() async {
  try {
    await dotenv.load(fileName: "assets/config/.env");
  } catch (e, s) {
    LoggerService.error('환경 변수 로딩 실패', error: e, stackTrace: s);
  }
  runApp(const MyApp());
  // Push Test 슬기
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServerConnectionBloc(ServerConnectionRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cellu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Bottomnavi(),
      ),
    );
  }
}
