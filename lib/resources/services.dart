import 'package:dio/dio.dart';
import '../model/itemModel.dart';

abstract class Services {
  static Future<ItemModel?> getById(String idMeal) async {
    try {
      var response = await Dio()
          .get('www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal');

      // if(response.statusCode = 200) {}

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<ItemModel?> createItem() async {}
}
