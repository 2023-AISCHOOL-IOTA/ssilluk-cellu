import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/repository/server_connection_repository.dart';
import 'package:cellu/services/logger_service.dart';

class BloodSugarModel {
  final String token; // 사용자의 JWT 토큰
  BloodSugarModel(this.token);

  Future<Map<DateTime, List<int>>> fetchBloodSugarData(String userId) async {
    final url = '${dotenv.env['BACKEND_URL']}/sensor';
    final headers = {'Authorization': 'Bearer $token'};

    // ServerConnectionRepository를 사용하여 데이터 가져오기
    var data =
        await ServerConnectionRepository().fetchData(url, headers: headers);

    Map<DateTime, List<int>> result = {};
    // 데이터 파싱 및 변환 로직
    for (var item in data) {
      int? bloodSugar = item['bloodsugar'];
      if (bloodSugar != null) {
        DateTime localDateTime = DateTime.parse(item['created_at']).toLocal();
        result.putIfAbsent(localDateTime, () => []).add(bloodSugar);
      }
    }
    return result;
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
