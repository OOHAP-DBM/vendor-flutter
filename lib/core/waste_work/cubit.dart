


import 'package:oohapp/core/waste_work/form_state.dart';
import '../../../../../core/app_export.dart';

class CustomFormCubit extends Cubit<CustomFormState> {
  CustomFormCubit() : super(const CustomFormState());

  final signupFormKey = GlobalKey<FormState>();
  bool isStateValidate = false;

  bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedEmail(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(email: value, isEmailValid: isValid));
    });
  }

  void onChangedFirstName(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(firstName: value, isFirstNameValid: isValid));
    });
  }

  void onChangedLastName(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(lastName: value, isLastNameValid: isValid));
    });
  }

  void onChangedAddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(address: value, isAddressValid: isValid));
    });
  }

  void onChangedAptUnit(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(aptUnit: value, isAptUnitValid: isValid));
    });
  }

  void onChangedCity(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(city: value, isCityValid: isValid));
    });
  }

  void onChangedZipCode(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(zipCode: value, isZipCodeValid: isValid));
    });
  }
    void onChangedPhoneNumber(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(phonenumber: value, isphonenumberValid: isValid));
    });
  }

  void onChangedPassword(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(password: value, isPasswordValid: isValid));
    });
  }

  void onChangedConfirmPassword(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          confirmPassword: value, isConfirmPasswordValid: isValid));
    });
  }

  void onChangedStateDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          stateDropdown: value, isStateDropdown: isValid));
    });
  }

  void onChangedCountryDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          countryDropdown: value, isCountryDropdown: isValid));
    });
  }





  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void validateField(String value, Function(bool) callback) {
    if (signupFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (signupFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(isFormValid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(signupFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isFormValid: false));

      print('Invalid state');
    }
  }

  }


/*

void validateField(String value, Function(bool) callback) {
  if (signupFormKey.currentState?.validate() ?? false) {
    callback(true);
    validateForm();
  } else {
    callback(false);
  }
}

void validateForm() {
  if (signupFormKey.currentState?.validate() ?? false) {
    emit(state.copyWith(isFormValid: true));
    isStateValidate = true;
    print('valid state ;;;;;;;;;;;;;;;;');
    print(signupFormKey.currentState?.validate().toString() ?? false);
  } else {
    emit(state.copyWith(isFormValid: false));
    isStateValidate = false;
    print('Invalid state');
  }
}*/