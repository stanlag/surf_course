import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import 'package:task_10_shopping_list/ui/main_app/main_app.dart';
import 'assets/themes/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.lightTheme,
      home: ChangeNotifierProvider(
          create: (context) => ModelProvider(), child: const MainApp()),
    );
  }
}
