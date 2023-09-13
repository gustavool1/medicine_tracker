import 'package:flutter/material.dart';
import 'package:medicine_tracker/models/models.dart';
import 'package:medicine_tracker/styles/styles.dart';

class MedicineReminder extends StatelessWidget {
  final List<PillModel> pills;

  const MedicineReminder({required this.pills, super.key});

  List<Widget> get getPillsReminders {
    return pills.map((pill) {
      return Text(
        'pill.timeToTake',
        style: TextFonts.body1.copyWith(color: ColorPackage.darkBlue),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lembretes',
            style: TextFonts.body1.copyWith(color: ColorPackage.lightGray),
          ),
          ...getPillsReminders,
        ],
      ),
    );
  }
}
