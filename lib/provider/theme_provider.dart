import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  var _themeData = ThemeMode.light;

  ThemeMode get themedata =>_themeData;

  void getThemeData(themedata){
    _themeData = themedata;
    notifyListeners();
  }
}