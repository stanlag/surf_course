import 'package:flutter/material.dart';

// тут виджет с отображением цен и скидок на экране
class PriceWidget extends StatelessWidget {
  final String itemCountText;
  final String totalPriceText;
  final String discountText;
  final String discountAmountText;
  final String totalAmountText;

  const PriceWidget({
    required this.itemCountText,
    required this.totalPriceText,
    required this.discountText,
    required this.discountAmountText,
    required this.totalAmountText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child:
              Text('В вашей покупке', style:Theme.of(context).textTheme.titleLarge),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(itemCountText, style: Theme.of(context).textTheme.bodyMedium),
            Text(totalPriceText, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(discountText, style: Theme.of(context).textTheme.bodyMedium),
            Text(discountAmountText, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Итого', style: Theme.of(context).textTheme.titleMedium),
            Text(totalAmountText, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
