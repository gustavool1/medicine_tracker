import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_tracker/bloc/auth/auth_event.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late String token;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<RegisterEvent>(_onRegister);
  }

  _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(AuthSignInLoading());
      try {
        final accessToken = await authRepository.signIn(event.signInData);
        await Future.delayed(const Duration(seconds: 1));
        if (accessToken.isNotEmpty) {
          const storage = FlutterSecureStorage();
          await storage.write(key: 'USER-TOKEN', value: accessToken);
          token = accessToken;

          emit(AuthSignInSuccess());
        }
      } catch (_) {
        await Future.delayed(const Duration(seconds: 1));
        emit(AuthSignInFailed());
        Fluttertoast.showToast(
          msg: "Suas credenciais estão incorretas",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(AuthRegisterLoading());
      try {
        await authRepository.register(event.signInData);
        await Future.delayed(const Duration(seconds: 2));

        Fluttertoast.showToast(
          msg: "Sua conta foi criada com sucesso",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        emit(AuthRegisterSuccess());
        emit(AuthInitial());
      } catch (_) {
        emit(AuthRegisterFailed());

        Fluttertoast.showToast(
          msg: "Já existe uma conta cadastrada com esse email",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        emit(AuthInitial());
      }
    }
  }
}
