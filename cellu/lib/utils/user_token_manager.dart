import 'package:cellu/services/logger_service.dart';

class UserTokenManager {
  static String? _token;

  // 토큰 설정
  static void setToken(String token) {
    _token = token;
  }

  // 현재 토큰 가져오기
  static String? getToken() {
    return _token;
  }

  // 토큰이 설정되었는지 확인
  static bool isTokenSet() {
    return _token != null;
  }

  // 토큰 제거
  static void clearToken() {
    _token = null;
  }
}
