import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';
import '../../../ui/button.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PillsBloc, PillsState>(builder: (context, state) {
      final medicineBloc = context.read<MedicineBloc>();
      return Button(
        label: 'Criar Medicamento',
        onTap: () {
          context.read<PillsBloc>().add(
                PillsEventCreatePill(
                  createPill: medicineBloc.state.medicine,
                  formKey: formKey,
                ),
              );
          Navigator.pop(context);
        },
      );
    });
  }
}
