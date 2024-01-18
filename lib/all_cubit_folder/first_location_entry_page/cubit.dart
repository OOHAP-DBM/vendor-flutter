import 'package:oohapp/all_cubit_folder/first_location_entry_page/form.dart';
import 'package:oohapp/core/app_export.dart';

class LocationEntryScreenCubit extends Cubit<FirstLocationEntryFormState>{
  LocationEntryScreenCubit():super(const FirstLocationEntryFormState());
  final firstlocationentryFormKey=GlobalKey<FormState>();
  bool islocationvalid=false;
      bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedhoardingaddress(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(hoardingaddress: value, ishoardingaddressvalid: isValid));
    });
  }

  void onChangedhoardingpincode(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(pincode: value, ispincodevalid: isValid));
    });
  }

  void onChangedcity(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(city: value, iscityvalid: isValid));
    });
  }

  void onChangedstate(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(state: value, isstatevalid: isValid));
    });
  }
    void onChangedcountry(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          country: value, iscountryvalid: isValid));
    });
  }
      void onChangedlandmnark(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          landmark: value, islandmarkvalid: isValid));
    });
  }
        void onChangedlatitude(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          latitude: value, islatitudevalid: isValid));
    });
  }
          void onChangedlongitude(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          longitude: value, islongitudevalid: isValid));
    });
  }


  

  void validateField(String value, Function(bool) callback) {
    if (firstlocationentryFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (firstlocationentryFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(islocationvalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(firstlocationentryFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(islocationvalid: false));

      print('Invalid state');
    }
  }
}