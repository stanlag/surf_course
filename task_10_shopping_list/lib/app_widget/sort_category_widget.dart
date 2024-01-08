import 'package:flutter/material.dart';
import '../entity/product_entity.dart';
import '../model_provider/model_provider.dart';
import 'app_card_widget.dart';

// Тут виджет для сортировки товаров по группам
class SortCategoryWidget extends StatelessWidget {
  const SortCategoryWidget({
    super.key,
    required this.model,
  });

  final ModelProvider model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: model.productsByCategory.keys.length,
        itemBuilder: (BuildContext context, int indexGroup) {
          var categoryKey = model.productsByCategory.keys.elementAt(indexGroup);
          var productsInCategory = model.productsByCategory[categoryKey];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(categoryKey, style:Theme.of(context).textTheme.titleLarge),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productsInCategory?.length ?? 0,
                itemBuilder: (BuildContext context, int indexProduct) {
                  var product = productsInCategory![indexProduct];
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
