import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeConfig themeConfig = ThemeConfig();

class ThemeConfig {
  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    useMaterial3: true,
  );

  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      backgroundColor: backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: backgroundColor),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    useMaterial3: true,
  );

  // @desc : manage theme function
  ThemeData intiTheme({bool isDarkTheme = true}) {
    if (!isDarkTheme) return lightMode;
    return darkMode;
  }
}
