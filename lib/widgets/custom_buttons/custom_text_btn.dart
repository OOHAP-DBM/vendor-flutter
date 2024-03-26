import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oohapp/core/app_export.dart';


import '../../core/app_export.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({
    super.key,
    this.onPressed,
    required this.text,
    this.margin,
    this.alignment,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.decoration,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.overflow,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords,
    this.semanticsLabel,
    this.textScaleFactor,
    this.underLineColor,
    this.maxLines,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? underLineColor;
  final String text;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool? wrapWords;
  final String? semanticsLabel;
  final double? textScaleFactor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
              (states) {
            return CustomColors.tertiaryGreen;
          },
        ),
        visualDensity: VisualDensity.compact,
        surfaceTintColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.buttonGreen;
            }
            return Colors.black;
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.all(5.0.r),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.tertiaryGreen;
            }
            return backgroundColor ?? Colors.transparent;
          },
        ),
        /* textStyle: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const TextStyle(color: Colors.black); // Color when pressed
            }
            return const TextStyle(color: CustomColors.buttonGreen); // Color when not pressed
          },
        ),*/

      ),
      onPressed: onPressed,
      child: CustomText.text(
          text: text,
          color: textColor ?? Colors.black,
          //  fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          overflow: overflow,
          textAlign: textAlign,
          softWrap: softWrap,
          fontSize: fontSize,
          decoration: decoration,
          underLineColor: underLineColor,
          maxLines: maxLines),
    );
  }
}


//
//
// class CustomTextBtn extends StatelessWidget {
//   const CustomTextBtn({
//     super.key,
//     required this.onPressed,
//     required this.text,
//     this.child,
//     this.height,
//     this.width,
//     this.isDisabled = true,
//     this.margin,
//     this.alignment,
//     this.fontSize,
//     this.iconColor,
//     this.backgroundColor,
//     this.textColor,
//   });
//
//   final VoidCallback onPressed;
//   final Color? iconColor;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final String text;
//   final Widget? child;
//   final double? height;
//   final double? width;
//   final bool? isDisabled;
//   final EdgeInsets? margin;
//   final Alignment? alignment;
//   final double? fontSize;
//
//   @override
//   Widget build(BuildContext context) {
//
//     //********** We major the height width of mediaQuery in percentage ******//
//
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//           alignment: alignment ?? Alignment.center ,
//           height: height ?? ScaleSize.height(5.66),
//           // This is actual height of button according to figma
//          // width: width ?? ScaleSize.width(100),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4.0),
//             color: backgroundColor ?? CustomColors.buttonGreen,
//           ),
//           child: CustomText.buttonText(text: text)
//       ),
//     );
//
//
//
//
//   }
// }
