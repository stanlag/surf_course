import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/my_widgets/grid_item_widget.dart';
import 'package:task_11_assignment_color_palette/navigation_route_name/navigation_route_name.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';

import '../../domain/entity/color_entity.dart';
import '../../mapper/color_mapper.dart';
import '../../toast_msg/toast_msg.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  int copyIndex = -1; // Индекс цвета, на который выполнен долгий таб

  void _changeCopyIndex(int index) {
    setState(() {
      copyIndex = index;
    });
  }

  Future<List<ColorEntity>> fetchColorData() async {
    return await ColorMapper.colorEntityFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 150,
        title: Column(
          children: [
            const SizedBox(
              height: 44,
            ),
            Text(
              TextApp.exclusiveColoredBoxPalette,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 2,
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ColorEntity>>(
        future: fetchColorData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Данные недоступны'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 3.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: ( _ , index) {
                  final entityColor = snapshot.data![index];
                  final dataColor =
                  ColorMapper.getColorFromHex(entityColor.value);
                  return GridItem(
                    colorData: entityColor,
                    color: Color(dataColor),
                    index: index,
                    isCopy: index == copyIndex,
                    onLongPress: () {
                      _changeCopyIndex(index);
                      ToastMsg.copyToClipboard(entityColor.value);
                    },
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRouteNames.colorWidget,
                        arguments: entityColor,
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
