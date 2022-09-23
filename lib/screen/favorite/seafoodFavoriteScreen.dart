import 'package:flutter/material.dart';
import 'package:meals_app/model/itemModel.dart';
import 'package:meals_app/resources/favoriteLocalProvider.dart';
import 'package:meals_app/screen/favorite/cardListFavorite.dart';

class SeafoodFavoriteScreen extends StatefulWidget {
  @override
  _SeafoodFavoriteScreenState createState() => _SeafoodFavoriteScreenState();
}

class _SeafoodFavoriteScreenState extends State<SeafoodFavoriteScreen> {
  late Future<List<Meals>> _seafoodFavorite;

  @override
  void initState() {
    _seafoodFavorite =
        FavoriteLocalProvider.db.getFavoriteMealsByType("seafood");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _seafoodFavorite,
        builder: (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals>? favoriteFoods = snapshot.data;
            if (favoriteFoods!.isEmpty) {
              return Center(
                child: Text(
                  "No Favorite Seafood Available",
                  style: TextStyle(
                    color: Color.fromRGBO(58, 66, 86, 1.0),
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "seafood");
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
