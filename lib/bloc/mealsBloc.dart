import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/itemModel.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMeals => _mealsFetcher.stream;

  fetchBreakfast() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Breakfast");
    _mealsFetcher.sink.add(itemModel);
  }

  fetchDessert() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Dessert");
    _mealsFetcher.sink.add(itemModel);
  }

  dispose() {
    _mealsFetcher.close();
  }
}
