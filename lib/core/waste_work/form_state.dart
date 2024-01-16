import 'package:equatable/equatable.dart';

class CustomFormState {
  final String email;
  final String firstName;
  final String lastName;
  final String address;
  final String aptUnit;
  final String city;
  final String zipCode;
  final String country;
  final String password;
  final String confirmPassword;
  final String phonenumber;
  //dropdown
  final String stateDropdown;
  final String countryDropdown;

  // Validation flags
  final bool isEmailValid;
  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isAddressValid;
  final bool isAptUnitValid;
  final bool isCityValid;
  final bool isZipCodeValid;
  final bool isCountryValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isPasswordVisible;
  final bool isFormValid;
  final bool isphonenumberValid;
  //dropdown
  final bool isStateDropdown;
  final bool isCountryDropdown;

  const CustomFormState({
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.address = '',
    this.aptUnit = '',
    this.city = '',
    this.zipCode = '',
    this.country = '',
    this.password = '',
    this.confirmPassword = '',
    this.stateDropdown = '',
    this.countryDropdown = '',
    this.phonenumber='',
    // Initialization of validation flags

    this.isEmailValid = true,
    this.isFirstNameValid = true,
    this.isLastNameValid = true,
    this.isAddressValid = true,
    this.isAptUnitValid = true,
    this.isCityValid = true,
    this.isZipCodeValid = true,
    this.isCountryValid = true,
    this.isPasswordValid = true,
    this.isConfirmPasswordValid = true,
    this.isStateDropdown = true,
    this.isCountryDropdown = true,
    this.isPasswordVisible = false,
    this.isFormValid = false,
    this.isphonenumberValid=false,
  });

  CustomFormState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? address,
    String? aptUnit,
    String? city,
    String? zipCode,
    String? password,
    String? confirmPassword,
    String? phonenumber,
    // dropdown
    String? stateDropdown,
    String? countryDropdown,
    bool? isEmailValid,
    bool? isFirstNameValid,
    bool? isLastNameValid,
    bool? isAddressValid,
    bool? isAptUnitValid,
    bool? isCityValid,
    bool? isZipCodeValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isPasswordVisible,
    bool? isFormValid,
    bool? isphonenumberValid,
    // dropdown
    bool? isStateDropdown,
    bool? isCountryDropdown,
  }) {
    return CustomFormState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      aptUnit: aptUnit ?? this.aptUnit,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      phonenumber: phonenumber??this.phonenumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isStateDropdown: isStateDropdown ?? this.isStateDropdown,
      isCountryDropdown: isCountryDropdown ?? this.isCountryDropdown,
      isFormValid: isFormValid ?? this.isFormValid,
      isphonenumberValid: isphonenumberValid ?? this.isphonenumberValid,
    );
  }
}

