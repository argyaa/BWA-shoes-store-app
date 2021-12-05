import 'package:flutter/cupertino.dart';

class CategoriesState with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int newVal) {
    _index = newVal;
    notifyListeners();
  }
}
