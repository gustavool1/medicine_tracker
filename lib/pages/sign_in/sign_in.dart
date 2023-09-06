import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';

import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/models/user_data.model.dart';
import 'widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Widget get separator => const SizedBox(
        height: 30,
      );

  TextEditingController textFieldEmailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController textFieldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      void onSubmit() {
        context.read<AuthBloc>().add(
              SignInEvent(
                signInData: UserDataModel(
                  email: textFieldEmailController.text,
                  password: textFieldPasswordController.text,
                ),
                formKey: formKey,
              ),
            );
      }

      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Header(
                    title: 'Bem vindo de volta',
                    message:
                        'Ficamos animados em tê-lo de volta! Mal podemos esperar para ajudá-lo a lembrar de tomar seus medicamentos e ver como você tem se sentido desde a última vez que os tomou.',
                  )),
                  Expanded(
                    flex: 2,
                    child: FormFields(
                      textFieldEmailController: textFieldEmailController,
                      textFieldPasswordController: textFieldPasswordController,
                    ),
                  ),
                  SignInButton(onSubmit: onSubmit),
                  const RegisterCall(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
