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

  Future<Map<int, List<int>>> fetchBloodSugarData(String userId) async {
    final url = Uri.parse('${dotenv.env['BACKEND_URL']}/sensor');
    // POST 요청 전에 로그 추가
    LoggerService.info('Sending a GET request to fetch blood sugar data');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    // POST 요청 후에 로그 추가
    LoggerService.info('Received response from server: ${response.body}');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Map<int, List<int>> result = {};

      // 가장 최근의 데이터를 추적하기 위한 변수를 nullable 타입으로 선언
      DateTime? mostRecentTime;
      int? mostRecentValue;

      // 데이터 파싱 및 변환 로직
      for (var item in data) {
        int? bloodSugar = item['bloodsugar'];
        if (bloodSugar != null) {
          DateTime dateTime = DateTime.parse(item['created_at']);
          int hour = int.parse(DateFormat('H').format(dateTime));
          int hourGroup = (hour / 3).floor() * 3;

          result.putIfAbsent(hourGroup, () => []).add(bloodSugar);

          // 가장 최근의 데이터 업데이트
          if (mostRecentTime == null || dateTime.isAfter(mostRecentTime)) {
            mostRecentTime = dateTime;
            mostRecentValue = bloodSugar;
          }
        }
      }
      // 가장 최근의 데이터 추가 로직
      if (mostRecentValue != null && mostRecentTime != null) {
        int mostRecentHourGroup = (mostRecentTime!.hour / 3).floor() * 3;
        if (!result.containsKey(mostRecentHourGroup) ||
            !result[mostRecentHourGroup]!.contains(mostRecentValue)) {
          result
              .putIfAbsent(mostRecentHourGroup, () => [])
              .add(mostRecentValue);
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
