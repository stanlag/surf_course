
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../entity/classes.dart';
import '../product_sheet/product_sheet.dart';

// тут расчеты и сортировки
class ModelProvider extends ChangeNotifier {

  String selectedOption = 'No sorting';
  var products = dataForStudents;
  Map<String, List<ProductEntity>> productsByCategory ={};


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


// Вопрос почему когда выбираещь сортировки все меняется,
// но если выбираешь список без сортировки ('No sorting') то не работает?
void sort() {
  switch (selectedOption) {
    case 'No sorting':
      products = dataForStudents;
      break;
    case 'By name from A to Z':
      products.sort((a, b) => a.title.compareTo(b.title));
      break;
    case 'By name from Z to A':
      products.sort((a, b) => b.title.compareTo(a.title));
      break;
    case 'Ascending':
      products.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 'Descending':
      products.sort((a, b) => b.price.compareTo(a.price));
      break;
    case 'By type from A to Z':
      productsByCategory = productsByCategorySort(true);
      break;
    case 'By type from Z to A':
      productsByCategory = productsByCategorySort(false);
      break;
  }
  notifyListeners();
}



}