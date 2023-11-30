import 'package:flutter/material.dart';

import '../const/const.dart';

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
              Text('В вашей покупке', style: AppFont.styleBlackSize20Weight700),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(itemCountText, style: AppFont.styleBlackSize14Weight400),
            Text(totalPriceText, style: AppFont.styleBlackSize14Weight700),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(discountText, style: AppFont.styleBlackSize14Weight400),
            Text(discountAmountText, style: AppFont.styleBlackSize14Weight700),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Итого', style: AppFont.styleBlackSize18Weight700),
            Text(totalAmountText, style: AppFont.styleBlackSize18Weight700),
          ],
        ),
      ],
    );
  }
}
