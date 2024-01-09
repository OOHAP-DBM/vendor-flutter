import 'package:flutter/material.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../../../core/app_export.dart';

class _FirstHoardingLocationEntryPage extends StatefulWidget {
  const _FirstHoardingLocationEntryPage({super.key});

  @override
  State<_FirstHoardingLocationEntryPage> createState() =>
      __FirstHoardingLocationEntryPageState();
}

class __FirstHoardingLocationEntryPageState
    extends State<_FirstHoardingLocationEntryPage> {
  @override
  Widget build(BuildContext context) {
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
              const CustomTextFormField(
                placeholder: 'Hoarding Address*',
                maxLength: 10,
                //  keyboardType: TextInputType.none,
                hintText: 'Gomti Nagar',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Pincode*',
                maxLength: 10,
                keyboardType: TextInputType.number,
                hintText: '226010',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFieldSelector(
                placeholder: 'City*',
                choices: ['Lucknow', 'kanpur', 'varanasi', 'delhi'],
                hintText: 'Lucknow',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFieldSelector(
                placeholder: 'State*',
                choices: ['Bihar', 'Up', 'delhi', 'dehradun'],
                hintText: 'uttar pradesh',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFieldSelector(
                placeholder: 'Country*',
                choices: ['India', 'Pakistan', 'Russia', 'Afghanistan'],
                hintText: 'India',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Landmark*',
                //  maxLength: 10,
                //  keyboardType: TextInputType.number,
                hintText: 'puppy car point',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Latitude*',
                maxLength: 10,
                // keyboardType: TextInputType.streetAddress,
                hintText: '10.012.0211.2',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                placeholder: 'Longitude*',
                maxLength: 10,
                // keyboardType: TextInputType.streetAddress,
                hintText: '10.012.0211.2',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {},
                text: 'Continue',
                backgroundColor: const Color(0xFF282C3E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
