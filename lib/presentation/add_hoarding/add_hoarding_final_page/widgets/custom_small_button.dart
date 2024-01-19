import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart'; // Make sure this path is correct for your project structure

class CustomSmallButton extends StatelessWidget {
  CustomSmallButton({
    super.key,
    required this.onTap,
    required this.text,
    this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.iconOnTap,
  });

  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Widget? child;
  final double? height;
  final double? width;
  final VoidCallback? iconOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 163.50,
        height: height ?? 46,
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: backgroundColor ?? Colors.white, // Default color added
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF282C3E)),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText.subHeadingText(
                text: text,
                color: textColor, // Use textColor
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: iconOnTap,
                child: CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: ImageConstant.warningicon, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
