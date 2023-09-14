import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_tracker/bloc/auth/auth_event.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  String token = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(AuthSignInLoading());
      try {
        final accessToken = await authRepository.signIn(event.signInData);
        if (accessToken.isNotEmpty) {
          const storage = FlutterSecureStorage();
          await storage.write(key: 'USER-TOKEN', value: accessToken);
          token = accessToken;

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
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  Future<bool> checkIfUserIsSignIn() async {
    final SharedPreferences prefs = await _prefs;
    final tokenPref = prefs.getString('token');

    if (tokenPref?.isNotEmpty ?? false) return true;
    return false;
  }
}
