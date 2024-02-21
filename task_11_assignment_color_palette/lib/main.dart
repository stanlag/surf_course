import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/ui/color_widget/color_widget.dart';
import 'package:task_11_assignment_color_palette/ui/main_app/main_widget.dart';

import 'assets/themes/theme_data.dart';
import 'navigation_route_name/navigation_route_name.dart';

void main() {
  runApp(const MyApp());
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
        NavigationRouteNames.main: (_) => const MainWidget(),
        NavigationRouteNames.colorWidget: (_) => const ColorWidget(),

      },

    );
  }
}
