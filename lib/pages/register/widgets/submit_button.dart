import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/pages/sign_in/sign_in.dart';

import '../../../ui/ui.dart';

class SubmitButton extends StatelessWidget {
  final Function() onSubmit;

  const SubmitButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SignInPage()));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              height: 60,
              child: Button(
                label: 'Registrar-se',
                onTap: onSubmit,
                isLoading: state is AuthRegisterLoading,
              ),
            ),
          );
        },
      ),
    );
  }
}
