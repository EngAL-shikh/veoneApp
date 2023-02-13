// ignore_for_file: unnecessary_import, deprecated_member_use, prefer_const_constructors, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
//ThemeData theme() {
//
//  return ThemeData(
//
//    primaryColor: Constants.primaryColor,
//    accentColor: Constants.backdark,
//    scaffoldBackgroundColor: Constants.lightPrimary,
//    focusColor: Constants.White,
//    fontFamily: "Tajawal",
//    appBarTheme: appBarTheme(),
//    textTheme: textTheme(),
//    inputDecorationTheme: inputDecorationTheme(),
//    visualDensity: VisualDensity.adaptivePlatformDensity,
//
//  );
//
//}
//
//
//
//
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
    borderSide: BorderSide(color: Constants.red),
    //  gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal:5, vertical: 2),
    //enabledBorder: outlineInputBorder,
    // focusedBorder: outlineInputBorder,
    // border: outlineInputBorder,
  );
}
//
//TextTheme textTheme() {
//
//  return TextTheme(
//
//    caption:TextStyle(color:   Constants.grey, fontSize: 12.0),
//    headline6: TextStyle(color: Constants.pureBlack, fontSize: 12.0,fontWeight: FontWeight.bold),
//    bodyText1: TextStyle(color: Constants.pureBlack, fontSize: 12.0),
//    bodyText2: TextStyle(color: Constants.pureBlack, fontSize: 12.0),
//    headline4: TextStyle(color: Constants.pureBlack,
//        fontWeight: FontWeight.bold, fontSize: 15.0),
//    headline5: TextStyle(color: Constants.pureBlack,
//        fontWeight: FontWeight.bold, fontSize: 12.0),
//    headline2: TextStyle(color: Constants.pureBlack, fontSize: 12.0),
//
//
//  );
//}
//
//AppBarTheme appBarTheme() {
//  return AppBarTheme(
//    color: Constants.red.withOpacity(0.0),
//    elevation: 0,
//    brightness: Brightness.light,
//    iconTheme: IconThemeData(color: Constants.primaryColor),
//    textTheme: TextTheme(
//      headline6: TextStyle(color: Constants.pureBlack, fontSize: 15),
//    ),
//  );
//}


class ThemeService{
  ThemeData themedark() {
    return ThemeData(
     // primaryColor: Constants.red,
    //  accentColor: Constants.White,
      scaffoldBackgroundColor: Constants.dark2,
      //focusColor: Constants.darkGrey,
      fontFamily: "Tajawal",
//      appBarTheme: appBarTheme(),
     //textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
     // visualDensity: VisualDensity.adaptivePlatformDensity,
    );

  }

  ThemeData themelight() {

     const primaryColor= Color(0xFF00512D);
     const secondaryColor= Color(0xFFCF9F69);
     const whiteColor= Color(0xFFFCFCFC);
     const darkColor= Color(0xFF382E1E);
    return ThemeData(
    //  primaryColor: Constants.White,
     // accentColor: Constants.White,
      scaffoldBackgroundColor: Constants.White,
     // focusColor: Constants.darkGrey,
      fontFamily: "Tajawal",
//      appBarTheme: appBarTheme(),
//      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
     // visualDensity: VisualDensity.adaptivePlatformDensity,
    );

  }










  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';


  void saveThemeData(bool isDarkMode) {

    _getStorage.write(_darkThemeKey, isDarkMode);

  }

  bool isSavedDarkMode() {

    return _getStorage.read(_darkThemeKey) ?? false;

  }






  ThemeMode getThemeMode() {

    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  }

  void changeTheme() {

    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());

  }

}
