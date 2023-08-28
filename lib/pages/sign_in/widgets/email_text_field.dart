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
      decoration: InputDecoration(
        hintText: 'Email',
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
