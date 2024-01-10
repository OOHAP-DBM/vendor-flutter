import 'package:flutter_bloc/flutter_bloc.dart';

class FormValidationCubit extends Cubit<Map<String, String?>> {
  FormValidationCubit() : super({});

  void validateField(String fieldName, String? value) {
    emit(Map.from(state)..[fieldName] = value?.isEmpty == true ? "$fieldName cannot be empty" : null);
  }

  bool isFormValid() {
    return state.values.every((errorMessage) => errorMessage == null);
  }
}
