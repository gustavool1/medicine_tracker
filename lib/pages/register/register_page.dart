import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_bloc.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/pages/register/widgets/widgets.dart';

import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/models/sign_in.model.dart';
import '../../ui/ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              RegisterEvent(
                signInData: SignInModel(
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
                    title: 'Crie sua conta',
                    message:
                        'Registre-se agora e comece a explorar tudo o que nosso aplicativo tem a oferecer. Estamos animados para recebê-lo em nossa comunidade!',
                  )),
                  Expanded(
                    flex: 2,
                    child: FormFields(
                      textFieldEmailController: textFieldEmailController,
                      textFieldPasswordController: textFieldPasswordController,
                    ),
                  ),
                  SubmitButton(onSubmit: onSubmit),
                  const SignInCall(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
