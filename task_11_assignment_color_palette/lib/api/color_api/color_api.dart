import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:task_11_assignment_color_palette/api/%20data/color_data.dart';
import 'package:task_11_assignment_color_palette/domain/entity/color_entity.dart';

class ColorApi {
  /// Имитируем задержку чтобы увидеть лоадер
  Future<void> _addDelay(int ms) =>
      Future<void>.delayed(Duration(milliseconds: ms));

   Future<List<ColorEntity>> colorEntityFromJson() async {
    await _addDelay(1000);
    String data = await rootBundle.loadString('assets/json/package.json');
    final decoded = json.decode(data);
    final List<ColorData> listColorData = (decoded['colors'] as List<dynamic>)
        .where(
            (data) => data is Map<String, dynamic> && data.containsKey('value'))
        .map((color) => ColorData.fromJson(color))
        .toList();
    List<ColorEntity> listColorEntity = listColorData
        .map((data) =>
            ColorEntity(name: data.name, value: data.value ?? '#FFFFFF'))
        .toList();

    return listColorEntity;
  }

   int getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    } else {
      hexColor = '#FFFFFF';
    }
    return int.parse(hexColor, radix: 16);
  }
}
