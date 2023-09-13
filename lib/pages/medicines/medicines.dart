import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/medicine/medicine.dart';
import 'package:medicine_tracker/pages/medicines/widgets/medicine.dart';
import 'package:medicine_tracker/styles/styles.dart';

class MedicinesPage extends StatelessWidget {
  const MedicinesPage({super.key});

  getMedicines(BuildContext context) async {
    context.read<MedicineBloc>().add(MedicineGetMedicines());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMedicines(context),
      builder: ((context, snapshot) {
        return BlocBuilder<MedicineBloc, MedicineState>(
            builder: ((context, state) {
          if (state is MedicineGottenSuccessfully) {
            return Container(
              color: ColorPackage.defaultPrimary,
              child: Center(
                child: Column(
                  children: state.medicines
                      .map((medicine) => MedicineItem(medicine: medicine))
                      .toList(),
                ),
              ),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: ColorPackage.blue,
          ));
        }));
      }),
    );
  }
}
