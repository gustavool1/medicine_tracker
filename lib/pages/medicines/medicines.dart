import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/medicine/medicine.dart';
import 'package:medicine_tracker/pages/medicines/widgets/medicine.dart';
import 'package:medicine_tracker/styles/styles.dart';

import '../../models/medicine.dart';

class MedicinesPage extends StatelessWidget {
  const MedicinesPage({super.key});

  getMedicines(BuildContext context) async {
    context.read<MedicineBloc>().add(MedicineGetMedicines());
  }

  medicines(List<Medicine> medicines) => Container(
        color: ColorPackage.defaultPrimary,
        child: Center(
          child: Column(
            children: medicines
                .map((medicine) => MedicineItem(medicine: medicine))
                .toList(),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMedicines(context),
      builder: ((context, snapshot) {
        return BlocBuilder<MedicineBloc, MedicineState>(
            builder: ((context, state) {
          if (state is MedicineGottenSuccessfully) {
            return medicines(state.medicines);
          }
          if (state is MedicineDeletedSuccessfully) {
            return medicines(state.medicines);
          }
          if (state is MedicineLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorPackage.blue,
            ));
          }

          if (state is MedicineEmpty) {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                'Você ainda não possui medicamentos cadastrados',
                style: TextFonts.head2.copyWith(
                  color: ColorPackage.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return const Center();
        }));
      }),
    );
  }
}
