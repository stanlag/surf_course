
class ProductEntity {
  final String title;
  final int price;
  final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });
}


/// Класс, описывающий количество товара.
sealed class Amount {
  int get value;
}

/// Класс, описывающий количество товара в граммах.
class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}

/// Класс, описывающий количество товара в штуках.
class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}

/// Категория товара.
enum Category {
  food('Продукты питания'),
  tech('Технологичные товары'),
  care('Уход'),
  drinks('Напитки'),
  drugs('Медикаменты');

  final String name;

  const Category(this.name);
}


enum SortingSelection{
  noSorting ('noSorting'),
  byNameFromAToZ('byNameFromAToZ'),
  byNameFromZToA('byNameFromZToA'),
  ascending('ascending'),
  descending('descending'),
  byTypeFromAToZ('byTypeFromAToZ'),
  byTypeFromZToA('byTypeFromZToA');

  final String name;

  const SortingSelection(this.name);
}



////// не получается с это реализовать помогите

abstract class SortingFilter<T> {
  List<T> apply(List<T> items);
}

class NoSortingFilter extends SortingFilter<ProductEntity> {
  @override
  List<ProductEntity> apply(List<ProductEntity> items) {
    return items;
  }
}

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
////// не получается с это реализовать помогите