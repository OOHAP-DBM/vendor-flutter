import 'package:oohapp/all_cubit_folder/first_add_hoarding/form.dart';
import 'package:oohapp/core/app_export.dart';

class AddHoardingScreenCubit extends Cubit<AddHoardingFormState>{
  AddHoardingScreenCubit():super(const AddHoardingFormState());
  final firstAddhoardingFormKey=GlobalKey<FormState>();
  bool ispagevalid=false;
    bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedgstin(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(gstinno: value, isgstinValid: isValid));
    });
  }

  void onChangedbusinessname(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(businessname: value, isbusinessnameValid: isValid));
    });
  }

  void onChangedstreetaddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(address: value, isaddressValid: isValid));
    });
  }

  void onChangedpincode(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(pincode: value, ispincodeValid: isValid));
    });
  }
    void onChangedStateDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          stateDropdown: value, isstateValid: isValid));
    });
  }
      void onChangedCountryDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          countryDropdown: value, isCountryValid: isValid));
    });
  }
        void onChangedbusinessTypeDropdown(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          businesstype: value, isbusinesstypeValid: isValid));
    });
  }


  

  void validateField(String value, Function(bool) callback) {
    if (firstAddhoardingFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (firstAddhoardingFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(ispagevalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(firstAddhoardingFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(ispagevalid: false));

      print('Invalid state');
    }
  }

  }
