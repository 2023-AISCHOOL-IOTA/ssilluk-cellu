import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/services/logger_service.dart';

// 약 복용 스케줄 아이템 모델
class DoseScheduleItem {
  final String doseTime;
  final String mealYN;
  final String doseMedicine;
  final String doseAmount;
  final String? medicineType;

  DoseScheduleItem({
    required this.doseTime,
    required this.mealYN,
    required this.doseMedicine,
    required this.doseAmount,
    this.medicineType,
  });

  factory DoseScheduleItem.fromJson(Map<String, dynamic> json) {
    // JSON 데이터를 DoseScheduleItem 객체로 변환
    return DoseScheduleItem(
      doseTime: json['dose_time'],
      mealYN: json['meal_yn'],
      doseMedicine: json['dose_medicine'],
      doseAmount: json['dose_amount'],
      medicineType: json['medicine_type'],
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 0.1),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.pagePaddingHorizontal,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              doseTime,
              style: AppStyles.doseItemSubtitleStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              mealYN == 'T' ? '식후' : '식전',
              style: AppStyles.doseItemSubtitleStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              doseMedicine,
              style: AppStyles.doseItemSubtitleStyle,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              doseAmount,
              style: AppStyles.doseItemSubtitleStyle,
            ),
          ),
          if (medicineType != null)
            Expanded(
              flex: 2,
              child: Text(
                medicineType!,
                style: AppStyles.doseItemSubtitleStyle,
              ),
            ),
        ],
      ),
    );
  }
}

// 약 복용 스케줄 데이터를 가져오는 모델
class DoseScheduleItemModel {
  Future<List<DoseScheduleItem>> fetchDoseScheduleData(String token) async {
    try {
      // 토큰 검증
      if (token.isEmpty) {
        throw Exception('Token is not set.');
      }

      // POST 요청 전에 로그 추가
      LoggerService.info('Sending a GET request to fetch dose schedule data');
      final url = Uri.parse('${dotenv.env['BACKEND_URL']}/dose');
      final response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      // POST 요청 후에 로그 추가
      LoggerService.info('Received response from server: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => DoseScheduleItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load dose schedule data');
      }
    } catch (e) {
      LoggerService.error('Error fetching dose schedule data: $e');
      throw Exception('Failed to load dose schedule data');
    }
  }
}
