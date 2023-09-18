import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/medicine/medicine_bloc.dart';
import 'package:medicine_tracker/bloc/medicine/medicine_event.dart';
import 'package:medicine_tracker/bloc/medicine/medicine_state.dart';
import 'package:medicine_tracker/helpers/extensions.dart';
import 'package:medicine_tracker/models/models.dart';
import 'package:medicine_tracker/styles/styles.dart';

import 'widgets/widgets.dart';

class MedicationPage extends StatelessWidget {
  final Medicine medicine;

  const MedicationPage({required this.medicine, super.key});

  onMedicineDelete(BuildContext context) {
    context.read<MedicineBloc>().add(
          MedicineDelete(medicine.id ?? ''),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<MedicineBloc>(context),
      listener: (context, state) {
        if (state is MedicineDeletedSuccessfully) Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPackage.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: GestureDetector(
                    onTap: () => onMedicineDelete(context),
                    child: const Icon(Icons.delete)),
              )
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
      ),
    );
  }
}
