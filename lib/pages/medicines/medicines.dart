import 'package:flutter/material.dart';
import 'package:medicine_tracker/pages/medicines/widgets/medicine.dart';
import 'package:medicine_tracker/styles/styles.dart';

class MedicinesPage extends StatelessWidget {
  const MedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPackage.defaultPrimary,
      child: const Center(
        child: Medicine(),
      ),
    );
  }
}
