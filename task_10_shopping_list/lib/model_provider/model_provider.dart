
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../entity/classes.dart';
import '../product_sheet/product_sheet.dart';

// тут расчеты и сортировки
class ModelProvider extends ChangeNotifier {

  var selectedOption = SortingSelection.noSorting.name;
  var products = dataForStudents;
  var productsByCategory ={};


  int get totalPriceText => products.map((ProductEntity product) =>  product.price).fold(0, (sum, price) => sum + price);
  int get totalAmountText => products
      .map((product) => (product.price * (1 - product.sale / 100)).round())
      .fold(0, (total, discountedPrice) => total + discountedPrice);
  int get discountAmountText => totalPriceText - totalAmountText;
  double get discountText => (1-(totalAmountText/totalPriceText))*100;



  Map<String, List<ProductEntity>> productsByCategorySort(bool ascending) {
    var groupedProducts = groupBy(products, (product) => product.category.name);
    groupedProducts.removeWhere((key, value) => value.isEmpty);
    List<String> sortedKeys = groupedProducts.keys.toList()..sort((a, b) => ascending ? a.compareTo(b) : b.compareTo(a));
    return {for (var key in sortedKeys) key: groupedProducts[key]!};
  }



void sort() {
    if (selectedOption == SortingSelection.noSorting.name) {
      products = dataForStudents;
    }
    else if (selectedOption == SortingSelection.byNameFromAToZ.name) {
      products.sort((a, b) => a.title.compareTo(b.title));
    }
    else if (selectedOption == SortingSelection.byNameFromZToA.name) {
      products.sort((a, b) => b.title.compareTo(a.title));
    }
    else if (selectedOption == SortingSelection.ascending.name) {
      products.sort((a, b) => a.price.compareTo(b.price));
    }
    else if (selectedOption == SortingSelection.descending.name) {
      products.sort((a, b) => b.price.compareTo(a.price));
    }
    else if (selectedOption == SortingSelection.byTypeFromAToZ.name) {
      productsByCategory = productsByCategorySort(true);
    }
    else if (selectedOption == SortingSelection.byTypeFromZToA.name) {
      productsByCategory = productsByCategorySort(false);
    }

  notifyListeners();
}



}