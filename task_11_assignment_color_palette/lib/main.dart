import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/ui/colors_screen/colors_screen.dart';
import 'package:task_11_assignment_color_palette/ui/detailed_colors_screen/detailed_colors_screen.dart';
import 'assets/themes/theme_data.dart';
import 'navigation_route_name/navigation_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Palette',
      theme: AppThemeData.lightTheme,
      initialRoute: NavigationRouteNames.main,
      routes: {
        NavigationRouteNames.main: (_) => const ColorsScreen(),
        NavigationRouteNames.colorWidget: (_) => const DetailedColorsScreen(),
      },
    );
  }
}
