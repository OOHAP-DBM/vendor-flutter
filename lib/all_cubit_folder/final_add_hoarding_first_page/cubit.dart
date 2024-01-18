import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/form.dart';
import 'package:oohapp/core/app_export.dart';

class FinalFirstAddHoardingScreenCubit extends Cubit<FinalFirstAddHoardingFirstFormState>{
  FinalFirstAddHoardingScreenCubit():super(const FinalFirstAddHoardingFirstFormState());
  final finalfirstaddhoardingFormKey=GlobalKey<FormState>();
  bool isfirstfinalhoardingvalid=false;
        bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedcategories(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(categories: value, iscategoriesvalid: isValid));
    });
  }

  void onChangedhaordingtitle(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(hoardingtitle: value, ishoardingtitlevalid: isValid));
    });
  }

  void onChangedhaordingdescription(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(hoardingdescription: value, ishoardingdescriptionvalid: isValid));
    });
  }

  void onChangedmeasurementlength(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(measurementlength: value, ismeasurementlengthvalid: isValid));
    });
  }
    void onChangedhoardingwidth(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          hoardingwidth: value, ishoardingwidthvalid: isValid));
    });
  }
      void onChangedhoardingheight(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
          hoardingheight: value, ishoardingheightvalid: isValid));
    });
  }



  

  void validateField(String value, Function(bool) callback) {
    if (finalfirstaddhoardingFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (finalfirstaddhoardingFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(isfirstfinalhoardingvalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(finalfirstaddhoardingFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(isfirstfinalhoardingvalid: false));

      print('Invalid state');
    }
  }
}