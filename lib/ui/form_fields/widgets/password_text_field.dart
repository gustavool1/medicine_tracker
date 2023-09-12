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
      controller: controller,
      obscureText: true,
      validator: MultiValidator([DefaultRequiredValidator()]),
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        filled: true,
        hintText: 'Senha',
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorPackage.lightGray,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorPackage.lightGray,
          ),
        ),
        hintStyle: TextFonts.body1.copyWith(
          color: ColorPackage.hint,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorPackage.lightGray,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
