import 'package:flutter/material.dart';
import 'package:medicine_tracker/bloc/auth/models/sign_in.model.dart';

class AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInModel signInData;
  final GlobalKey<FormState> formKey;

  SignInEvent({
    required this.signInData,
    required this.formKey,
  }) : super();
}
