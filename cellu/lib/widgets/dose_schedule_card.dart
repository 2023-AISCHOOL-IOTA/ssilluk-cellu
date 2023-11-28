import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/models/dose_schedule_model.dart';
import 'package:cellu/screens/drugmanagement_page.dart';

// 약 복용 스케줄을 표시하는 카드 위젯
class DoseScheduleCard extends StatelessWidget {
  final List<DoseScheduleItem> scheduleItems;

  const DoseScheduleCard({Key? key, required this.scheduleItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DoseScheduleItem> recentItems = scheduleItems.take(5).toList();

    return Container(
      margin: const EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardCornerRadius),
        ),
        color: AppColors.dosePrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.doseItemPadding,
                horizontal: AppDimensions.pagePaddingHorizontal,
              ),
              decoration: const BoxDecoration(
                color: AppColors.dosePrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.cardCornerRadius),
                  topRight: Radius.circular(AppDimensions.cardCornerRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '약 복용',
                    style: AppStyles.doseItemTitleStyle
                        .copyWith(color: AppColors.white),
                  ),
                  IconButton(
                      icon: Icon(Icons.add, color: AppColors.white),
                      // '추가' 아이콘 버튼
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => DrugManagement()),
                        );
                      }),
                ],
              ),
            ),
            ...recentItems.map((item) => item.build(context)).toList(),
          ],
        ),
      ),
    );
  }
}
