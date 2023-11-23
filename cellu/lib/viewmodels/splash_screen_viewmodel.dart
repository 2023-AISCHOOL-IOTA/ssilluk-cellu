import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../services/logger_service.dart';
import '../repository/server_connection_repository.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isBackendConnected = false;

  bool get isLoading => _isLoading;

  bool get isBackendConnected => _isBackendConnected;

  SplashScreenViewModel() {
    _checkServerConnection();
  }

  Future<void> _checkServerConnection() async {
    await Future.delayed(Duration(seconds: 3)); // 3초 대기
    try {
      final connectionRepo = ServerConnectionRepository();
      _isBackendConnected = await connectionRepo.checkConnection();
    } catch (e) {
      LoggerService.error('Connection error: $e');
      _isBackendConnected = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void retryConnection() {
    _isLoading = true;
    _isBackendConnected = false;
    notifyListeners();
    _checkServerConnection();
  }
}
