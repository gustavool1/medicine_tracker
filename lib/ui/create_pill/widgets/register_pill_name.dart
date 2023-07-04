import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';

import '../../../styles/styles.dart';

class RegisterPillName extends StatelessWidget {
  const RegisterPillName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePillBloc, CreatePillState>(
        builder: (context, state) {
      void onChange(String name) {
        context.read<CreatePillBloc>().add(CreatePillSetPillName(name));
      }

      return TextField(
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
        onChanged: onChange,
      );
    });
  }
}
