import 'package:flutter/material.dart';
import 'package:meals_app/screen/dessertScreen.dart';
import 'package:meals_app/screen/favorite/favoriteScreen.dart';
import 'package:meals_app/screen/seafoodScreen.dart';
import 'package:meals_app/flavor/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  _setPage() {
    if (_index == 0) {
      return DessertScreen();
    } else if (_index == 1) {
      return SeafoodScreen();
    } else {
      return FavoriteScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(Config.appString),
      ),
      body: _setPage(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        backgroundColor: Color.fromARGB(183, 255, 255, 255),
        fixedColor: Color.fromRGBO(58, 66, 86, 1.0),
        key: Key('bottom'),
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Dessert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Seafood',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _index = 0;
              });
              break;
            case 1:
              setState(() {
                _index = 1;
              });
              break;
            case 2:
              setState(() {
                _index = 2;
              });
              break;
          }
        },
      ),
    );
  }
}
