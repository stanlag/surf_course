import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:task_11_assignment_color_palette/assets/colors/color_palette.dart';
import 'package:task_11_assignment_color_palette/entity/list_colors.dart';
import 'package:task_11_assignment_color_palette/resources/resources.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';

abstract class Model {
  static final List<ListColor> listColor =
      (dataColors['colors'] as List<Map<String, String>>)
          .where((colorData) => colorData.containsKey('value'))
          .toList()
          .map((color) => ListColor(color['name']!, color['value']!))
          .toList();

  static ListColor getColorFromHex(ListColor listColor) {
    String hexColor = listColor.value.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    try {
      listColor.color = Color(int.parse(hexColor, radix: 16));
    } catch (error) {
      listColor = ListColor(listColor.name, TextApp.error);
      listColor.color = Colors.black;
    }
    return listColor;
  }

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      Fluttertoast.showToast(
        msg: TextApp.hexCopy,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColor.black80,
        fontSize: 16.0,
      );
    });
  }
}
