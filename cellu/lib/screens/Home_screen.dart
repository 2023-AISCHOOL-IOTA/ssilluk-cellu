import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/services/logger_service.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/models/blood_sugar_model.dart';
import 'package:cellu/models/dose_schedule_model.dart';
import 'package:cellu/widgets/blood_sugar_summary.dart';
import 'package:cellu/widgets/blood_sugar_line_chart.dart';
import 'package:cellu/widgets/dose_schedule_card.dart';

// 메인 화면 위젯
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDate = DateTime.now(); // 현재 선택된 날짜
  List<DoseScheduleItem> doseScheduleItems = []; // 약물 관리 데이터
  Map<int, List<int>> bloodSugarData = {}; // 혈당 데이터
  bool isLoading = true;
  String userId = '';

  @override
  void initState() {
    super.initState();
    _fetchDataForSelectedDate();
  }

  // 데이터를 가져오는 함수
  Future<void> _fetchDataForSelectedDate() async {
    final token = UserTokenManager.getToken();

    if (token != null) {
      try {
        // 사용자 ID를 서버에서 가져오는 요청
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
        final bloodSugarDataResponse =
            await BloodSugarModel(token).fetchBloodSugarData(userId);

        setState(() {
          bloodSugarData = bloodSugarDataResponse;
          isLoading = false;
        });

        // 약 복용 스케줄 데이터 로드
        final doseScheduleResponse =
            await DoseScheduleItemModel().fetchDoseScheduleData(token);

        setState(() {
          doseScheduleItems = doseScheduleResponse;
          isLoading = false;
        });
      } catch (e) {
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
      // 로딩 중 화면 표시
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // 날짜 선택 바를 표시하는 메소드
    Widget _buildDateSelector() {
      return Container(
        height: 60,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 90,
          itemBuilder: (context, index) {
            DateTime date = DateTime.now().subtract(Duration(days: index));
            bool isSelected = selectedDate == date;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                  _fetchDataForSelectedDate();
                });
              },
              child: Container(
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  DateFormat('MM/dd').format(date),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    // 달력 아이콘에서 날짜 선택 시 처리
    void _onCalendarIconPressed() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _fetchDataForSelectedDate();
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white, // Scaffold 배경색을 흰색으로 설정
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: SvgPicture.asset('assets/logo-small.svg', width: 60),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: _onCalendarIconPressed),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDateSelector(),
            BloodSugarLineChart(bloodSugarData),
            BloodSugarSummary(bloodSugarData),
            DoseScheduleCard(scheduleItems: doseScheduleItems),
          ],
        ),
      ),
    );
  }

// 선택된 날짜에 해당하는 혈당 데이터만 필터링하는 메소드
  Map<int, List<int>> _filterDataBySelectedDate(Map<int, List<int>> data) {
    String selectedDateString = DateFormat('yyyyMMdd').format(selectedDate);
    Map<int, List<int>> filteredData = {};
    data.forEach((key, value) {
      // key를 날짜 형식으로 변환
      String dataDateString = DateFormat('yyyyMMdd')
          .format(DateTime.fromMillisecondsSinceEpoch(key));
      if (dataDateString == selectedDateString) {
        filteredData[key] = value;
      }
    });

    return filteredData;
  }

  // 선택된 날짜에 해당하는 약물 관리 데이터를 필터링하는 메소드
  List<DoseScheduleItem> _filterDoseDataBySelectedDate() {
    String selectedDateString = DateFormat('yyyy-MM-dd').format(selectedDate);
    return doseScheduleItems.where((item) {
      return item.doseTime == selectedDateString;
    }).toList();
  }
}
