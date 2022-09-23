import 'package:flutter/material.dart';
import 'package:meals_app/screen/favorite/dessertFavoriteScreen.dart';
import 'package:meals_app/screen/favorite/seafoodFavoriteScreen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.blueGrey,
            tabs: [
              Tab(text: "Dessert"),
              Tab(text: "Seafood"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          DessertFavoriteScreen(),
          SeafoodFavoriteScreen()
        ]),
      ),
    );
  }
}
