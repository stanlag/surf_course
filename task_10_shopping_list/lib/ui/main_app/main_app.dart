import 'package:flutter/material.dart';

import '../../assets/colors/color_palette.dart';
import '../personal/personal.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedIndex = 3;
  final List<Widget> widgetOptions = <Widget>[
    const Center(child: Text('Каталог')),
    const Center(child: Text('Поиск')),
    const Center(child: Text('Корзина')),
    const Personal(),
  ];

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Чек № 56', style:Theme.of(context).textTheme.titleLarge),
            Text('24.02.23 в 12:23', style:Theme.of(context).textTheme.bodySmall),
          ],
        ),
        centerTitle: true,
      ),
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
               color: AppColor.lightGrey, // Цвет линии
              width: 1.0, // Ширина линии
            ),
          ),
        ),
        child: BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
           unselectedItemColor: AppColor.darkGrey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_mall_outlined),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Личное',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
