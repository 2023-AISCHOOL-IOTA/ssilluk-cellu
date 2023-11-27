import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/models/dose_schedule_model.dart';

class DoseScheduleCard extends StatelessWidget {
  final List<DoseScheduleItem> scheduleItems;

  const DoseScheduleCard({Key? key, required this.scheduleItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets =
        scheduleItems.map((item) => item.build(context)).toList();

    return Container(
      margin: EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardCornerRadius),
        ),
        color: AppColors.dosePrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.doseItemPadding,
                horizontal: AppDimensions.pagePaddingHorizontal,
              ),
              decoration: BoxDecoration(
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
                      // TODO: '추가' 버튼이 클릭되었을 때의 동작을 정의합니다.
                    },
                  ),
                ],
              ),
            ),
            ...itemWidgets,
          ],
        ),
      ),
    );
  }
}
