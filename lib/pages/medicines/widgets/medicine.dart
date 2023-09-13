import 'package:flutter/material.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/pages/medicine/medicine_page.dart';
import 'package:medicine_tracker/styles/styles.dart';

import '../../../models/models.dart';

class MedicineItem extends StatelessWidget {
  final Medicine medicine;

  const MedicineItem({required this.medicine, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MedicationPage(medicine: medicine))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorPackage.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 45.0),
                    child: Text(
                      medicine.name?.capitalize ?? '',
                      style: TextFonts.head2.copyWith(
                          color: ColorPackage.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 5, left: 10, child: Image.asset(Assets.pill, height: 70))
        ],
      ),
    );
  }
}
