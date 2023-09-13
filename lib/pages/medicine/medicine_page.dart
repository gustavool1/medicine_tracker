import 'package:flutter/material.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/models/models.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class MedicationPage extends StatelessWidget {
  final Medicine medicine;

  const MedicationPage({required this.medicine, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPackage.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(onTap: () => {}, child: const Icon(Icons.edit))
          ],
        ),
      ),
      backgroundColor: ColorPackage.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MedicineImage(
          name: medicine.name?.capitalize ?? '',
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicineDetail(
                title: 'Nome',
                description: medicine.name?.capitalize ?? '',
              ),
              MedicineDetail(
                title: 'Quantidade de pilulas',
                description: medicine.pillsAmount.toString(),
              ),
              MedicineReminder(pills: medicine.pills ?? [])
            ],
          ),
        ),
      ]),
    );
  }
}
