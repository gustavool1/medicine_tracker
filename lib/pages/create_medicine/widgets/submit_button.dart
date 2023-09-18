import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';
import '../../../ui/button.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<PillsBloc>(context),
      listener: (context, state) {
        if (state is PillCreatedSuccessfuly) {
          context.read<MedicineBloc>().add(MedicineGetMedicines());
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<PillsBloc, PillsState>(
        builder: (context, state) {
          final medicineBloc = context.read<MedicineBloc>();
          return Button(
            label: 'Criar Medicamento',
            isLoading: state is PillLoadingCreation,
            onTap: () {
              context.read<PillsBloc>().add(
                    PillsEventCreatePill(
                      createPill: medicineBloc.state.medicine,
                      formKey: formKey,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
