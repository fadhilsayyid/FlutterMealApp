import 'package:flutter/material.dart';
import 'screen/home.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal',
        theme: ThemeData(
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
