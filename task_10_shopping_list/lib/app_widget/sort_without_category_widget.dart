import 'package:flutter/material.dart';
import '../entity/classes.dart';
import '../model_provider/model_provider.dart';
import 'app_card_widget.dart';

// Тут виджет для сортировки товаров не по группам
class SortWithoutCategoryWidget extends StatelessWidget {
  const SortWithoutCategoryWidget({
    super.key,
    required this.model,
  });
  final ModelProvider model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.products.length,
        itemBuilder: (BuildContext context, int index) {
          return AppCardWidget(
            imageURL: model.products[index].imageUrl,
            title: model.products[index].title,
            quantityText: (model.products[index].amount is Grams)
                ? '${(model.products[index].amount.value / 1000)} кг'
                : '${model.products[index].amount.value} шт',
            priceText: (model.products[index].price / 100),
            sale: model.products[index].sale,
          );
        },
      ),
    );
  }
}
