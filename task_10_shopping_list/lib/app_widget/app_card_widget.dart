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
                    style:Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quantityText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      sale == 0
                          ? Text(
                              priceText.toString(),
                              style:Theme.of(context).textTheme.bodySmall
                            )
                          : Row(
                              children: [
                                Text(
                                  priceText.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey, decoration: TextDecoration.lineThrough,),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  (priceText - (priceText * (sale / 100)))
                                      .toString(),
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.red),
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
