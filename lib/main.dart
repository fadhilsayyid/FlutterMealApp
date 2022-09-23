import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Meal DB',
        theme: ThemeData(
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
