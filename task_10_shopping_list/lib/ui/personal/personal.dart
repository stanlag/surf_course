import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_10_shopping_list/const/const.dart';
import '../../app_widget/price_widget.dart';
import '../../app_widget/sort_category_widget.dart';
import '../../app_widget/sort_without_category_widget.dart';
import '../../model_provider/model_provider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import '../../app_widget/build_bottom_sheet_widget.dart';

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
                  style: AppFont.styleBlackSize20Weight700,
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
          model.selectedOption == 'By type from A to Z' ||
          model.selectedOption == 'By type from Z to A'
              ? SortCategoryWidget(model: model)
              : SortWithoutCategoryWidget(model: model),
          const Divider(thickness: 0.5),
          const SizedBox(
            height: 5,
          ),
          PriceWidget(
            itemCountText: '${model.products.length} товаров',
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
