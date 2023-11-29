import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cellu/styles.dart';

class BloodSugarLineChart extends StatelessWidget {
  final Map<DateTime, List<int>> bloodSugarData;
  final DateTime selectedDate;

  BloodSugarLineChart(
      {super.key, required this.bloodSugarData, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<int>> filteredData = _filterDataForSelectedDate();

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.pagePaddingHorizontal),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: LineChart(_buildLineChartData(filteredData)),
      ),
    );
  }

  Map<DateTime, List<int>> _filterDataForSelectedDate() {
    Map<DateTime, List<int>> filteredData = {};
    DateTime startDate = DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, 0, 0, 0);

    bloodSugarData.forEach((dateTime, values) {
      if (dateTime.year == selectedDate.year &&
          dateTime.month == selectedDate.month &&
          dateTime.day == selectedDate.day) {
        filteredData[dateTime] = values;
      }
    });
    return filteredData;
  }

  LineChartData _buildLineChartData(Map<DateTime, List<int>> filteredData) {
    // Remaining chart setup code
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: _buildBorderData(),
      lineBarsData: _buildLineBarsData(filteredData),
      minX: 0,
      maxX: 23,
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(enabled: false),
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

  List<LineChartBarData> _buildLineBarsData(
      Map<DateTime, List<int>> filteredData) {
    List<FlSpot> spots = [];
    filteredData.forEach((dateTime, values) {
      // Assuming 'hour' is the hour of the day for the timestamp
      // If hour is the timestamp, you need to convert it to the hour of the day
      double x = dateTime.hour.toDouble();
      values.forEach((value) {
        spots.add(FlSpot(x, value.toDouble()));
      });
    });

    // spots을 시간순으로 정렬
    spots.sort((a, b) => a.x.compareTo(b.x));

    return [
      LineChartBarData(
        spots: spots,
        isCurved: false,
        colors: [AppColors.primaryColor],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
      ),
    ];
  }
}
