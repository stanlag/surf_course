import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_10_shopping_list/entity/sorted_products.dart';
import 'package:task_10_shopping_list/app_widget/price_widget.dart';
import 'package:task_10_shopping_list/app_widget/sort_category_widget.dart';
import 'package:task_10_shopping_list/app_widget/sort_without_category_widget.dart';
import 'package:task_10_shopping_list/assets/colors/color_palette.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:task_10_shopping_list/app_widget/build_bottom_sheet_widget.dart';

// Страница с чеком
class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ModelProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Список покупок',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: IconButton(
                        onPressed: () {
                          showFlexibleBottomSheet(
                            minHeight: 0,
                            initHeight: 0.8,
                            maxHeight: 0.8,
                            context: context,
                            builder: (
                              BuildContext context,
                              ScrollController scrollController,
                              double bottomSheetOffset,
                            ) {
                              return BuildBottomSheetWidget(model: model);
                            },
                            isExpand: false,
                            bottomSheetBorderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                          );
                        },
                        icon: const Icon(
                          Icons.sort,
                          size: 24,
                        ))),
              ],
            ),
          ),
          switch (model.products){
            ProductsWithoutCategory(data: final data) => SortWithoutCategoryWidget(products: data),
            ProductsWithCategory(productsByCategoryMap: final data) => SortCategoryWidget(products: data),
          },
          const Divider(thickness: 0.5),
          const SizedBox(
            height: 5,
          ),
          PriceWidget(
            itemCountText: '${model.products.data.length} товаров',
            totalPriceText: '${model.totalPriceText / 100} руб',
            discountText: model.discountText < 1
                ? 'Скидка меньше 1 %'
                : 'Скидка  ${model.discountText.floor()} %',
            discountAmountText: '- ${model.discountAmountText / 100} руб',
            totalAmountText: '${model.totalAmountText / 100} руб',
          )
        ],
      ),
    );
  }
}
