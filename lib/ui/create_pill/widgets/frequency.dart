import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';

import '../../../styles/styles.dart';

class FrequencyPill extends StatelessWidget {
  const FrequencyPill({super.key});

  get frequencyList => ['1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePillBloc, CreatePillState>(
        builder: (context, state) {
      setFrequency(String? frequency) {
        final frequencyInHours = int.parse(frequency?.substring(0, 1) ?? '0');
        context
            .read<CreatePillBloc>()
            .add(CreatePillSetFrequency(frequencyInHours));
      }

      return Padding(
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
                'Frequência de uso diário',
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
              onChanged: setFrequency,
              value: "${state.createPill.frequencyInHours}h",
            )
          ],
        ),
      );
    });
  }
}
