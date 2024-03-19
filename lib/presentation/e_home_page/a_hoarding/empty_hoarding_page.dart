import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart';

class EmptyHoardingPage extends StatelessWidget {
  const EmptyHoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Add Hoarding',
          centerTitle: true,
          elevation: 1,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.20,
                width: size.width * 0.40,

                child: CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: ImageConstant.hoarding,
                ),
              ),
              CustomText.headlineText(text: 'No Hoarding Added'),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                width: size.width * 0.45,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.hoardinglistscreen);
                  },
                  text: '+ Add Hoarding',
                  backgroundColor: Color(0xFF282C3E),)
            ],
          ),
        ));
  }
}
