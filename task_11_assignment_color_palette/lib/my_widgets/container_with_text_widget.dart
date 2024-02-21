import 'package:flutter/material.dart';

class ContainerWithTextWidget extends StatelessWidget {
  const ContainerWithTextWidget({
    super.key,
    required this.color,
    required this.nameColor,
    required this.onLongPress,
    required this.copyOn,
  });

  final String color;
  final String nameColor;
  final VoidCallback onLongPress;
  final bool copyOn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nameColor),
              const SizedBox(width: 30),
              Row(
                children: [
                  Text(color),
                  const SizedBox(width: 3),
                  copyOn
                      ? const Icon(
                          Icons.copy,
                          size: 12,
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
