

import 'package:oohapp/core/waste_work/cubit.dart';

import '../app_export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? countryValue = 'Select country';
  String? stateValue = 'Select state';
  bool isButtonEnabled = false;

  CustomFormCubit formCubit = CustomFormCubit();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aptUnitController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

//  String? numberType = 'Mobile';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CustomFormCubit, CustomFormState>(
      builder: (context, state) {
        final cubit = context.read<CustomFormCubit>();
        // print(state.isFormValid.toString());
        return Scaffold(
          appBar: const LogoAppBar(),
          bottomSheet: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: state.isFormValid
                  ? CustomButton(
                      onTap: () {},
                      text: 'Save & Continue',
                      backgroundColor: CustomColors.primaryBlack,
                    )
                  : const InactiveButton(text: 'Save & Continue'),

              /*  CustomButton(
                onTap: () {
                  cubit.validateForm();
                },
                text: 'Save & Continue',
                backgroundColor: CustomColors.primaryBlack,
              )*/
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Form(
                key: context.read<CustomFormCubit>().signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomText.headline(
                        text: 'Create an account',
                        textDecoration: TextDecoration.underline),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      placeholder: 'Email ID',
                      hintText: 'Enter email ID',
                      onChanged: (value) {
                        cubit.onChangedEmail(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.emailValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _firstNameController,
                      placeholder: 'First name',
                      hintText: 'Enter first name',
                      onChanged: (value) {
                        cubit.onChangedFirstName(value);
                      },
                      validator: (value) => ValidatorRegex.nameValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _lastNameController,
                      placeholder: 'Last name',
                      hintText: 'Enter last name',
                      onChanged: (value) {
                        cubit.onChangedLastName(value);
                      },
                      validator: (value) => ValidatorRegex.nameValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _addressController,
                      placeholder: 'Address',
                      hintText: 'Enter address',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 3,
                      maxLength: 35,
                      onChanged: (value) {
                        cubit.onChangedAddress(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.addressValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _aptUnitController,
                      placeholder: 'Apt/unit #',
                      hintText: 'Enter unit',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        cubit.onChangedAptUnit(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.aptUnitValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _cityController,
                      placeholder: 'City',
                      hintText: 'Enter city',
                      onChanged: (value) {
                        cubit.onChangedCity(value);
                      },
                      validator: (value) => ValidatorRegex.cityValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownSelector(
                      dropdownValue: stateValue!,
                      width: size.width,
                      placeholder: 'State ',
                      items: usStates,
                      onChanged: (value) {
                        /*  setState(() {
                          stateValue = value;
                        });*/
                        cubit.onChangedStateDropdown(value!);
                      },
                      validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _zipCodeController,
                      placeholder: 'Zip code',
                      hintText: 'Enter Zip code',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        cubit.onChangedZipCode(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.zipCodeValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownSelector(
                      dropdownValue: countryValue!,
                      width: size.width,
                      placeholder: 'Country',
                      items: countries,
                      onChanged: (value) {
                        cubit.onChangedCountryDropdown(value!);
                      },
                      validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _phoneNumberController,
                      height: 39,
                      placeholder: 'Phone number',
                      hintText: '0123456789',
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      //  height: 39,
                      maxLines: 1,
                      obscureText: !state.isPasswordVisible,
                      placeholder: 'Password',
                      hintText: 'Enter password',
                      suffixIcon: InkWell(
                        onTap: () {
                          cubit.togglePasswordVisibility();
                        },
                        child: Icon(
                          !state.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: CustomColors.primaryBlack,
                        ),
                      ),
                      onChanged: (value) {
                        cubit.onChangedPassword(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.passwordValidator(value),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      //  height: 39,
                      controller: _confirmPasswordController,
                      maxLines: 1,
                      obscureText: !state.isPasswordVisible,
                      placeholder: 'Verify Password',
                      hintText: 'Re-enter password',
                      suffixIcon: InkWell(
                        onTap: () {
                          cubit.togglePasswordVisibility();
                        },
                        child: Icon(
                          !state.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: CustomColors.primaryBlack,
                        ),
                      ),
                      onChanged: (value) {
                        cubit.onChangedConfirmPassword(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ⓘ Confirm password is required';
                        } else if (_confirmPasswordController.text !=
                            _passwordController.text) {
                          return 'ⓘ Please enter same password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}