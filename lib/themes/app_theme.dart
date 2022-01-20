

import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {

  static const Color primaryDefault = Color(0xffff5400);


  bool _isDefaultTheme = true;
  bool _isDarkTheme = false;
  bool _isCustomTheme = false;
  Color _customColor = Color(0xffff5400);

  ThemeData _currentTheme = ThemeData.light();
  bool get isDarkTheme => this._isDarkTheme;
  bool get isCustomTheme => this._isCustomTheme;
  Color get customColor => this._customColor;
  ThemeData get currentTheme => this._currentTheme;


  set isDarkTheme(bool value){
    //_isCustomTheme = false;
    _isDarkTheme = value;

    if ( value ) {

      _currentTheme = darkTheme();

    }else{

      if (_isDefaultTheme){

        _currentTheme = defaultTheme();

      }else{

        _currentTheme = customTheme();
      }

    }

    notifyListeners();
  }

  set isCustomTheme(bool value){
    _isCustomTheme = value;
    _isDarkTheme = false;

    if ( value ) {

      _currentTheme = customTheme();
      _isDefaultTheme = false;

    }else{

      _currentTheme = defaultTheme();
      _isDefaultTheme = true;

    }

    notifyListeners();

  }

  set customColor ( Color value ) {

    //print(value);
    if ( _isCustomTheme  ) {

      _customColor = value;
      notifyListeners();


    } else {

      _customColor = primaryDefault;

    }
    notifyListeners();

  }

  //TODO: Switch Selected Theme

  AppTheme( int theme ) {

    switch( theme ){

      case 1:
        _isDarkTheme = false;
        _isCustomTheme = false;
        _currentTheme = defaultTheme();
        break;

      case 2:
        _isDarkTheme = true;
        _isCustomTheme = false;
        _currentTheme = darkTheme();
        break;

      case 3:
        _isDarkTheme = false;
        _isCustomTheme = true;
        _currentTheme = customTheme();
        break;

    }

  }

  //TODO: Config Themes!

  ThemeData defaultTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(color: primaryDefault),
      dividerColor: primaryDefault,
      primaryColor: primaryDefault,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: 'Luxurious',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryDefault),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: primaryDefault),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryDefault),
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(color: _isDefaultTheme ? primaryDefault : _customColor),
      dividerColor: _isDefaultTheme ? primaryDefault : _customColor,
      primaryColor: _isDefaultTheme ? primaryDefault : _customColor,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white,
              fontFamily: 'Luxurious',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _isDefaultTheme ? primaryDefault : _customColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: _isDefaultTheme ? primaryDefault : _customColor),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: _isDefaultTheme ? primaryDefault : _customColor),
    );
  }

  ThemeData customTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(color: _customColor),
      dividerColor: _customColor,
      primaryColor: _customColor,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: 'Luxurious',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _customColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: _customColor),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: _isDefaultTheme ? primaryDefault : _customColor),
    );
  }
}





