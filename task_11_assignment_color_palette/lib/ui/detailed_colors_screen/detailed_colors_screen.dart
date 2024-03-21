import 'package:flutter/material.dart';
import 'package:task_11_assignment_color_palette/my_widgets/container_with_text_widget.dart';
import 'package:task_11_assignment_color_palette/resources/text.dart';
import 'package:collection/collection.dart';
import 'package:task_11_assignment_color_palette/api/color_api/color_api.dart';
import 'package:task_11_assignment_color_palette/domain/entity/color_entity.dart';
import 'package:task_11_assignment_color_palette/domain/entity/rgb_type.dart';
import 'package:task_11_assignment_color_palette/toast_msg/toast_msg.dart';

class DetailedColorsScreen extends StatefulWidget {
  const DetailedColorsScreen({super.key});

  @override
  State<DetailedColorsScreen> createState() => _DetailedColorsScreenState();
}

class _DetailedColorsScreenState extends State<DetailedColorsScreen> {
  int copyIndex = -1;

  void _changeCopyIndex(int index) {
    setState(() {
      copyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final entityColor =
        ModalRoute.of(context)!.settings.arguments as ColorEntity;
    final color = Color(ColorApi.getColorFromHex(entityColor.value));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Padding(
            padding: EdgeInsets.all(16),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entityColor.name,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 15,
                ),
                ContainerWithTextWidget(
                  color: entityColor.value,
                  nameColor: TextApp.hex,
                  copyOn: copyIndex == 0,
                  onLongPress: () {
                    _changeCopyIndex(0);
                    ToastMsg.copyToClipboard(entityColor.value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                _RgbWidget(color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RgbWidget extends StatefulWidget {
  final Color color;

  const _RgbWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<_RgbWidget> createState() => _RgbWidgetState();
}

class _RgbWidgetState extends State<_RgbWidget> {
  int copyIndex = -1;

  void _changeCopyIndex(int index) {
    setState(() {
      copyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RgbType.values
          .expandIndexed(
            (i, e) => [
              Expanded(
                child: ContainerWithTextWidget(
                  nameColor: e.name,
                  color: switch (e) {
                    RgbType.red => widget.color.red.toString(),
                    RgbType.green => widget.color.green.toString(),
                    RgbType.blue => widget.color.blue.toString(),
                  },
                  onLongPress: () {
                    String copiedColor;
                    switch (e) {
                      case RgbType.red:
                        copiedColor = widget.color.red.toString();
                        _changeCopyIndex(0);
                        break;
                      case RgbType.green:
                        copiedColor = widget.color.green.toString();
                        _changeCopyIndex(1);
                        break;
                      case RgbType.blue:
                        copiedColor = widget.color.blue.toString();
                        _changeCopyIndex(2);
                        break;
                    }
                    ToastMsg.copyToClipboard(copiedColor);
                  },
                  copyOn: i == copyIndex,
                ),
              ),
              if (i != RgbType.values.length - 1) const SizedBox(width: 8),
            ],
          )
          .toList(),
    );
  }
}
