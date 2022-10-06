import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{

  List<int> _favouriteItem = [];

  List get favouriteCount => _favouriteItem;

  void getValue(int value){
    _favouriteItem.add(value);
    print("function Called");
    notifyListeners();
  }

  void unlikeValue(int value){
    _favouriteItem.remove(value);
    print("function Called");
    notifyListeners();
  }

}