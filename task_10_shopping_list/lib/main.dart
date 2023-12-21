import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import 'package:task_10_shopping_list/ui/main_app/main_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Sora',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Sora',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Sora',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Sora',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Sora',
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Sora',
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (context) => ModelProvider(), child: const MainApp()),
    );
  }
}
