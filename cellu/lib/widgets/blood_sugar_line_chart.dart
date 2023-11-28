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
      minY: 0,
      maxY: 300,
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        if (value % 30 == 0) {
          return FlLine(
            color: AppColors.greyOpacity80,
            strokeWidth: 1,
          );
        }
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 0,
        );
      },
      getDrawingVerticalLine: (value) {
        if (value % 3 == 0) {
          return FlLine(
            color: AppColors.greyOpacity80,
            strokeWidth: 1,
          );
        }
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 0,
        );
      },
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => AppStyles.doseItemSubtitleStyle,
        getTitles: (value) {
          if (value % 30 == 0) {
            return '${value.toInt()}';
          }
          return '';
        },
        interval: 30,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => AppStyles.doseItemSubtitleStyle,
        getTitles: (double value) {
          int hour = bloodSugarData.keys.elementAt(value.toInt());
          return '${hour}시';
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
    List<FlSpot> spots = [];
    bloodSugarData.forEach((hour, values) {
      values.forEach((value) {
        spots.add(FlSpot(hour.toDouble(), value.toDouble()));
      });
    });

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
