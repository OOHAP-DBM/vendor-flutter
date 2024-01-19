import 'package:flutter/material.dart';
import '../../../../core/app_export.dart'; // Ensure this path matches your project structure

void showCustomDialog(
    BuildContext context, String title, String content, String imagePath) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // This makes the modal background transparent
    builder: (BuildContext context) {

      return LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, 
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ), // Rounded corners only on the top side
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomText.secondaryTitle(color: Colors.black, text: title),
              const SizedBox(height: 20.0),
              Text(
                content,
                style: const TextStyle(
                      color: CustomColors.grey, // Replace with your color constant
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 24.0),
              Container(
                height: 50, // Adjust the size as needed
                width: 30, // Adjust the size as needed
                child: CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: ImageConstant.hoarding, // Replace with your image constant
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
