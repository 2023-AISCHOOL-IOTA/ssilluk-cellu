import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cellu/services/logger_service.dart';

class ServerConnectionRepository {
  Future<bool> checkConnection() async {
    try {
      // 서버 연결 상태 확인
      LoggerService.info('Sending a GET request to check connection');
      final response = await http.get(Uri.parse(dotenv.env['BACKEND_URL']!));
      LoggerService.info('Received response from server: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      // 오류 발생 시 로그 추가
      LoggerService.error('Server Connection Failed', error: e);

      if (e is http.ClientException) {
        // HTTP 클라이언트 예외의 경우
        LoggerService.error('HTTP Client Exception', error: e.message);
      } else {
        // 기타 예외의 경우
        LoggerService.error('Unknown Exception', error: e.toString());
      }

      throw Exception('Server Connection Failed: $e');
    }
  }
}
