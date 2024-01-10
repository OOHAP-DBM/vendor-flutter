import 'package:flutter/material.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';

import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../../../core/app_export.dart';

class FirstHoardingLocationEntryPage extends StatelessWidget {
  FirstHoardingLocationEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController hoardingaddressController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController landmarkController = TextEditingController();
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();
    final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Hoarding Location',
        centerTitle: true,
        elevation: 1,
        //  backgroundColor: Colors.grey.shade100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.3, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hoarding Location',
                style: TextStyle(
                  color: Color(0xFF282C3E),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                placeholder: 'Hoarding Address*',
                maxLength: 10,
                //  keyboardType: TextInputType.none,
                hintText: 'Gomti Nagar',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'hoarding address', hoardingaddressController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                placeholder: 'Pincode*',
                maxLength: 10,
                keyboardType: TextInputType.number,
                hintText: '226010',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'pincode', pincodeController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldSelector(
                placeholder: 'City*',
                choices: ['Lucknow', 'kanpur', 'varanasi', 'delhi'],
                hintText: 'Lucknow',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'city', cityController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldSelector(
                placeholder: 'State*',
                choices: ['Bihar', 'Up', 'delhi', 'dehradun'],
                hintText: 'uttar pradesh',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'state', stateController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFieldSelector(
                placeholder: 'Country*',
                choices: ['India', 'Pakistan', 'Russia', 'Afghanistan'],
                hintText: 'India',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'Country', countryController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                placeholder: 'Landmark*',
                //  maxLength: 10,
                //  keyboardType: TextInputType.number,
                hintText: 'puppy car point',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'landmark', landmarkController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                placeholder: 'Latitude*',
                maxLength: 10,
                // keyboardType: TextInputType.streetAddress,
                hintText: '10.012.0211.2',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'latitude', latitudeController.text);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                placeholder: 'Longitude*',
                maxLength: 10,
                hintText: '10.012.0211.2',
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'longitude', longitudeController.text);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  if (formValidationCubit.isFormValid()) {
                    NavigateUtils.pushNamedReplacement(
                        context, Routes.finalfirstaddhoardingScreen);
                  } else {}
                },
                text: 'Continue',
                backgroundColor: formValidationCubit.isFormValid()
                    ? const Color(0xFFDDDDDD)
                    : const Color(0xFF282C3E),
              )
            ],
          ),
        ),
      ),
    );
  }
}
