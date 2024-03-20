import 'package:task_11_assignment_color_palette/resources/text.dart';

/// RGB
enum RgbType {
  red(TextApp.redColorsScreen),
  green(TextApp.greenColorsScreen),
  blue(TextApp.blueColorsScreen);

  final String name;

  const RgbType(this.name);
}
