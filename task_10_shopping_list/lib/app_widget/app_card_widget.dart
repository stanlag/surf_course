import 'package:flutter/material.dart';
import '../const/const.dart';

// Карточки для списков товаров
class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    required this.imageURL,
    required this.title,
    required this.quantityText,
    required this.priceText,
    required this.sale,
    Key? key,
  }) : super(key: key);

  final String imageURL;
  final String title;
  final String quantityText;
  final double priceText;
  final double sale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(imageURL,
                width: 80, height: 80, fit: BoxFit.fitHeight,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            }, errorBuilder: (c, o, s) {
              return Image.asset(AppImages.emptyImage);
            }),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppFont.styleBlackSize14Weight400,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quantityText,
                        style: AppFont.styleBlackSize14Weight400,
                      ),
                      sale == 0
                          ? Text(
                              priceText.toString(),
                              style: AppFont.styleBlackSize14Weight700,
                            )
                          : Row(
                              children: [
                                Text(
                                  priceText.toString(),
                                  style: AppFont.styleGreySize14Weight700,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  (priceText - (priceText * (sale / 100)))
                                      .toString(),
                                  style: AppFont.styleRedSize14Weight700,
                                )
                              ],
                            ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
