import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../helpers/validators/validators.dart';
import '../../../styles/styles.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
      validator: MultiValidator(
        [
          DefaultRequiredValidator(),
          MaxLengthValidator(30, errorText: 'Limite de caracteres atingido'),
        ],
      ),
      decoration: InputDecoration(
        hintText: 'Nome Completo',
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
