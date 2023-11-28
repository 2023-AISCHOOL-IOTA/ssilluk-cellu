import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:cellu/styles.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/services/logger_service.dart';
import 'package:intl/intl.dart';

class BloodSugarModel {
  final String token; // 사용자의 JWT 토큰
  BloodSugarModel(this.token);

  Future<Map<DateTime, List<int>>> fetchBloodSugarData(String userId) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/sensor');
    // POST 요청 전에 로그 추가
    LoggerService.info('Sending a GET request to fetch blood sugar data');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    // POST 요청 후에 로그 추가
    LoggerService.info('Received response from server: ${response.body}');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Map<DateTime, List<int>> result = {};

      // 데이터 파싱 및 변환 로직
      for (var item in data) {
        int? bloodSugar = item['bloodsugar'];
        if (bloodSugar != null) {
          DateTime utcDateTime = DateTime.parse(item['created_at']);
          DateTime localDateTime = utcDateTime.toLocal();

          result.putIfAbsent(localDateTime, () => []).add(bloodSugar);
        }
      }
      return result;
    } else {
      // 오류 처리
      throw Exception('Failed to load blood sugar data');
    }
  }

  Color getSugarLevelColor(int level, bool isMax) {
    if (isMax && level >= 140) {
      return AppColors.red;
    } else if (!isMax && level <= 60) {
      return AppColors.blue;
    }
    return AppColors.black;
  }
}
