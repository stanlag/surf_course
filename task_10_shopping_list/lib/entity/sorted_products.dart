import 'package:task_10_shopping_list/entity/product_entity.dart';
import 'package:collection/collection.dart';

import 'category.dart';

sealed class SortedProducts {
  List<ProductEntity> get data;
}

class ProductsWithoutCategory implements SortedProducts {
  final List<ProductEntity> _data;

  ProductsWithoutCategory({required List<ProductEntity> data}) : _data = data;

  @override
  List<ProductEntity> get data => _data;
}

class ProductsWithCategory implements SortedProducts {
  final List<ProductEntity> _data;

  ProductsWithCategory({required List<ProductEntity> data}) : _data = data;

  Map<Category, List<ProductEntity>> get productsByCategoryMap {
    return groupBy(_data, (product) => product.category);
  }

  @override
  List<ProductEntity> get data => _data;
}


