import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

class MedicineDetail extends StatelessWidget {
  final String title;
  final String description;

  const MedicineDetail(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextFonts.body1.copyWith(color: ColorPackage.lightGray),
          ),
          Text(
            description,
            style: TextFonts.body1.copyWith(color: ColorPackage.darkBlue),
          )
        ],
      ),
    );
  }
}
