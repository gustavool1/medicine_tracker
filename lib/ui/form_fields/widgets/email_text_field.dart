import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../helpers/validators/validators.dart';
import '../../../styles/styles.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: MultiValidator(
        [
          EmailValidator(errorText: 'Email inválido'),
          DefaultRequiredValidator(),
        ],
      ),
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
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
