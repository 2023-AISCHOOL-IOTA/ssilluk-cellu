// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// // DateSelector: 날짜 선택 로직을 관리
// // BloodSugarManager: 혈당 데이터를 관리
// // DayItem: 각 날짜를 표시하는 UI 구성요소를 관리
//
// // TODO : 날짜 선택 로직을 담당하는 클래스
// class DateSelector {
//   int selectedYear;
//   int selectedMonth;
//   int? selectedDate;
//
//   DateSelector(this.selectedYear, this.selectedMonth);
//
//   void selectDate(int date) {
//     selectedDate = date;
//   }
//
//   List<DropdownMenuItem<int>> getYearDropdownItems() {
//     List<DropdownMenuItem<int>> items = [];
//     for (int year = selectedYear - 5; year <= selectedYear + 5; year++) {
//       items.add(DropdownMenuItem(
//         value: year,
//         child: Text('$year년'),
//       ));
//     }
//     return items;
//   }
//
//   List<DropdownMenuItem<int>> getMonthDropdownItems() {
//     List<DropdownMenuItem<int>> items = [];
//     for (int month = 1; month <= 12; month++) {
//       items.add(DropdownMenuItem(
//         value: month,
//         child: Text('$month월'),
//       ));
//     }
//     return items;
//   }
// }
//
// // TODO : 혈당 데이터를 관리하는 클래스
// class BloodSugarManager {
//   Map<int, List<int>> bloodSugarData;
//
//   BloodSugarManager(this.bloodSugarData);
//
//   // FIXME : 서버에서 실제 혈당 데이터를 받아와서 여기에 채워넣어야 함. 현재는 임시 데이터로 채워져 있음.
//   void fetchData() {
//     // FIXME : 서버에서 데이터를 가져오는 로직
//   }
//
//   Color getSugarLevelColor(int level, bool isMax) {
//     if (isMax && level >= 140) {
//       return Colors.red;
//     } else if (!isMax && level <= 60) {
//       return Colors.blue;
//     }
//     return Colors.black;
//   }
// }
//
// // TODO : 각 날짜를 표시하는 UI 구성요소를 담당하는 클래스
// class DayItem extends StatelessWidget {
//   final int day;
//   final List<int> sugarData;
//   final bool isSelected;
//   final Color color;
//
//   DayItem(
//       {required this.day,
//       required this.sugarData,
//       this.isSelected = false,
//       required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // 날짜 선택 로직
//       },
//       child: Container(
//         width: 60,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: isSelected ? color : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${day}일',
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // 혈당 데이터 표시
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // NOTE : MainScreen은 앱에서 사용자에게 표시되는 주 화면을 관리하는 StatefulWidget 입니다.
// class MainScreen extends StatefulWidget {
//   // NOTE : 기본 생성자에서 선택적으로 Key를 전달받을 수 있습니다.
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   // NOTE : createState는 Flutter 프레임워크에 의해 호출되며, MainScreen의 상태를 생성합니다.
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int? selectedDate;
//   int selectedMonth = DateTime.now().month;
//   int selectedYear = DateTime.now().year;
//   int today = DateTime.now().day;
//
//   // TODO : 혈당 데이터, 백엔드에서 실제 데이터를 받아와야 함
//   // 서버에서 실제 혈당 데이터를 받아오는 로직 구현 필요
//   Map<int, List<int>> bloodSugarData = {
//     // 혈당 데이터
//   };
//
//   // NOTE : 선택된 날짜 업데이트
//   void selectDate(int date) {
//     setState(() {
//       selectedDate = date;
//     });
//   }
//
//   // NOTE : 연도 선택 드롭다운 메뉴 아이템 생성
//   List<DropdownMenuItem<int>> getYearDropdownItems() {
//     List<DropdownMenuItem<int>> items = [];
//     for (int year = selectedYear - 5; year <= selectedYear + 5; year++) {
//       items.add(DropdownMenuItem(
//         value: year,
//         child: Text('$year년'),
//       ));
//     }
//     return items;
//   }
//
//   // NOTE : 월 선택 드롭다운 메뉴 아이템 생성
//   List<DropdownMenuItem<int>> getMonthDropdownItems() {
//     List<DropdownMenuItem<int>> items = [];
//     for (int month = 1; month <= 12; month++) {
//       items.add(DropdownMenuItem(
//         value: month,
//         child: Text('$month월'),
//       ));
//     }
//     return items;
//   }
//
//   // NOTE : 해당 월의 일수 계산
//   int getDaysInMonth(int year, int month) {
//     return DateTime(year, month + 1, 0).day;
//   }
//
//   // NOTE : 화면 새로고침, 날짜 선택 초기화
//   void refresh() {
//     setState(() {
//       selectedDate = null;
//     });
//   }
//
//   // NOTE : 혈당 수준에 따른 색상 지정
//   // FIXME: 혈당 수준에 따른 색상 지정 로직 검토 및 수정 혹시 필요할 수 있음!
//   Color getSugarLevelColor(int level, bool isMax) {
//     if (isMax && level >= 140) {
//       return Colors.red;
//     } else if (!isMax && level <= 60) {
//       return Colors.blue;
//     }
//     return Colors.black;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int daysInMonth = getDaysInMonth(selectedYear, selectedMonth);
//
//     return Scaffold(
//       appBar: AppBar(
//         // AppBar 설정
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [],
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 로고 및 드롭다운 메뉴 구성
//             _buildLogoAndDropdowns(),
//
//             // 날짜별 혈당 데이터 리스트
//             _buildSugarDataList(daysInMonth),
//
//             // 추가 위젯
//             // FIXME : 혈당 꺽은선 그래프 차트
//             LineChartSample(
//                 bloodSugarData: bloodSugarData, selectedDate: selectedDate),
//
//             // FIXME : 혈당 정보 (최고, 최저, 식전후 평균 혈당)
//             // 혈당 데이터와 선택된 날짜를 인자로 받을 수 있도록 구현
//             BloodSugarSummary(key: UniqueKey(), summaryData: summaryData),
//
//             // TODO : 평균 심박도 위젯 추가하기
//             // 심박도 데이터와 선택된 날짜를 인자로 전달
//             // FIXME : heartRateData 찾기
//             HeartRateChart(
//                 heartRateData: heartRateData, selectedDate: selectedDate),
//
//             // TODO : 스트레스 지수 위젯 추가하기
//             // 스트레스 지수 데이터와 선택된 날짜를 인자로 전달
//             // FIXME : stressIndexData 찾기
//             StressIndexChart(
//                 stressIndexData: stressIndexData, selectedDate: selectedDate),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // NOTE : 로고 및 드롭다운 위젯 구성
//   Widget _buildLogoAndDropdowns() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20.0),
//       child: Column(
//         children: [
//           SvgPicture.asset(
//             'assets/logo-small.svg',
//             semanticsLabel: '로고',
//             width: 80,
//           ),
//           _buildDateRefreshRow(),
//         ],
//       ),
//     );
//   }
//
//   // NOTE : 연도, 월 드롭다운 및 새로고침 버튼 구성
//   Widget _buildDateRefreshRow() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, top: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildYearMonthDropdowns(),
//           IconButton(
//             onPressed: refresh,
//             icon: Icon(Icons.refresh),
//             color: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // NOTE : 연도 및 월 드롭다운 위젯
//   Widget _buildYearMonthDropdowns() {
//     return Row(
//       children: [
//         DropdownButton<int>(
//           value: selectedYear,
//           items: getYearDropdownItems(),
//           onChanged: (int? newValue) {
//             setState(() {
//               selectedYear = newValue!;
//               selectedDate = null;
//             });
//           },
//         ),
//         SizedBox(width: 20),
//         DropdownButton<int>(
//           value: selectedMonth,
//           items: getMonthDropdownItems(),
//           onChanged: (int? newValue) {
//             setState(() {
//               selectedMonth = newValue!;
//               selectedDate = null;
//             });
//           },
//         ),
//       ],
//     );
//   }
//
//   // NOTE : 날짜별 혈당 데이터 리스트 위젯
//   Widget _buildSugarDataList(int daysInMonth) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: daysInMonth,
//         itemBuilder: (context, index) {
//           int day = index + 1;
//           bool isSelectedDate = selectedDate == day;
//           List<int> sugarData = bloodSugarData[day] ?? [0, 0];
//
//           return GestureDetector(
//             onTap: () => selectDate(day),
//             child: Container(
//               width: 60,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: isSelectedDate
//                     ? Colors.indigo
//                     : (today == day ? Colors.grey[300] : Colors.transparent),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${day}일',
//                     style: TextStyle(
//                       color: isSelectedDate ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     '${sugarData[0]}',
//                     style: TextStyle(
//                       color: getSugarLevelColor(sugarData[0], true),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     '${sugarData[1]}',
//                     style: TextStyle(
//                       color: getSugarLevelColor(sugarData[1], false),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // --------------------------------------------
// // 혈당 평균
// // TODO : 식전 혈당 평균을 계산하는 함수
// double calculateFastingBloodSugarAverage() {
//   // TODO : 여기에 식전 혈당들이 들어가야해요
//   List<int> fastingBloodSugarData = [95, 100, 90, 105, 110];
//   if (fastingBloodSugarData.isEmpty) {
//     return 0; // 데이터가 없을 경우 0을 반환
//   }
//   // 데이터 합계 계산
//   int sum = fastingBloodSugarData.reduce((a, b) => a + b);
//   // 데이터 평균 계산
//   double average = sum / fastingBloodSugarData.length;
//   return average;
// }
//
// // TODO : 식후 혈당 평균을 계산하는 함수
// double calculatePostprandialBloodSugarAverage() {
//   // TODO : 여기에 식후 혈당만 들어가야해요
//   List<int> postprandialBloodSugarData = [140, 150, 130, 155, 160];
//
//   if (postprandialBloodSugarData.isEmpty) {
//     return 0; // 데이터가 없을 경우 0을 반환
//   }
//
//   // 데이터 합계 계산
//   int sum = postprandialBloodSugarData.reduce((a, b) => a + b);
//
//   // 데이터 평균 계산
//   double average = sum / postprandialBloodSugarData.length;
//
//   return average;
// }
//
// // TODO : 최고혈당, 식전 평균혈당, 식후 평균혈당, 최저혈당 호출
// class BloodSugarSummary extends StatelessWidget {
//   final Map<String, int> summaryData;
//
//   const BloodSugarSummary({
//     Key? key,
//     required this.summaryData,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // 여기에는 최고혈당, 평균혈당, 최저혈당을 summaryData로부터 가져와서 표시하는 로직을 추가합니다.
//     // 예를 들어, summaryData가 {'max': 160, 'min': 95, 'average': 120} 같은 값을 가지고 있다고 가정합니다.
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[2000], // 연한 회색 배경색 설정
//         borderRadius: BorderRadius.all(Radius.circular(20)), //
//       ),
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Flexible(
//             child: _buildSummaryItem(
//                 '최고혈당', '${summaryData['max']} mg/dL', Colors.red),
//             flex: 1,
//           ),
//           Flexible(
//             child: _buildSummaryItem(
//                 '최저혈당', '${summaryData['min']} mg/dL', Colors.blue),
//             flex: 1,
//           ),
//           Flexible(
//             child: _buildSummaryItem('식전 평균혈당',
//                 '${calculateFastingBloodSugarAverage()} mg/dL', Colors.orange),
//             flex: 1,
//           ),
//           Flexible(
//             child: _buildSummaryItem(
//                 '식후 평균혈당',
//                 '${calculatePostprandialBloodSugarAverage()} mg/dL',
//                 Colors.green),
//             flex: 1,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 여긴 디자인 로직입니다.
//   Widget _buildSummaryItem(String title, String value, Color color) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text(
//           title,
//           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyle(
//               fontSize: 16, fontWeight: FontWeight.bold, color: color),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
//
// // --------------------------------------------
//
// // TODO : 혈당 차트 클래스 입니다.
//
// // 차트 클래스
// class LineChartSample extends StatelessWidget {
//   final Map<int, List<int>> bloodSugarData; // 혈당 데이터를 매개변수로 받음
//   final int selectedDate; // 선택된 날짜
//
//   LineChartSample({required this.bloodSugarData, required this.selectedDate});
//
//   @override
//   Widget build(BuildContext context) {
//     // 선택된 날짜에 해당하는 혈당 데이터를 가져옴
//     List<int> sugarData = bloodSugarData[selectedDate] ?? [0, 0];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Text(
//             "혈당 수치",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
//           child: Text(
//             '(단위: mg/dL)',
//             style: TextStyle(
//               color: Color(0xff67727d).withOpacity(0.6),
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 24.0, left: 16.0),
//             child: LineChart(
//               LineChartData(
//                 // 차트 구성 데이터
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: true,
//                   checkToShowHorizontalLine: (value) => value % 30 == 0,
//                   checkToShowVerticalLine: (value) => value % 4 == 0,
//                   getDrawingHorizontalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                   getDrawingVerticalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff68737d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return '0시';
//                         case 4:
//                           return '4시';
//                         case 8:
//                           return '8시';
//                         case 12:
//                           return '12시';
//                         case 16:
//                           return '16시';
//                         case 20:
//                           return '20시';
//                         default:
//                           return '';
//                       }
//                     },
//                     margin: 8,
//                     interval: 1,
//                   ),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff67727d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                     getTitles: (value) {
//                       return '${value.toInt()}';
//                     },
//                     reservedSize: 28,
//                     margin: 12,
//                     interval: 30,
//                   ),
//                 ),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(color: const Color(0xff37434d), width: 1),
//                 ),
//                 minX: 0,
//                 maxX: 23,
//                 minY: 0,
//                 maxY: 260,
//
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: _createSpotsFromData(sugarData),
//                     isCurved: false,
//                     colors: [Colors.black],
//                     // 선 색상 변경
//                     barWidth: 2,
//                     // 선 두께 설정
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(
//                       show: true,
//                       getDotPainter: (spot, percent, barData, index) =>
//                           FlDotCirclePainter(
//                         radius: 4, // 포인트 크기 설정
//                         color: Colors.blueAccent, // 포인트 색상 변경
//                         strokeWidth: 0,
//                       ),
//                     ),
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//                 lineTouchData: LineTouchData(
//                   touchTooltipData: LineTouchTooltipData(
//                     tooltipBgColor: Colors.black,
//                     getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                       return touchedSpots.map((barSpot) {
//                         final xValue = barSpot.x.toInt(); // x 값을 정수로 변환
//                         final yValue = barSpot.y.toInt(); // y 값을 정수로 변화
//                         return LineTooltipItem(
//                           '$xValue:00 \n$yValue mg/dL', // 변환된 값을 사용
//                           const TextStyle(color: Colors.white), // 텍스트 색상 변경
//                         );
//                       }).toList();
//                     },
//                   ),
//                   touchCallback: (LineTouchResponse touchResponse) {},
//                   handleBuiltInTouches: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // 혈당 데이터를 바탕으로 FlSpot 리스트 생성
//   List<FlSpot> _createSpotsFromData(List<int> sugarData) {
//     // TODO: 서버에서 실시간 혈당 데이터를 받아와서 차트에 반영해야 함.
//     // 현재는 선택된 날짜의 데이터를 기반으로 임시 스팟을 생성함.
//     return List.generate(sugarData.length, (index) {
//       return FlSpot(index.toDouble(), sugarData[index].toDouble());
//     });
//   }
// }
//
// // --------------------------------------------
// // TODO : 평균 심박도 위젯 만들기
// class HeartRateChart extends StatelessWidget {
//   final Map<int, int> heartRateData; // 시간별 심박수 데이터
//   final int selectedDate; // 선택된 날짜
//
//   HeartRateChart({required this.heartRateData, required this.selectedDate});
//
//   @override
//   Widget build(BuildContext context) {
//     // 선택된 날짜에 해당하는 심박수 데이터를 FlSpot 리스트로 변환
//     List<FlSpot> spots = heartRateData.entries
//         .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
//         .toList();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Text(
//             '심박도 수치',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
//           child: Text(
//             '(단위: bpm)',
//             style: TextStyle(
//               color: Color(0xff67727d).withOpacity(0.6),
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 24.0, left: 16.0),
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: true,
//                   checkToShowHorizontalLine: (value) => value % 10 == 0,
//                   checkToShowVerticalLine: (value) => value % 4 == 0,
//                   getDrawingHorizontalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                   getDrawingVerticalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff68737d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return '0시';
//                         case 4:
//                           return '4시';
//                         case 8:
//                           return '8시';
//                         case 12:
//                           return '12시';
//                         case 16:
//                           return '16시';
//                         case 20:
//                           return '20시';
//                         default:
//                           return '';
//                       }
//                     },
//                     margin: 8,
//                     interval: 1,
//                   ),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff67727d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                     getTitles: (value) {
//                       return '${value.toInt()}';
//                     },
//                     reservedSize: 28,
//                     margin: 12,
//                     interval: 10,
//                   ),
//                 ),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(color: const Color(0xff37434d), width: 1),
//                 ),
//                 minX: 0,
//                 maxX: 23,
//                 minY: 60,
//                 maxY: 90,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: spots,
//                     isCurved: false,
//                     colors: [Colors.black],
//                     // 심박수 선 색상 변경
//                     barWidth: 2,
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(
//                       show: true,
//                       getDotPainter: (spot, percent, barData, index) =>
//                           FlDotCirclePainter(
//                         radius: 4,
//                         color: Colors.redAccent, // 심박수 포인트 색상 변경
//                         strokeWidth: 0,
//                       ),
//                     ),
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//                 lineTouchData: LineTouchData(
//                   touchTooltipData: LineTouchTooltipData(
//                     tooltipBgColor: Colors.black,
//                     getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                       return touchedSpots.map((barSpot) {
//                         final xValue = barSpot.x.toInt();
//                         final yValue = barSpot.y.toInt();
//                         return LineTooltipItem(
//                           '$xValue:00 \n$yValue bpm',
//                           const TextStyle(color: Colors.white),
//                         );
//                       }).toList();
//                     },
//                   ),
//                   touchCallback: (LineTouchResponse touchResponse) {},
//                   handleBuiltInTouches: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // --------------------------------------------
// // TODO : 스트레스 지수 위젯 만들기
// class StressIndexChart extends StatelessWidget {
//   final Map<int, double> stressIndexData; // 시간별 스트레스 지수 데이터
//   final int selectedDate; // 선택된 날짜
//
//   StressIndexChart({required this.stressIndexData, required this.selectedDate});
//
//   @override
//   Widget build(BuildContext context) {
//     // 선택된 날짜에 해당하는 스트레스 지수 데이터를 FlSpot 리스트로 변환
//     List<FlSpot> spots = stressIndexData.entries
//         .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
//         .toList();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Text(
//             '스트레스 수치',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
//           child: Text(
//             '(단위: 지수)',
//             style: TextStyle(
//               color: Color(0xff67727d).withOpacity(0.6),
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 300,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 24.0, left: 16.0),
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(
//                   show: true,
//                   drawVerticalLine: true,
//                   checkToShowHorizontalLine: (value) => value % 0.2 == 0,
//                   checkToShowVerticalLine: (value) => value % 4 == 0,
//                   getDrawingHorizontalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                   getDrawingVerticalLine: (value) {
//                     return FlLine(
//                       color: const Color(0xff37434d),
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff68737d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return '0시';
//                         case 4:
//                           return '4시';
//                         case 8:
//                           return '8시';
//                         case 12:
//                           return '12시';
//                         case 16:
//                           return '16시';
//                         case 20:
//                           return '20시';
//                         default:
//                           return '';
//                       }
//                     },
//                     margin: 8,
//                     interval: 1,
//                   ),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (context, value) => const TextStyle(
//                       color: Color(0xff67727d),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                     getTitles: (value) {
//                       return value.toStringAsFixed(1);
//                     },
//                     reservedSize: 28,
//                     margin: 12,
//                     interval: 0.2,
//                   ),
//                 ),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(color: const Color(0xff37434d), width: 1),
//                 ),
//                 minX: 0,
//                 maxX: 23,
//                 minY: 0,
//                 maxY: 1,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: spots,
//                     isCurved: false,
//                     colors: [Colors.black],
//                     // 스트레스 지수 선 색상 변경
//                     barWidth: 2,
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(
//                       show: true,
//                       getDotPainter: (spot, percent, barData, index) =>
//                           FlDotCirclePainter(
//                         radius: 4,
//                         color: Colors.purpleAccent, // 스트레스 지수 포인트 색상 변경
//                         strokeWidth: 0,
//                       ),
//                     ),
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//                 lineTouchData: LineTouchData(
//                   touchTooltipData: LineTouchTooltipData(
//                     tooltipBgColor: Colors.black,
//                     getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                       return touchedSpots.map((barSpot) {
//                         final xValue = barSpot.x.toInt();
//                         final yValue = barSpot.y.toDouble();
//                         return LineTooltipItem(
//                           '$xValue:00 \n${yValue.toStringAsFixed(2)}',
//                           // y 값 소수점 2자리까지 표시
//                           const TextStyle(color: Colors.white),
//                         );
//                       }).toList();
//                     },
//                   ),
//                   touchCallback: (LineTouchResponse touchResponse) {},
//                   handleBuiltInTouches: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
