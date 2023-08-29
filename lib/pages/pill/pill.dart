import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class MedicationPage extends StatelessWidget {
  const MedicationPage({super.key});

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
      body:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MedicineImage(
          name: 'Dipirona',
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicineDetail(
                title: 'Nome',
                description: 'Dipirona ',
              ),
              MedicineDetail(
                title: 'Quantidade de pilulas',
                description: 'Dipirona ',
              ),
              MedicineDetail(
                title: 'Lembretes',
                description: 'Dipirona ',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
