import '../mapper/color_mapper.dart';

class ColorsRepository {
  final ColorsApiAssets colorsApi;
  final ColorMapper colorsMapper;

  ColorsRepository({
    required this.colorsApi,
    required this.colorsMapper,
  });

}

class ColorsApiAssets {
}