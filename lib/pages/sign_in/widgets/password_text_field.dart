import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:medicine_tracker/helpers/validators/validators.dart';

import '../../../styles/styles.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      controller: controller,
      validator: MultiValidator([DefaultRequiredValidator()]),
      decoration: InputDecoration(
        hintText: 'Senha',
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
    );
  }
}
