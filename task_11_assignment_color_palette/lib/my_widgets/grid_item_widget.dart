import 'package:flutter/material.dart';

import 'package:task_11_assignment_color_palette/entity/list_colors.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key,
    required this.listColor,
    required this.color,
    required this.onLongPress,
    required this.onTap,
    required this.copyOn,
    required this.index,
  });

  final ColorFromThePalette listColor;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool copyOn;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child:ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: ColoredBox(
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(listColor.name, style: Theme.of(context).textTheme.bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(listColor.value,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                width: 3,
              ),
              copyOn
                  ? const Icon(
                Icons.copy,
                size: 12,
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}