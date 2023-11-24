import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:cellu/widgets/blood_sugar_summary.dart';
import 'package:cellu/widgets/blood_sugar_line_chart.dart';
import 'package:cellu/widgets/dose_schedule_card.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/models/blood_sugar_model.dart';
import 'package:cellu/models/dose_schedule_model.dart';

import '../services/logger_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<DoseScheduleItem> doseScheduleItems = [];

  // Map<int, List<int>> bloodSugarData = {};
  bool isLoading = true;
  String userId = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final token = UserTokenManager.getToken();
    if (token != null) {
      try {
        // 사용자 ID를 서버에서 가져오는 요청을 추가
        final userIdResponse = await http.get(
            Uri.parse('${dotenv.env['BACKEND_URL']}/user/profile'),
            headers: {'Authorization': 'Bearer $token'});

        if (userIdResponse.statusCode == 200) {
          final userData = json.decode(userIdResponse.body);
          setState(() {
            userId = userData['user_id'];
          });
        }

        // 혈당 데이터 로드
        // final bloodSugarDataResponse =
        //     await BloodSugarModel(token).fetchBloodSugarData(userId);
        // setState(() {
        //   bloodSugarData = bloodSugarDataResponse;
        //   isLoading = false;
        // });

        // 약 복용 스케줄 데이터 로드
        final doseScheduleResponse =
            await DoseScheduleItemModel().fetchDoseScheduleData(token);

        setState(() {
          doseScheduleItems = doseScheduleResponse;
          isLoading = false;
        });
      } catch (e) {
        print('Error fetching data: $e');
        LoggerService.error('Error fetching data: $e');
        // 오류 처리
      }
    } else {
      // 토큰이 없을 경우 처리
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/logo-small.svg', width: 80),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BloodSugarSummary(bloodSugarData),
            // BloodSugarLineChart(bloodSugarData),
            DoseScheduleCard(scheduleItems: doseScheduleItems),
          ],
        ),
      ),
    );
  }
}
