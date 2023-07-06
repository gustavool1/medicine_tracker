import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';
import '../../../styles/styles.dart';

class PillsAmount extends StatelessWidget {
  const PillsAmount({super.key});

  List<int> get amounts => [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePillBloc>(
        create: (context) => context.read<CreatePillBloc>(),
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
                  'Quantidade de pilulas:',
                  style: TextFonts.body1.copyWith(
                    color: ColorPackage.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              DropdownButton<String>(
                items: amounts
                    .map<DropdownMenuItem<String>>(
                      (int value) => DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (frequency) {
                  context.read<CreatePillBloc>().add(
                      CreatePillSetPillAmount(int.parse(frequency ?? '1')));
                },
                value:
                    '${context.watch<CreatePillBloc>().state.createPill.pillsAmount ?? 1}',
              ),
            ],
          ),
        ));
  }
}
