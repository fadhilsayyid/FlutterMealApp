import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  PRO,
}

class Config {
  static Flavor? appFlavor;

  static String get appString {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'TheMealDB - Development ';
        break;
      case Flavor.PRO:
        return 'Meal';
        break;
      default:
        return 'Meal';
        break;
    }
  }
}
