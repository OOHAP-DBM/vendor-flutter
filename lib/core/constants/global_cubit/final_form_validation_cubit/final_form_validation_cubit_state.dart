

abstract class TextFormFieldState {
  const TextFormFieldState();
}

class FormFieldInitial extends TextFormFieldState {}

class FormFieldValidationSuccess extends TextFormFieldState {}

class FormFieldValidationError extends TextFormFieldState {
  final String errorMessage;

  const FormFieldValidationError(this.errorMessage);
}
