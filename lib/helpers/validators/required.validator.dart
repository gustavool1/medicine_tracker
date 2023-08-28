import 'package:form_field_validator/form_field_validator.dart';

class DefaultRequiredValidator extends RequiredValidator {
  DefaultRequiredValidator() : super(errorText: "Campo obrigatório");
}
