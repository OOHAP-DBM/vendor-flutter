import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/form.dart';
import 'package:oohapp/core/app_export.dart';

class   FinalSecondAddHoardingScreenCubit extends Cubit<FinalSecondAddHoardingFormState>{
  FinalSecondAddHoardingScreenCubit():super(const FinalSecondAddHoardingFormState());
  final finalsecondaddhoardingFormKey=GlobalKey<FormState>();
  bool issecondpricevalid=false;
        bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedsetbaseprice(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(setbaseprice: value, issetpricevalid: isValid));
    });
  }

  void onChangedpricingcharge(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(pricingcharges: value, ispricingchargevalid: isValid));
    });
  }

  void onChangedmountingcharges(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(mountingcharge: value, ismountingchargevalid: isValid));
    });
  }

  void onChangeddesigningcharge(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(designingcharge: value, isdesigningchargevalid: isValid));
    });
  }



  

  void validateField(String value, Function(bool) callback) {
    if (finalsecondaddhoardingFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (finalsecondaddhoardingFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(issecondpricevalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(finalsecondaddhoardingFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(issecondpricevalid: false));

      print('Invalid state');
    }
  }

}