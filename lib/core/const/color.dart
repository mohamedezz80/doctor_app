
import 'package:flutter/material.dart';

class AppColor
{
  static const Color grey = Color(0xff515151);
  static const Color black = Color(0xff000000);
  static const Color blue = Color(0xff5DB1DF);
  static const Color backGround = Color(0xffF8F9FD);
  static const Color backGroundLogin = Color(0xffF0F0F1);
  static Color containerLogin = Colors.blue.withOpacity(0.19);
  static Color primaryColor1 = const Color(0xffCAE3E3).withOpacity(0.99);
  static  Color primaryColor = const Color(0xff0066D9);
  static const Color primaryColor2 = Color(0xff009496);
  static const Color defaultColor =  Color(0xff2C627E);
  static const Color darkColor = Color(0xff242B4B);
  static const Color secColor = Color(0xffF2BE5B);
  static const Color thirdColor = Color(0xffd9e7ee);
  static const Color thirrdColor =  Color(0xff2D3756);
}

ThemeData dark = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

ThemeData light = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);