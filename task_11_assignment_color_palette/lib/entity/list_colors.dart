import 'package:flutter/material.dart';

/// Класс описывающий цвет одной ячейки в сетку палитр
class ColorFromThePalette {

  final String name;
  final String value;
  Color color = Colors.white;

  ColorFromThePalette(this.name, this.value);

  factory ColorFromThePalette.fromJson(Map<String, dynamic> json) {
    return ColorFromThePalette(
      json['name'] as String,
      json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };

  @override
  String toString() {
    return 'ListColor{name: $name, value: $value}';
  }
}
