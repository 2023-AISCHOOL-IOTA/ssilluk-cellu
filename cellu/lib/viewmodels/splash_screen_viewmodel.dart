import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../services/logger_service.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isBackendConnected = false; // 백엔드 연결 상태

  bool get isLoading => _isLoading;

  bool get isBackendConnected => _isBackendConnected; // 백엔드 연결 상태 확인

  SplashScreenViewModel() {
    loadData();
  }

  void loadData() async {
    try {
      // 환경 변수 로딩
      await dotenv.load(fileName: "assets/config/.env");

      // 비동기 작업 수행 중...
      await checkBackendConnection(); //  백엔드 연결 확인

      // 로딩 완료 후 상태 업데이트
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      LoggerService.error('데이터 로딩 실패: $e');
      // 추가: 에러 처리
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkBackendConnection() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['BACKEND_URL']!));
      _isBackendConnected = response.statusCode == 200;
    } catch (_) {
      _isBackendConnected = false;
    }
  }
}
