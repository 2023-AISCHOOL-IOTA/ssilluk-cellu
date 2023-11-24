import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cellu/styles.dart';

class LineChart extends StatelessWidget {
  final Map<int, List<int>> bloodSugarData;

  LineChart(this.bloodSugarData);

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
        child: LineChart(
          LineChartData(
            gridData: _buildGridData(),
            titlesData: _buildTitlesData(),
            borderData: _buildBorderData(),
            minX: 0,
            maxX: bloodSugarData.keys.reduce(max),
            // x축 최대값
            minY: 0,
            maxY: bloodSugarData.values.expand((i) => i).reduce(max),
            // y축 최대값
            lineBarsData: _buildLineBarsData(),
          ),
        ),
      ),
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
        // TODO: x축 타이틀 설정 로직
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
    // TODO: 혈당 데이터를 바탕으로 차트 바 데이터 생성 로직
    return [];
  }
}
