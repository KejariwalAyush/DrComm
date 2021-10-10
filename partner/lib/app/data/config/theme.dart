import 'package:flutter/material.dart';

import '../data.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: kcAccent, focusColor: kcGeryIcon,
    // primaryColor: kcBgAccent,
    backgroundColor: kcBgAccent,
    bottomAppBarColor: Colors.white,
    canvasColor: Colors.white,
    buttonColor: kcAccent,
    cardColor: kcBg,
    disabledColor: kcGeryIcon,
    iconTheme: IconThemeData(color: kcGeryIcon),
    indicatorColor: kcAccent,
    dividerColor: Colors.black87,
    hintColor: kcGeryIcon,
    splashColor: kcLightGrey,
    accentColorBrightness: Brightness.light,
    accentIconTheme: IconThemeData(color: kcGeryIcon),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black)),
    fontFamily: 'Helvetica',
    textTheme: _textTheme,
  );

  static TextTheme _textTheme = TextTheme(
    caption: TextStyle(
      fontFamily: 'HankRnd',
      fontSize: 12,
      color: const Color(0xff1c1c1c),
      fontWeight: FontWeight.w400,
    ),
    headline1: TextStyle(
      fontSize: 26,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      fontSize: 42,
      color: Colors.black,
      // fontFamily: 'HankRnd',
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontSize: 28,
      color: Colors.black,
      fontFamily: 'HankRnd',
      fontWeight: FontWeight.w600,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontFamily: 'HankRnd',
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      fontSize: 22,
      fontFamily: 'HankRnd',
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    subtitle1: TextStyle(
      fontFamily: 'HankRnd',
      fontSize: 16,
      color: const Color(0x523b3b3b),
      fontWeight: FontWeight.w700,
    ),
    button: TextStyle(
      fontFamily: 'HankRnd',
      fontSize: 14,
      color: const Color(0xffffffff),
      fontWeight: FontWeight.w700,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      color: const Color(0xff858585),
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      fontFamily: 'HankRnd',
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  );
}
