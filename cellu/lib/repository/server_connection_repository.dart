import 'dart:convert';
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

  // 서버로부터 데이터를 가져오는 일반화된 함수
  Future<dynamic> fetchData(String url, {Map<String, String>? headers}) async {
    try {
      LoggerService.info('Sending a GET request to fetch data');
      final response = await http.get(Uri.parse(url), headers: headers);
      LoggerService.info('Received response from server: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch data from server');
      }
    } catch (e) {
      LoggerService.error('Error fetching data from server: $e');
      throw Exception('Error fetching data from server: $e');
    }
  }
}
