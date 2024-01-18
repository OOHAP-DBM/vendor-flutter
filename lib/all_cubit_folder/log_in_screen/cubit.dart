import 'package:oohapp/all_cubit_folder/log_in_screen/form.dart';
import 'package:oohapp/core/app_export.dart';

class LogInScreenCubit extends Cubit<LogInFormState>{
  LogInScreenCubit():super(const LogInFormState());
  final loginscreenFormKey=GlobalKey<FormState>();
  bool isuservalid=false;
      bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedmobileno(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(mobileno: value, ismobilenovalid: isValid));
    });
  }

  void onChangedemail(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(email: value, isemailvalid: isValid));
    });
  }


  

  void validateField(String value, Function(bool) callback) {
    if (loginscreenFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (loginscreenFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(isuservalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(loginscreenFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isuservalid: false));

      print('Invalid state');
    }
  }
}