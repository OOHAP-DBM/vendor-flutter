import 'package:oohapp/core/app_export.dart';

class FormValidationCubit extends Cubit<bool> {
  FormValidationCubit() : super(false);

  void validateField(String field, String value) {
  
    bool isValid = false;
    emit(isValid);
  }

  bool isFormValid() => state;
}
