import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';

class BloodSugarSummary extends StatelessWidget {
  final Map<int, List<int>> bloodSugarData;

  BloodSugarSummary(this.bloodSugarData);

  @override
  Widget build(BuildContext context) {
    final bloodSugarValues =
    bloodSugarData.values.expand((list) => list).toList();

    // 혈당 데이터가 없는 경우 기본 값을 표시
    if (bloodSugarValues.isEmpty) {
      return Center(child: Text('혈당 데이터가 없습니다.', style: AppStyles.errorStyle));
    }

    // 혈당 데이터의 최대, 최소, 평균 값을 계산
    final maxSugar =
    bloodSugarValues.reduce((curr, next) => curr > next ? curr : next);
    final minSugar =
    bloodSugarValues.reduce((curr, next) => curr < next ? curr : next);
    final averageSugar = bloodSugarValues.fold(0, (sum, item) => sum + item) /
        bloodSugarValues.length;

    return Container(
      padding: EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.lightGreyOpacity20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSummaryItem('최고혈당', '$maxSugar mg/dL', AppColors.red),
          _buildSummaryItem('평균혈당', '${averageSugar.toStringAsFixed(1)} mg/dL',
              AppColors.primaryColor),
          _buildSummaryItem('최저혈당', '$minSugar mg/dL', AppColors.blue),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title, style: AppStyles.doseItemTitleStyle),
        SizedBox(height: 4),
        Text(value,
            style: AppStyles.doseItemAmountStyle.copyWith(color: color)),
      ],
    );
  }
}
