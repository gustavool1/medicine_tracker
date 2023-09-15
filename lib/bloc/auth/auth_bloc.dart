import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_tracker/bloc/auth/auth_event.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/helpers/auth.helper.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import 'models/auth_info.model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late AuthInfo authInfo;
  final AuthHelper _authHelper = AuthHelper();

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(AuthSignInLoading());
      try {
        final authInfoSignIn = await authRepository.signIn(event.signInData);
        if (authInfoSignIn.accessToken.isNotEmpty) {
          authInfo = authInfoSignIn;
          await _authHelper.setTokenOnPreferences(authInfo.accessToken);

          emit(AuthSignInSuccess());
          await _fillUserInfoOnSharedPreferences();
        }
      } catch (_) {
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

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(AuthRegisterLoading());
      try {
        await authRepository.register(event.signInData);

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

  Future<void> _fillUserInfoOnSharedPreferences() async {
    await _authHelper.setTokenOnPreferences(authInfo.accessToken);
    await _authHelper.setRefreshTokenOnPreferences(authInfo.refreshToken);
  }

  Future<bool> checkIfUserIsSignIn() async {
    final tokenPref = await _authHelper.getUserToken();

    if (tokenPref.isNotEmpty) return true;
    return false;
  }
}
