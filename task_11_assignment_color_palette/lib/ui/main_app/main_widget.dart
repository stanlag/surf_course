import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/my_widgets/grid_item_widget.dart';
import 'package:task_11_assignment_color_palette/navigation_route_name/navigation_route_name.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';
import 'package:task_11_assignment_color_palette/model/palette_utils_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int copyIndex = -1; // Индекс цвета, на который выполнен долгий таб

  void _changeCopyIndex(int index) {
    setState(() {
      copyIndex = index;
    });
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 30.0,
            crossAxisSpacing: 3.0,
          ),
          itemCount: PaletteUtilsModel.listColor.length,
          itemBuilder: (context, index) {
            final dataColor = PaletteUtilsModel.getColorFromHex(
                PaletteUtilsModel.listColor[index]);

            return GridItem(
              listColor: dataColor,
              color: dataColor.color,
              index: index,
              copyOn: index == copyIndex,
              onLongPress: () {
                _changeCopyIndex(index);
                PaletteUtilsModel.copyToClipboard(dataColor.value);
              },
              onTap: () {
                Navigator.pushNamed(context, NavigationRouteNames.colorWidget,
                    arguments: dataColor);
              },
            );
          },
        ),
      ),
    );
  }
}
