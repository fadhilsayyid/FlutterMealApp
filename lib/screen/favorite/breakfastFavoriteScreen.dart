import 'package:flutter/material.dart';
import 'package:meals_app/model/itemModel.dart';
import 'package:meals_app/resources/favoriteLocalProvider.dart';
import 'package:meals_app/screen/favorite/cardListFavorite.dart';

class BreakfastFavoriteScreen extends StatefulWidget {
  @override
  _BreakfastFavoriteScreenState createState() =>
      _BreakfastFavoriteScreenState();
}

class _BreakfastFavoriteScreenState extends State<BreakfastFavoriteScreen> {
  late Future<List<Meals>> _breakfastFavorite;

  @override
  void initState() {
    _breakfastFavorite =
        FavoriteLocalProvider.db.getFavoriteMealsByType("breakfast");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _breakfastFavorite,
        builder: (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals>? favoriteFoods = snapshot.data;
            if (favoriteFoods!.isEmpty) {
              return Center(
                child: Text(
                  "No Favorite Breakfast Available",
                  style: TextStyle(
                    color: Color.fromRGBO(58, 66, 86, 1.0),
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "breakfast");
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
