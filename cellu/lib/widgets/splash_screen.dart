import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/server_connection_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/login_screen.dart';
import '../services/logger_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 서버 연결 체크 시작
    BlocProvider.of<ServerConnectionBloc>(context).add(CheckConnection());
  }

  // 로그인 화면으로 이동
  void _navigateToLogin() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  // 연결 오류 대화상자 표시
  void _showError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('연결 오류'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('서버에 연결할 수 없습니다.'),
                Text('네트워크 상태를 확인하거나 나중에 다시 시도해주세요.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('다시 시도'),
              onPressed: () {
                Navigator.of(context).pop();
                BlocProvider.of<ServerConnectionBloc>(context)
                    .add(CheckConnection());
              },
            ),
            TextButton(
              child: const Text('종료'),
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // BLoC Consumer로 상태 변화 감지
    return BlocConsumer<ServerConnectionBloc, ServerConnectionState>(
      listener: (context, state) {
        if (state == ServerConnectionState.connected) {
          _navigateToLogin();
        } else if (state == ServerConnectionState.error) {
          _showError();
        }
      },
      builder: (context, state) {
        if (state == ServerConnectionState.initial) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: SvgPicture.asset('assets/logo.svg')),
          );
        }
      },
    );
  }
}
