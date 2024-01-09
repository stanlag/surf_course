import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/entity/product_entity.dart';
import 'package:task_10_shopping_list/entity/sorted_products.dart';
import 'package:task_10_shopping_list/entity/sorting_selection.dart';
import 'package:task_10_shopping_list/product_sheet/product_sheet.dart';

// тут расчеты и сортировки
class ModelProvider extends ChangeNotifier {
  var selectedOption = SortingSelection.noSorting;
  SortedProducts products =
      ProductsWithoutCategory(data: List.from(dataForStudents));

  var productsByCategory = {};

  int get totalPriceText => products.data
      .map((ProductEntity product) => product.price)
      .fold(0, (sum, price) => sum + price);

  int get totalAmountText => products.data
      .map((product) => (product.price * (1 - product.sale / 100)).round())
      .fold(0, (total, discountedPrice) => total + discountedPrice);

  int get discountAmountText => totalPriceText - totalAmountText;

  double get discountText => (1 - (totalAmountText / totalPriceText)) * 100;

  void sort() {
    switch (selectedOption) {
      case SortingSelection.noSorting:
        products = ProductsWithoutCategory(data: List.from(dataForStudents));

      case SortingSelection.byNameFromAToZ:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => a.title.compareTo(b.title));
        products = ProductsWithoutCategory(data: data);

      case SortingSelection.byNameFromZToA:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => b.title.compareTo(a.title));
        products = ProductsWithoutCategory(data: data);

      case SortingSelection.ascending:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => a.price.compareTo(b.price));
        products = ProductsWithoutCategory(data: data);

      case SortingSelection.descending:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => b.price.compareTo(a.price));
        products = ProductsWithoutCategory(data: data);

      case SortingSelection.byTypeFromAToZ:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => a.category.name.compareTo(b.category.name));
        products = ProductsWithCategory(data: data);
      case SortingSelection.byTypeFromZToA:
        final data = List<ProductEntity>.from(dataForStudents);
        data.sort((a, b) => b.category.name.compareTo(a.category.name));
        products = ProductsWithCategory(data: data);
    }

    notifyListeners();
  }
}
