
import 'package:flutter/material.dart';


class UiProvider extends ChangeNotifier{

  int _selectedMenuOpt = 0;
  bool _select = false;
  bool productNuevo = true;


  //TODO selct NavigatorBar

  int get selectedMenuOpt {

    return this._selectedMenuOpt;
  }

  set selectedMenuOpt (int i) {

    this._selectedMenuOpt = i;
    notifyListeners();
  }

  //TODO: select checkBox

  bool get select {

    return this._select;
  }

  set select (bool i) {

    this._select = i;
    notifyListeners();
  }

}