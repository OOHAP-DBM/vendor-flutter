import 'package:flutter/material.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/add_hoarding_final_second_page/widgets/custom_slider_button_new.dart';

import '../../../../core/app_export.dart';

class FinalAddHoardingSecondPage extends StatefulWidget {
  const FinalAddHoardingSecondPage({super.key});

  @override
  State<FinalAddHoardingSecondPage> createState() => _FinalAddHoardingSecondPageState();
}

class _FinalAddHoardingSecondPageState extends State<FinalAddHoardingSecondPage> {
  @override
  Widget build(BuildContext context) {
    bool showadditionalUI=false;

    return Scaffold(
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
              CustomText.secondaryTitle(
                text: 'Add Hoarding',
                color: CustomColors.blackColor,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Pricing',
                textAlign: TextAlign.center,
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
              const CustomTextFormField(
                placeholder: 'Set Base Price*',
                hintText: '₹',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Printing Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Mounting Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Designing Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
               NewCustomSliderButton(
      title: 'By Weekly',
      onToggle: (isOn) {
        setState(() {
          showadditionalUI = isOn;
        });
      },
    ),
    if (showadditionalUI) _buildAdditionalUI(),
              const NewCustomSliderButton(title: 'By Monthly'),
              const NewCustomSliderButton(title: 'By Yearly'),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAdditionalUI() {
  // Replace with your actual UI components
  return Column(
    children: [
  
      Text('This is the additional UI displayed when YES is selected'),
    ],
  );
}
}
