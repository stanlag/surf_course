import 'package:task_10_shopping_list/entity/product_entity.dart';

abstract class SortingFilter<T> {
  List<T> apply(List<T> items);
}

class NoSortingFilter extends SortingFilter<ProductEntity> {
  @override
  List<ProductEntity> apply(List<ProductEntity> items) {
    return items;
  }
}
// TODO(Stanlag): каскадный оператор разобратся
class NameSortingFilter extends SortingFilter<ProductEntity> {
  final bool ascending;

  NameSortingFilter({required this.ascending});

  @override
  List<ProductEntity> apply(List<ProductEntity> items) {
    return List.from(items)..sort((a, b) => ascending ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
  }
}

class PriceSortingFilter extends SortingFilter<ProductEntity> {
  final bool ascending;

  PriceSortingFilter({required this.ascending});

  @override
  List<ProductEntity> apply(List<ProductEntity> items) {
    return List.from(items)..sort((a, b) => ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
  }

}