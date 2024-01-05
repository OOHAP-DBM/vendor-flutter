/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';


GetStorage storage= GetStorage();

class Themes{
  final lightTheme=ThemeData.light().copyWith(
      scaffoldBackgroundColor:storage.read(AppConstant.backgroundColorLight)!=null?storage.read(AppConstant.backgroundColorLight).toString().toColor():AppColor.backgroundColor,
      appBarTheme: AppBarTheme(
          backgroundColor:storage.read(AppConstant.appBarLight)!=null? storage.read(AppConstant.appBarLight).toString().toColor():AppColor.appBarlitght,
          centerTitle:false,
          elevation:1.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:storage.read(AppConstant.appBarLight)!=null?storage.read(AppConstant.appBarLight).toString().toColor():Colors.teal,
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),

          iconTheme: IconThemeData(color:storage.read(AppConstant.iconColorLight)!=null?storage.read(AppConstant.iconColorLight).toString().toColor():Colors.black)
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary:storage.read(AppConstant.secondaryLight)!=null? storage.read(AppConstant.secondaryLight).toString().toColor():Colors.white,
          primary:  storage.read(AppConstant.primaryLight)!=null? storage.read(AppConstant.primaryLight).toString().toColor():Colors.black,
          onPrimaryContainer:storage.read(AppConstant.secondaryLight)!=null? storage.read(AppConstant.secondaryLight).toString().toColor(): Colors.white
      ),
      dialogBackgroundColor:storage.read(AppConstant.dailogColorLight)!=null?storage.read(AppConstant.dailogColorLight).toString().toColor():Colors.white,
      textTheme: TextTheme(
        bodyText1:TextStyle(
            fontSize:storage.read(AppConstant.fontsizeTitleLight)??16.0,
            fontFamily: "Raleway",
            color:storage.read(AppConstant.fontColorTitleLight)!=null? storage.read(AppConstant.fontColorTitleLight).toString().toColor(): Colors.black),
        bodyText2:TextStyle(
            fontFamily: "Raleway",
            fontSize:storage.read(AppConstant.fontsizeSubTitleLight)?? 14.0,
            color:storage.read(AppConstant.fontColorTitleSubtitleLight)!=null? storage.read(AppConstant.fontColorTitleSubtitleLight).toString().toColor(): Colors.black),
        headline4: TextStyle
          (
            fontSize:storage.read(AppConstant.fontsizeHeadingLight)??20.0,
            fontWeight: FontWeight.w500,
            fontFamily: "Raleway",
            color:storage.read(AppConstant.fontColorTitleLight)!=null? storage.read(AppConstant.fontColorTitleLight).toString().toColor():Colors.white),
      )
  );

  final darkTheme=ThemeData.dark().copyWith(
      scaffoldBackgroundColor:  storage.read(AppConstant.backgroundColorDark)!=null?storage.read(AppConstant.backgroundColorDark).toString().toColor():AppColor.backgroundColor,
      appBarTheme: AppBarTheme(
        // backgroundColor: storage.read(AppConstant.appBarDark)!=null? storage.read(AppConstant.appBarDark).toString().toColor():AppColor.appBarColor,
          backgroundColor:Color(0xff005c4b),
          //storage.read(AppConstant.appBarDark)!=null? storage.read(AppConstant.appBarDark).toString().toColor():AppColor.appBarColor,
          centerTitle:false,
          surfaceTintColor:Colors.white,
          titleTextStyle:GoogleFonts.almarai(
              color:storage.read(AppConstant.fontColorTitleDark)!=null? Colors.white:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
          elevation:0,
          actionsIconTheme:IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:Color(0xff005c4b),
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.dark,  // For iOS (dark icons)
          ),
          iconTheme: IconThemeData(color:storage.read(AppConstant.iconColorDark)!=null?storage.read(AppConstant.iconColorDark).toString().toColor():Colors.white)
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColor.appBarColor,
          primary:  Colors.white,
          onPrimaryContainer: AppColor.appBarColor
      ),
      iconTheme: IconThemeData(color: Colors.white),
      bottomAppBarColor:storage.read(AppConstant.appBarDark)!=null? storage.read(AppConstant.appBarDark).toString().toColor():AppColor.appBarColor,
      dialogBackgroundColor:storage.read(AppConstant.dailogColorDark)!=null?storage.read(AppConstant.dailogColorDark).toString().toColor():AppColor.appBarColor,
      textTheme: TextTheme(
        bodyText1:TextStyle(
          // fontSize:storage.read(AppConstant.fontsizeTitleDark)??16.0,
            fontSize:16.0??16.0,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w700,
            color:storage.read(AppConstant.fontColorTitleDark)!=null? Colors.white.withOpacity(0.9): Colors.white.withOpacity(0.9)),
        bodyText2:TextStyle(
            fontSize:14.0?? 14.0,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w500,
            color:storage.read(AppConstant.fontColorTitleSubtitleDark)!=null? Colors.white.withOpacity(0.6): Colors.white.withOpacity(0.6)),
        headline4:TextStyle(
            fontFamily: "Raleway",
            fontSize:storage.read(AppConstant.fontsizeHeadingDark)??20.0,
            fontWeight: FontWeight.w600,
            color:storage.read(AppConstant.fontColorTitleDark)!=null? storage.read(AppConstant.fontColorTitleDark).toString().toColor():Colors.white),
      )
  );
}
extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}*/
