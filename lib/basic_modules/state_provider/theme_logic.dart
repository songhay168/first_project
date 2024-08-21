import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier{
  bool _dark = false;
  bool get dark => _dark;

  void changeToDark(){
    _dark = true;
    notifyListeners();
  }

  void changeToLight(){
    _dark = false;
    notifyListeners();
  }

  void toggleDark(){
    _dark = !_dark;
    notifyListeners();
  }
}