import 'package:flutter/material.dart';

import 'package:task_10_shopping_list/assets/colors/color_palette.dart';
import 'package:task_10_shopping_list/assets/text/text_style.dart';

abstract class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.lightGreen,
        onPrimary: AppColor.black,
        secondary: AppColor.black,
        onSecondary: AppColor.black,
        error: AppColor.red,
        onError: AppColor.red,
        background: AppColor.white,
        onBackground: AppColor.white,
        surface: AppColor.black,
        onSurface: AppColor.black),
    textTheme: AppTextTheme.appTextTheme,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Sora',
    useMaterial3: true,
  );
}
