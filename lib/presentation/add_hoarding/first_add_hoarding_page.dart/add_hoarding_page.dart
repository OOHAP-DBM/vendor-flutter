import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';
import 'package:oohapp/core/constants/global_cubit/final_form_validation_cubit/final_form_validation_cubit_state.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

class AddHoardingScreen extends StatefulWidget {
  const AddHoardingScreen({super.key});

  @override
  State<AddHoardingScreen> createState() => _AddHoardingScreenState();
}

class _AddHoardingScreenState extends State<AddHoardingScreen> {
  final gstinCubit = FormFieldCubit();
  final businessNameCubit = FormFieldCubit();
  final businessTypeCubit = FormFieldCubit();
  final streetCubit = FormFieldCubit();
  final pincodeCubit = FormFieldCubit();
  final cityCubit = FormFieldCubit();
  final stateCubit = FormFieldCubit();
  final countryCubit = FormFieldCubit();
  TextEditingController streetController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController businessnameController = TextEditingController();
  TextEditingController businesstypeController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isFormValid() {
    return gstinCubit.state is FormFieldValidationSuccess &&
        businessNameCubit.state is FormFieldValidationSuccess &&
        businessTypeCubit.state is FormFieldValidationSuccess &&
        streetCubit.state is FormFieldValidationSuccess &&
        pincodeCubit.state is FormFieldValidationSuccess &&
        cityCubit.state is FormFieldValidationSuccess &&
        stateCubit.state is FormFieldValidationSuccess &&
        countryCubit.state is FormFieldValidationSuccess;
  }

  @override
  Widget build(BuildContext context) {
    final characterCountCubit = BlocProvider.of<CharacterCountCubit>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: gstinCubit),
        BlocProvider.value(value: businessNameCubit),
        BlocProvider.value(value: businessTypeCubit),
        BlocProvider.value(value: streetCubit),
        BlocProvider.value(value: pincodeCubit),
        BlocProvider.value(value: cityCubit),
        BlocProvider.value(value: stateCubit),
        BlocProvider.value(value: countryCubit),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Business Details',
          centerTitle: true,
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircularButton(
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: CustomColors.grey,
              borderColor: CustomColors.transparent,
              icon: Icons.arrow_back,
              iconColor: CustomColors.blackColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                BlocBuilder<FormFieldCubit, TextFormFieldState>(
                    bloc: gstinCubit,
                    builder: (context, state) {
                      return CustomTextFormField(
                                controller: gstinController,
                          placeholder: 'GSTIN No',
                          // maxLength: 15,
                          keyboardType: TextInputType.number,
                          hintText: "Enter GSTIN No",
                          onChanged: (value) => gstinCubit.validateField(
                              value: gstinController.text, maxLength: 10));
                    }),
                const SizedBox(
                  height: 15.0,
                ),
                BlocBuilder<FormFieldCubit, TextFormFieldState>(
                    bloc: businessNameCubit,
                    builder: (context, state) {
                      return CustomTextFormField(
 
                          controller: businessnameController,
                          placeholder: 'Business Name',
                          // maxLength: 15,
                          keyboardType: TextInputType.name,
                          hintText: "Enter business name ",
                          onChanged: (value) => businessNameCubit.validateField(
                              value: businessnameController.text,
                              maxLength: 10));
                    }),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFieldSelector(
                  controller: businesstypeController,
                  placeholder: 'Business Type',
                  // maxLength: 15,
                  keyboardType: TextInputType.number,
                  hintText: "choose business type ",
                  choices: [
                    'Sole proprietorship',
                    'Partnership',
                    'Limited liability company',
                    'Company',
                    'Private limited company',
                    'Limited liability partnership',
                    'Governmnent',
                    'Public Limited Company',
                    'Hindu joint company'
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 343,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomText.secondaryTitle(
                  text: 'Registered Business Address',
                  color: CustomColors.blackColor,
                ),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder<CharacterCountCubit, int>(
                  builder: (context, characterCount) {
                    return BlocBuilder<FormFieldCubit, TextFormFieldState>(
                      bloc: streetCubit, // use the specific cubit instance
                      builder: (context, formFieldState) {
                        return CustomTextFormField(
                          controller: streetController,
                          placeholder: 'Street Address',
                          keyboardType: TextInputType.name,
                          hintText: "Enter street address",
                          maxLength: 64,
                          showCharacterCount: true,
                          onChanged: (value) {
                            context
                                .read<CharacterCountCubit>()
                                .updateCharacterCount(value.length);
                            streetCubit.validateField(
                                value: value, maxLength: 64);
                          },
 
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  controller: pincodeController,
                  placeholder: 'Pincode*',
                  keyboardType: TextInputType.name,
                  hintText: "Enter pincode",
                  maxLength: 64,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFieldSelector(
                  controller: cityController,
                  placeholder: 'City*',
                  // maxLength: 15,
                  keyboardType: TextInputType.number,
                  hintText: "choose city",
                  choices: ['Lucknow', 'Kanpur', 'Delhi', 'Bikaner'],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldSelector(
                  controller: stateController,
                  placeholder: 'State*',
                  // maxLength: 15,
                  keyboardType: TextInputType.number,
                  hintText: "choose state",
                  choices: ['UP', 'Delhi', 'Himachal Pradesh', 'Rajasthan'],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFieldSelector(
                  controller: countryController,
                  placeholder: 'Country*',
                  // maxLength: 15,
                  keyboardType: TextInputType.number,
                  hintText: "choose country",
                  choices: ['India', 'USA', 'Japan', 'Russia'],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.secondhoardingScreen);
                  },
                  text: 'Continue',
                  backgroundColor: Color(0xFF282C3E),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
