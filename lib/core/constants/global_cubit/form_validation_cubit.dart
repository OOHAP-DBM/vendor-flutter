

import 'package:oohapp/core/app_export.dart';

import 'final_form_validation_cubit/final_form_validation_cubit_state.dart';

class FormFieldCubit extends Cubit<TextFormFieldState> {
  FormFieldCubit() : super(FormFieldInitial());

  void validateField({required String value, required int? maxLength}) {
    if (value.isEmpty) {
      emit(const FormFieldValidationError("Please fill out this field"));
    } else if (maxLength != null && value.length > maxLength) {
      emit(FormFieldValidationError("Input exceeds maximum length of $maxLength characters"));
    } else {
      emit(FormFieldValidationSuccess());
    }
  }
}

