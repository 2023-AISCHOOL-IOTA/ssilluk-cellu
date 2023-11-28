import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cellu/styles.dart';

class BloodSugarLineChart extends StatelessWidget {
  final Map<int, List<int>> bloodSugarData;

  BloodSugarLineChart(this.bloodSugarData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppDimensions.pagePaddingHorizontal),
      height: 300, // 차트의 높이
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: LineChart(_buildLineChartData()),
      ),
    );
  }

  LineChartData _buildLineChartData() {
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: _buildBorderData(),
      lineBarsData: _buildLineBarsData(),
      minX: 0,
      maxX: 23,
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(enabled: false), // 데이터 터치 비활성화
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 30,
      verticalInterval: 3,
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => AppStyles.doseItemSubtitleStyle,
        interval: 30,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => AppStyles.doseItemSubtitleStyle,
        interval: 3,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0시';
              case 3:
                return '3시';
              case 6:
                return '6시';
              case 9:
                return '9시';
              case 12:
                return '12시';
              case 15:
                return '15시';
              case 18:
                return '18시';
              case 21:
                return '21시';
              default:
                return '';
            }
          },
      ),
    );
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(color: AppColors.grey, width: 1),
    );
  }

  List<LineChartBarData> _buildLineBarsData() {
    List<FlSpot> spots = bloodSugarData.entries
        .expand((entry) => entry.value.map((value) => FlSpot(entry.key.toDouble(), value.toDouble())))
        .toList();

    // spots을 시간순으로 정렬
    spots.sort((a, b) => a.x.compareTo(b.x));

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        colors: [AppColors.primaryColor],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
      ),
    ];
  }
}
