import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/helpers/validators/required.validator.dart';

import '../../../styles/styles.dart';

class RegisterPillName extends StatelessWidget {
  const RegisterPillName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePillBloc>(
      create: (context) => context.read<CreatePillBloc>(),
      child: TextFormField(
        validator: DefaultRequiredValidator(),
        decoration: InputDecoration(
          hintText: 'Nome do medicamento',
          contentPadding: const EdgeInsets.only(bottom: 5),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPackage.lightGray),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPackage.lightGray),
          ),
          hintStyle: TextFonts.body1.copyWith(
            color: ColorPackage.lightGray,
          ),
        ),
        onChanged: (name) {
          context.read<CreatePillBloc>().add(CreatePillSetPillName(name));
        },
      ),
    );
  }
}
