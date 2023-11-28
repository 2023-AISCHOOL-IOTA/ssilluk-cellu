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
  DateTime selectedDate = DateTime.now();
  List<DoseScheduleItem> doseScheduleItems = [];
  Map<DateTime, List<int>> bloodSugarData = {};
  bool isLoading = true;
  String userId = '';

  @override
  void initState() {
    super.initState();
    _fetchDataForSelectedDate();
  }

  // 데이터를 가져오는 함수
  Future<void> _fetchDataForSelectedDate() async {
    setState(() => isLoading = true);
    final token = UserTokenManager.getToken();
    if (token != null) {
      try {
        await _fetchUserId(token);
        await Future.wait([
          _fetchBloodSugarData(token),
          _fetchDoseScheduleData(token),
        ]);
      } catch (e) {
        LoggerService.error('Error fetching data: $e');
      }
    }
    setState(() => isLoading = false);
  }

  Future<void> _fetchUserId(String token) async {
    final userIdResponse = await http.get(
      Uri.parse('${dotenv.env['BACKEND_URL']}/user/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (userIdResponse.statusCode == 200) {
      final userData = json.decode(userIdResponse.body);
      userId = userData['user_id'];
    }
  }

  Future<void> _fetchBloodSugarData(String token) async {
    bloodSugarData = await BloodSugarModel(token).fetchBloodSugarData(userId);
  }

  Future<void> _fetchDoseScheduleData(String token) async {
    doseScheduleItems = await DoseScheduleItemModel()
        .filterDoseScheduleByDate(doseScheduleItems, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    Map<DateTime, List<int>> filteredBloodSugarData =
        _filterBloodSugarDataBySelectedDate();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDateSelector(),
            BloodSugarLineChart(
                bloodSugarData: filteredBloodSugarData,
                selectedDate: selectedDate),
            BloodSugarSummary(filteredBloodSugarData),
            DoseScheduleCard(scheduleItems: doseScheduleItems),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      title: SvgPicture.asset('assets/logo-small.svg', width: 60),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _onCalendarIconPressed),
      ],
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 90,
        itemBuilder: (context, index) {
          DateTime date = DateTime.now().subtract(Duration(days: index));
          bool isSelected = selectedDate.isAtSameMomentAs(date);

          return GestureDetector(
            onTap: () => _onDateSelected(date),
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

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
      _fetchDataForSelectedDate();
    });
  }

  Map<DateTime, List<int>> _filterBloodSugarDataBySelectedDate() {
    Map<DateTime, List<int>> filteredData = {};

    bloodSugarData.forEach((dateTime, values) {
      if (dateTime.year == selectedDate.year &&
          dateTime.month == selectedDate.month &&
          dateTime.day == selectedDate.day) {
        filteredData[dateTime] = values;
      }
    });

    return filteredData;
  }
}
