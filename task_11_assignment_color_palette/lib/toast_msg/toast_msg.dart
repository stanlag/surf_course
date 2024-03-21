
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_11_assignment_color_palette/assets/colors/color_palette.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';


abstract class ToastMsg {
// сообщение о том что скопировали в буфер обмена
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
