import 'package:flutter/material.dart';
import 'package:meals_app/bloc/detailBloc.dart';
import 'package:meals_app/model/itemModel.dart';
import 'package:meals_app/resources/favoriteLocalProvider.dart';

class DetailScreen extends StatefulWidget {
  final String idMeal;
  final String strMeal;
  final String? strMealThumb;
  final String? type;

  const DetailScreen(
      {Key? key,
      required this.idMeal,
      required this.strMeal,
      this.strMealThumb,
      this.type})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final bloc = DetailBloc();
  late ItemModel itemModel;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    bloc.fetchDetailMeals(widget.idMeal);
    FavoriteLocalProvider.db.getFavoriteMealsById(widget.idMeal).then((value) {
      setState(() => _isFavorite = value != null);
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black45,
              expandedHeight: 250,
              floating: false,
              pinned: true,
              leading: IconButton(
                key: Key('back'),
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: <Widget>[actionSaveorDelete()],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.strMeal,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                // background: Hero(
                //   tag: widget.strMeal,
                //   child: Image.network(widget.strMealThumb,
                //       width: double.infinity, fit: BoxFit.cover),
                // ),
              ),
            ),
          ];
        },
        body: getDetailMeal(),
      ),
    );
  }

  getDetailMeal() {
    return StreamBuilder(
        stream: bloc.detailMeals,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            itemModel = snapshot.data!;
            return _showListDetail(itemModel);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          )));
        });
  }

  Widget _showListDetail(ItemModel itemModel) {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color.fromRGBO(58, 66, 86, 1.0),
              padding: EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Deskripsi :",
                      style: TextStyle(
                          color: Color.fromARGB(209, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     itemModel.meals[0].strInstructions,
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionSaveorDelete() {
    if (_isFavorite) {
      return GestureDetector(
        onTap: () {
          FavoriteLocalProvider.db
              .deleteFavoriteMealsById(widget.idMeal)
              .then((value) {
            if (value > 0) {
              setState(() => _isFavorite = false);
            }
          });
          // showToast(context, "Remove from Favorite", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.favorite),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Meals favoriteFood = Meals(
              idMeal: widget.idMeal,
              strMeal: widget.strMeal,
              // strMealThumb: widget.strMealThumb,
              type: widget.type,
              strArea: '',
              strCategory: '',
              strIngredient1: '',
              strIngredient10: '',
              strIngredient12: '',
              strIngredient11: '',
              strIngredient13: '',
              strIngredient14: '',
              strIngredient15: '',
              strIngredient16: '',
              strIngredient17: '',
              strIngredient18: '',
              strIngredient19: '',
              strIngredient2: '',
              strIngredient20: '',
              strIngredient3: '',
              strIngredient4: '',
              strIngredient5: '',
              strIngredient6: '',
              strIngredient7: '',
              strIngredient8: '',
              strIngredient9: '',
              strMeasure1: '',
              strMeasure10: '',
              // strInstructions: '',
              strMeasure11: '',
              strMeasure12: '',
              strMeasure13: '',
              strMeasure14: '',
              strMeasure15: '',
              strMeasure16: '',
              strMeasure17: '',
              strMeasure18: '',
              strMeasure19: '',
              strMeasure2: '',
              strMeasure20: '',
              strMeasure3: '',
              strMeasure4: '',
              strMeasure5: '',
              strMeasure6: '',
              strMeasure7: '',
              strMeasure8: '',
              strMeasure9: '',
              strYoutube: '');
          FavoriteLocalProvider.db.addFavoriteMeals(favoriteFood).then((value) {
            if (value > 0) {
              setState(() => _isFavorite = true);
            }
          });
          //showToast(context, "Add to Favorite", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.favorite_border),
        ),
      );
    }
  }
}
