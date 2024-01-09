import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/entity/product_entity.dart';
import 'app_card_widget.dart';

// Тут виджет для сортировки товаров не по группам
class SortWithoutCategoryWidget extends StatelessWidget {
  const SortWithoutCategoryWidget({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return AppCardWidget(
            imageURL: products[index].imageUrl,
            title: products[index].title,
            quantityText: (products[index].amount is Grams)
                ? '${(products[index].amount.value / 1000)} кг'
                : '${products[index].amount.value} шт',
            priceText: (products[index].price / 100),
            sale: products[index].sale,
          );
        },
      ),
    );
  }
}
