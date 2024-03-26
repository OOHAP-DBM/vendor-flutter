import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oohapp/core/app_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.text,
    this.child,
    this.height,
    this.width,
    this.isDisabled = true,
    this.margin,
    this.alignment,
    this.fontSize,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.splashColor,
    this.highlightColor,
    this.fontWeight,
    this.borderColor,
  });

  final void Function()? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final Color? splashColor;
  final Color? borderColor;
  final Color? highlightColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
/*
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: height ?? ScaleSize.height(5.66),
          // This is actual height of button according to figma
          width: width ?? ScaleSize.width(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor ?? CustomColors.buttonGreen,
          ),
          child: CustomText.buttonText(text: text)),
    );*/

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 42.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(4.r),
          color: backgroundColor ?? CustomColors.buttonGreen,
          border: Border.all(color: borderColor ?? CustomColors.transparent),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Colors.white.withOpacity(0.4),
            highlightColor: highlightColor ?? CustomColors.errorColor,
            borderRadius: borderRadius ?? BorderRadius.circular(4.r),
            onTap: onTap,
            child: Center(
              child: child ??
                  CustomText.text(
                      text: text!,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontSize: fontSize ?? 16.sp,
                      color: textColor ?? CustomColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
