import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownState {
  final String? countryDropdown;
  final bool isCountryDropdownValid;
  final bool isFormValid;

  DropdownState({
    this.countryDropdown,
    this.isCountryDropdownValid = false,
    this.isFormValid = false,
  });

  DropdownState copyWith({
    String? countryDropdown,
    bool? isCountryDropdownValid,
    bool? isFormValid,
  }) {
    return DropdownState(
      countryDropdown: countryDropdown ?? this.countryDropdown,
      isCountryDropdownValid: isCountryDropdownValid ?? this.isCountryDropdownValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(DropdownState());

  void onChangedCountryDropdown(String? value) {
    validateField(value, (isValid) {
      emit(state.copyWith(countryDropdown: value, isCountryDropdownValid: isValid));
    });
  }

  void validateField(String? value, Function(bool) callback) {
    // Replace the following condition with your validation logic
    if (value != null && value.isNotEmpty) {
      callback(true);
      validateForm(true);
    } else {
      callback(false);
      validateForm(false);
    }
  }

  void validateForm(bool isValid) {
    emit(state.copyWith(isFormValid: isValid));
  }
}


