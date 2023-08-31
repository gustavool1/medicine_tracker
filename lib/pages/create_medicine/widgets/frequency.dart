import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';

import '../../../styles/styles.dart';

class FrequencyPill extends StatelessWidget {
  const FrequencyPill({super.key});

  List<String> get frequencyList =>
      ['1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineBloc>(
        create: (context) => context.read<MedicineBloc>(),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: ColorPackage.blue,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Frequência de uso diário:',
                  style: TextFonts.body1.copyWith(
                    color: ColorPackage.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              DropdownButton<String>(
                items: frequencyList
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (frequency) {
                  final frequencyInHours =
                      int.parse(frequency?.substring(0, 1) ?? '0');

                  context
                      .read<MedicineBloc>()
                      .add(MedicineSetFrequency(frequencyInHours));
                },
                value:
                    '${context.watch<MedicineBloc>().state.medicine.frequencyInHours ?? 1}h',
              ),
            ],
          ),
        ));
  }
}
