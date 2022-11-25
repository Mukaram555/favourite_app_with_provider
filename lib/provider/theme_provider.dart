import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  var _themeData = ThemeMode.light;

  ThemeMode get themeData =>_themeData;

  void getThemeData(themeData){
    _themeData = themeData;
    notifyListeners();
  }
}