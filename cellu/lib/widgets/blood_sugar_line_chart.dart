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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
      maxX: bloodSugarData.keys.length - 1,
      // X축 최대값 변경
      minY: 0,
      maxY: 300, // 예시 Y축 최대값, 혈당 데이터에 맞게 조정 필요
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppColors.greyOpacity80,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: AppColors.greyOpacity80,
          strokeWidth: 1,
        );
      },
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => AppStyles.doseItemSubtitleStyle,
        // x축 타이틀 설정 로직
        getTitles: (double value) {
          // 예시 로직: x축 값을 날짜로 표시
          return '${bloodSugarData.keys.elementAt(value.toInt())}일';
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
    // 예시 데이터로 차트 바 데이터 생성, 실제 데이터로 변경 필요
    return [
      LineChartBarData(
        spots: bloodSugarData.entries
            .map((entry) =>
                FlSpot(entry.key.toDouble(), entry.value.first.toDouble()))
            .toList(),
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
