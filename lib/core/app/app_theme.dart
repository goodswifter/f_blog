///
/// Author       : zhongaidong
/// Date         : 2022-04-21 11:54:41
/// Description  : App主题
///
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff171616);
const kPrimaryLightColor = Color(0xff151515);
const primaryDarkColor = Color(0xff1d1d1d);
const secondaryColor = Color(0xff1f1f1f);
const secondaryLightColor = Color(0xff1c1c1c);
const secondaryDarkColor = Color(0xff000000);

ThemeData get appThemeData => ThemeData(
      primaryColor: kPrimaryColor,
      primaryColorLight: kPrimaryLightColor,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      // accentColor: kPrimaryColor,
      colorScheme: ColorScheme.fromSwatch(accentColor: kPrimaryColor),
      appBarTheme: appBarTheme,
      textTheme: const TextTheme(),
    );

AppBarTheme get appBarTheme => const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );
