import 'package:google_fonts/google_fonts.dart';
import 'package:oohapp/core/app_export.dart';

class CustomText {

/*
  static late final String? text;
  static late final Color? color;
  static late final TextAlign? textAlign;
  static late final int? maxLines;
  static late final bool? softWrap;
  static late final TextOverflow? overflow;
*/

  static primaryTitle(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w600,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static secondaryTitle(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 17,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w600,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static headlineText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static buttonText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w500,
          color: color ?? CustomColors.whiteColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static bodyText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w400,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static inputText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight,
          FontStyle? fontStyle}) =>
      Text(
        text!,
        style: TextStyle(
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            color: color ?? CustomColors.blackColor,
            fontStyle: fontStyle ?? FontStyle.normal),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? false,
        overflow: overflow ?? TextOverflow.fade,
      );

  static calloutText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 12,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w400,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static subHeadingText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          double? fontSize,
          FontWeight? fontWeight,
          TextDecoration? textDecoration,
          FontStyle? fontStyle}) =>
      Text(
        text!,
        style: TextStyle(
            fontSize: fontSize ?? 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: fontWeight ?? FontWeight.w300,
            color: color ?? CustomColors.blackColor,
            decoration: textDecoration ?? TextDecoration.none,
            fontStyle: fontStyle ?? FontStyle.normal),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static footNoteText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 11,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );

  static captionText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 10,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w400,
          color: color ?? CustomColors.blackColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow ?? TextOverflow.fade,
      );
}
