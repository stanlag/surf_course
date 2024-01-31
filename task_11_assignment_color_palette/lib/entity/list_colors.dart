import 'package:flutter/material.dart';

class ListColor {
  final String name;
  final String value;
  Color color = Colors.white;

  ListColor(this.name, this.value);

  factory ListColor.fromJson(Map<String, dynamic> json) {
    return ListColor(
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
