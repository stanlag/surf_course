import 'package:flutter/material.dart';

import '../domain/entity/color_entity.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.colorData,
    required this.color,
    required this.onLongPress,
    required this.onTap,
    required this.isCopy,
    required this.index,
  });

  final ColorEntity colorData;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool isCopy;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: SizedBox.square(
              dimension: 100.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(colorData.name, style: Theme.of(context).textTheme.bodySmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(colorData.value,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                width: 3,
              ),
              isCopy
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
