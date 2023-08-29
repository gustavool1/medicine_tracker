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
      final createPillBloc = context.read<CreatePillBloc>();
      return Button(
        label: 'Criar Medicamento',
        onTap: () {
          context.read<PillsBloc>().add(
                PillsEventCreatePill(
                  createPill: createPillBloc.state.createPill,
                  formKey: formKey,
                ),
              );
          Navigator.pop(context);
        },
      );
    });
  }
}
