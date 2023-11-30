import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color lightGreen = Color.fromRGBO(103, 205, 0, 1);
  static const Color darkGrey = Color.fromRGBO(96, 96, 123, 1);
  static const Color lightGrey = Color.fromRGBO(237, 237, 237, 1);
  static const Color black = Color.fromRGBO(37, 40, 73, 1);
  static const Color red = Color.fromRGBO(255, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
}

abstract class AppFont {
  static TextStyle styleBlackSize20Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.black);

  static TextStyle styleBlackSize18Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.black);

  static TextStyle styleWhiteSize18Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.white);

  static TextStyle styleBlackSize14Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.black);

  static TextStyle styleGreySize14Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough);

  static TextStyle styleRedSize14Weight700 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.red);

  static TextStyle styleBlackSize14Weight400 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.darkGrey);

  static TextStyle styleBlackSize12Weight400 = const TextStyle(
      fontFamily: 'Sora',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.darkGrey);
}

abstract class AppImages {
  static const String emptyImage = 'images/empty.png';
}
