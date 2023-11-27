import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cellu/services/logger_service.dart';
import 'package:cellu/repository/server_connection_repository.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isBackendConnected = false;

  // Getter 메서드를 통한 상태 접근
  bool get isLoading => _isLoading;

  bool get isBackendConnected => _isBackendConnected;

  SplashScreenViewModel() {
    _checkServerConnection();
  }

  // 서버 연결 확인
  Future<void> _checkServerConnection() async {
    await Future.delayed(Duration(seconds: 3)); // 초기 로딩 대기
    try {
      final connectionRepo = ServerConnectionRepository();
      _isBackendConnected = await connectionRepo.checkConnection();
    } catch (e) {
      LoggerService.error('Connection error: $e');
      _isBackendConnected = false;
    } finally {
      _isLoading = false;
      notifyListeners(); // 상태 변경 알림
    }
  }

  // 연결 재시도 메서드
  void retryConnection() {
    _isLoading = true;
    _isBackendConnected = false;
    notifyListeners();
    _checkServerConnection();
  }
}
