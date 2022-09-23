import 'dart:async';
import 'mealsApiProvider.dart';
import '../model/itemModel.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<ItemModel> fetchAllMeals(String type) =>
      mealsApiProvider.fetchMeals(type);

  Future<ItemModel> fetchDetailMeals(String detail) =>
      mealsApiProvider.fetchDetail(detail);
}
