import 'package:oohapp/all_cubit_folder/additional_ui_second_hoarding/form.dart';
import 'package:oohapp/core/app_export.dart';

class FinalAddHoardingAdditionalScreenCubit extends Cubit<AdditionUISecondHoardingFormState>{

  FinalAddHoardingAdditionalScreenCubit():super(const AdditionUISecondHoardingFormState());
  final finalsecondhoardingadditionaluiFormKey=GlobalKey<FormState>();
  bool istaxvalid=false;
          bool validateCurrentState(bool validationCheck) {
    if (true) {
      validateForm();
    }
    return validationCheck;
  }

  void onChangedgst(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(gst: value, isgstvalid: isValid));
    });
  }

  void onChangedigst(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(igst: value, isigstvalid: isValid));
    });
  }

  void onChangeddiscounttype(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(discounttype: value, isdiscounttypevalid: isValid));
    });
  }

  void onChangeddiscountpercentage(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(discountpercentage: value, isdiscountpercentagevalid: isValid));
    });
  }
    void onChangedtotalpricewithtax(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
         totalpricewithtax: value, istotalpricewithtaxvalid: isValid));
    });
  }
      void onChangeddiscountprice(String value) {
    validateField(value, (isValid) {
      emit(state.copyWith(
        discountedprice: value, isdiscountedpricevalid: isValid));
    });
  }



  

  void validateField(String value, Function(bool) callback) {
    if (finalsecondhoardingadditionaluiFormKey.currentState?.validate() ?? false) {
      callback(true);
      validateCurrentState(true);
    } else {
      callback(false);
      validateCurrentState(false);
    }
  }



  void validateForm() {
    if (finalsecondhoardingadditionaluiFormKey.currentState?.validate() ?? false) {
      emit(state.copyWith(istaxvalid: true));

      print('valid state ;;;;;;;;;;;;;;;;');
      print(finalsecondhoardingadditionaluiFormKey.currentState?.validate().toString() ?? false);
    } else {
      emit(state.copyWith(istaxvalid: false));

      print('Invalid state');
    }
  }
}