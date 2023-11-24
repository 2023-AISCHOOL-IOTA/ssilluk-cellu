import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/models/dose_schedule_model.dart';

class DoseScheduleCard extends StatelessWidget {
  final List<DoseScheduleItem> scheduleItems;

  const DoseScheduleCard({required this.scheduleItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: scheduleItems.map((item) => item.build(context)).toList(),
        ),
      ),
    );
  }
}