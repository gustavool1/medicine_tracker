import 'package:flutter/material.dart';
import 'package:medicine_tracker/bloc/auth/models/user_data.model.dart';

class AuthEvent {}

class SignInEvent extends AuthEvent {
  final UserDataModel signInData;
  final GlobalKey<FormState> formKey;

  SignInEvent({
    required this.signInData,
    required this.formKey,
  }) : super();
}

class RegisterEvent extends AuthEvent {
  final UserDataModel signInData;
  final GlobalKey<FormState> formKey;

  RegisterEvent({
    required this.signInData,
    required this.formKey,
  }) : super();
}
