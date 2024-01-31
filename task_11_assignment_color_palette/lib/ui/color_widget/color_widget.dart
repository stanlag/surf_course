import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/model/model.dart';
import 'package:task_11_assignment_color_palette/entity/list_colors.dart';
import 'package:task_11_assignment_color_palette/my_widgets/container_with_text_widget.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({super.key});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  int copyIndex = -1;

  void _changeCopyIndex(int index) {
    setState(() {
      copyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listColor = ModalRoute.of(context)!.settings.arguments as ListColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: listColor.color,
      ),
      body: Column(
        children: [
          Container(height: 300, color: listColor.color),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listColor.name,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 15,
                ),
                ContainerWithTextWidget(
                  color: listColor.value,
                  nameColor: TextApp.hex,
                  copyOn: copyIndex == 0,
                  onLongPress: () {
                    _changeCopyIndex(0);
                    Model.copyToClipboard(listColor.value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerWithTextWidget(
                      nameColor: TextApp.red,
                      color: listColor.color.red.toString(),
                      copyOn: copyIndex == 1,
                      onLongPress: () {
                        _changeCopyIndex(1);
                        Model.copyToClipboard(listColor.color.red.toString());
                      },
                    ),
                    ContainerWithTextWidget(
                      nameColor: TextApp.green,
                      color: listColor.color.green.toString(),
                      copyOn: copyIndex == 2,
                      onLongPress: () {
                        _changeCopyIndex(2);
                        Model.copyToClipboard(listColor.color.green.toString());
                      },
                    ),
                    ContainerWithTextWidget(
                      nameColor: TextApp.blue,
                      color: listColor.color.blue.toString(),
                      copyOn: copyIndex == 3,
                      onLongPress: () {
                        _changeCopyIndex(3);
                        Model.copyToClipboard(listColor.color.blue.toString());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
