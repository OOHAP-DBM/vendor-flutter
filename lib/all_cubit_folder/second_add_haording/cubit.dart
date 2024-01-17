import 'package:oohapp/all_cubit_folder/second_add_haording/form.dart';
import 'package:oohapp/core/app_export.dart';

class SecondHoardingScreenCubit extends Cubit<SecondHoardingFormState>{
  SecondHoardingScreenCubit():super(const SecondHoardingFormState());
  final secondaddhoardingFormKey=GlobalKey<FormState>();
  bool issecondvalid=false;
      bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedbankname(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(bankname: value, isbanknamevalid: isValid));
    });
  }

  void onChangedaccountholdername(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(accountholdername: value, isaccountholdernamevalid: isValid));
    });
  }

  void onChangedaccountnumber(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(accountnumber: value, isaccountnumbervalid: isValid));
    });
  }

  void onChangedifsc(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(ifsc: value, isifscvalid: isValid));
    });
  }



  

  void validateField(String value, Function(bool) callback) {
    if (secondaddhoardingFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (secondaddhoardingFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(issecondvalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(secondaddhoardingFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(issecondvalid: false));

      print('Invalid state');
    }
  }

  }
