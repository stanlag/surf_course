import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/entity/category.dart';
import 'package:task_10_shopping_list/entity/product_entity.dart';
import 'app_card_widget.dart';

// Тут виджет для сортировки товаров по группам
class SortCategoryWidget extends StatelessWidget {
  const SortCategoryWidget({
    super.key,
    required this.products,
  });

  final Map<Category, List<ProductEntity>> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.keys.length,
        itemBuilder: (BuildContext context, int indexGroup) {
          final categoryKey = products.keys.elementAt(indexGroup);
          final productsInCategory = products[categoryKey];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoryKey.name,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productsInCategory?.length ?? 0,
                itemBuilder: (context, indexProduct) {
                  final product = productsInCategory![indexProduct];
                  return AppCardWidget(
                    imageURL: product.imageUrl,
                    title: product.title,
                    quantityText: (product.amount is Grams)
                        ? '${(product.amount.value / 1000)} кг'
                        : '${product.amount.value} шт',
                    priceText: (product.price / 100),
                    sale: product.sale,
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
