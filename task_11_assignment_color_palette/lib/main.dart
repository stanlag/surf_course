import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/repositiry/colors_repository.dart';
import 'package:task_11_assignment_color_palette/ui/colors_screen/colors_screen.dart';
import 'package:task_11_assignment_color_palette/ui/detailed_colors_screen/detailed_colors_screen.dart';


import 'assets/themes/theme_data.dart';
import 'mapper/color_mapper.dart';
import 'navigation_route_name/navigation_route_name.dart';

void main() {
  runApp(const MyApp());
  /// Пока не изучали DI создаём необходимые зависимости тут
  // final colorsRepository = ColorsRepository(
  //   colorsApi: ColorsApiAssets(),
  //   colorsMapper: ColorMapper(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.lightTheme,
      initialRoute: NavigationRouteNames.main,
      routes: {
        NavigationRouteNames.main: (_) => const ColorsScreen(),
        NavigationRouteNames.colorWidget: (_) => const DetailedColorsScreen(),

      },

    );
  }
}
