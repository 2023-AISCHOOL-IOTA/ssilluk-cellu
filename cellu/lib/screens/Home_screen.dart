import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedDate;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  int today = DateTime.now().day;

  Map<int, List<int>> bloodSugarData = {
    1: [120, 80],
    2: [140, 90],
    // Add rest of the data for each day of the month
  };

  void selectDate(int date) {
    setState(() {
      selectedDate = date;
    });
  }

  List<DropdownMenuItem<int>> getYearDropdownItems() {
    List<DropdownMenuItem<int>> items = [];
    for (int year = selectedYear - 5; year <= selectedYear + 5; year++) {
      items.add(DropdownMenuItem(
        value: year,
        child: Text('$year년'),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> getMonthDropdownItems() {
    List<DropdownMenuItem<int>> items = [];
    for (int month = 1; month <= 12; month++) {
      items.add(DropdownMenuItem(
        value: month,
        child: Text('$month월'),
      ));
    }
    return items;
  }

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  void refresh() {
    setState(() {
      selectedDate = null;
    });
  }

  Color getSugarLevelColor(int level, bool isMax) {
    if (isMax && level >= 140) {
      return Colors.red;
    } else if (!isMax && level <= 60) {
      return Colors.blue;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = getDaysInMonth(selectedYear, selectedMonth);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SvgPicture.asset(
                  'assets/logo-small.svg',
                  semanticsLabel: '로고',
                  width: 80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      DropdownButton<int>(
                        value: selectedYear,
                        items: getYearDropdownItems(),
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedYear = newValue!;
                            selectedDate = null;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      DropdownButton<int>(
                        value: selectedMonth,
                        items: getMonthDropdownItems(),
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                            selectedDate = null;
                          });
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: refresh,
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daysInMonth,
                itemBuilder: (context, index) {
                  int day = index + 1;
                  bool isSelectedDate = selectedDate == day;
                  List<int> sugarData = bloodSugarData[day] ?? [0, 0];

                  return GestureDetector(
                    onTap: () => selectDate(day),
                    child: Container(
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelectedDate
                            ? Colors.indigo
                            : (today == day ? Colors.grey[300] : Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day}일',
                            style: TextStyle(
                              color: isSelectedDate ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${sugarData[0]}',
                            style: TextStyle(
                              color: getSugarLevelColor(sugarData[0], true),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${sugarData[1]}',
                            style: TextStyle(
                              color: getSugarLevelColor(sugarData[1], false),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            LineChartSample(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: BloodSugarSummary(),
            ),

            MedicineScheduleCard(),
          ],
        ),
      ),
    );
  }
}


// TODO : 최고혈당, 식전 평균혈당, 식후 평균혈당, 최저혈당 수정 필요
class BloodSugarSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[2000], // 연한 회색 배경색 설정
        borderRadius: BorderRadius.all(Radius.circular(20)), //
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: _buildSummaryItem('최고혈당', '160 mg/dL', Colors.red),
            flex: 1,
          ),
          Flexible(
            child: _buildSummaryItem('식전 평균혈당', '110 mg/dL', Colors.green),
            flex: 1,
          ),
          Flexible(
            child: _buildSummaryItem('식후 평균혈당', '150 mg/dL', Colors.blue),
            flex: 1,
          ),
          Flexible(
            child: _buildSummaryItem('최저혈당', '95 mg/dL', Colors.orange),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MedicineScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // 여기를 수정하여 Card의 모서리를 둥글게 합니다.
      ),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  약 복용',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    // 추가 버튼 클릭 시 동작
                    // TODO : 여기에 약 복용 페이지 이동 추가
                  },
                ),
              ],
            ),
          ),
          // TODO: 약물 수정 필요
          // FIXME : time : 데이터 작성한 시간 (text), Dosing_time : 투약 시기, Drug_type : 약물 유형, Drug_name: 약 이름, amount : 용량
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MedicineScheduleItem(
                  time: '13:20',
                  Dosing_time :'식후',
                  Drug_type: '초속효성',
                  Drug_name: '트레시바',
                  amount: '30',
                ),
                MedicineScheduleItem(
                  time: '18:01',
                  Dosing_time :'식전',
                  Drug_type: '지속형',
                  Drug_name: '리피토엠 20/500',
                  amount: '1.5',
                ),
                MedicineScheduleItem(
                  time: '18:01',
                  Dosing_time : '식전',
                  Drug_type: '동맥경화용제',
                  Drug_name: '리피토엠 20/500',
                  amount: '1.5',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineScheduleItem extends StatelessWidget {
  final String time;
  final String Dosing_time;
  final String Drug_type;
  final String Drug_name;
  final String amount;

  const MedicineScheduleItem({
    Key? key,
    required this.time,
    required this.Dosing_time,
    required this.Drug_type,
    required this.Drug_name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1, // 시간이 작으므로 flex를 2로 설정
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Dosing_time,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Drug_type,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Drug_name,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                amount,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
          child: Text(
            '(단위: mg/dL)',
            style: TextStyle(
              color: Color(0xff67727d).withOpacity(0.6),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 16.0),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  checkToShowHorizontalLine: (value) => value % 30 == 0,
                  checkToShowVerticalLine: (value) => value % 4 == 0,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return '0시';
                        case 4:
                          return '4시';
                        case 8:
                          return '8시';
                        case 12:
                          return '12시';
                        case 16:
                          return '16시';
                        case 20:
                          return '20시';
                        default:
                          return '';
                      }
                    },
                    margin: 8,
                    interval: 1,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      return '${value.toInt()}';
                    },
                    reservedSize: 28,
                    margin: 12,
                    interval: 30,
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                minX: 0,
                maxX: 23,
                minY: 0,
                maxY: 260,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(8, 95),
                      FlSpot(10, 140),
                      FlSpot(12, 110),
                      FlSpot(15, 150),
                      FlSpot(17, 125),
                      FlSpot(20, 160),
                    ],
                    isCurved: false,
                    colors: [Colors.black], // 선 색상 변경
                    barWidth: 2, // 선 두께 설정
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4, // 포인트 크기 설정
                        color: Colors. blueAccent, // 포인트 색상 변경
                        strokeWidth: 0,
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.black,
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((barSpot) {
                        final xValue = barSpot.x.toInt(); // x 값을 정수로 변환
                        final yValue = barSpot.y.toInt(); // y 값을 정수로 변화
                        return LineTooltipItem(
                          '$xValue:00 \n$yValue mg/dL', // 변환된 값을 사용
                          const TextStyle(color: Colors.white), // 텍스트 색상 변경
                        );
                      }).toList();
                    },
                  ),
                  touchCallback: (LineTouchResponse touchResponse) {},
                  handleBuiltInTouches: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 측정 시간 DB에서 받아오기
// import 'package:intl/intl.dart'; // intl 패키지를 import 합니다.
//
// // ...
//
// // DateTime 객체를 받아와서 포매팅하는 함수
// String formatTime(DateTime dateTime) {
//   final DateFormat formatter = DateFormat('HH:mm');
//   return formatter.format(dateTime);
// }
//
// // ...
//
// lineTouchData: LineTouchData(
// touchTooltipData: LineTouchTooltipData(
// tooltipBgColor: Colors.black,
// getTooltipItems: (List<LineBarSpot> touchedSpots) {
// return touchedSpots.map((barSpot) {
// final DateTime time = // DB에서 받아온 DateTime 객체를 여기에 할당하세요.
// final yValue = barSpot.y.toInt(); // y 값을 정수로 변환
// return LineTooltipItem(
// '${formatTime(time)} \n $yValue mg/dL', // 포매팅된 시간과 변환된 값을 사용
// const TextStyle(color: Colors.white),
// );
// }).toList();
// },
// ),
// touchCallback: (LineTouchResponse touchResponse) {},
// handleBuiltInTouches: true,
// ),
//

// 중앙 글시 넣기
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
// child:Center(
// child: Text(
// "혈당 수치",
// style: TextStyle(
// color: Colors.black,//글자 색상은 검정색
// fontWeight: FontWeight.bold,
// fontSize: 18
// ),
// ),
// ),
// ),