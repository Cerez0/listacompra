

import 'package:cesta_compra/share_preferences/preferences.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {

  static const Color primaryDefault = Color(4294923520);
  ThemeData _currentTheme = ThemeData.light();

  //TODO: Switch Selected Theme

  AppTheme( int theme ) {

    switch( theme ){

      case 1:
        Preferences.isDarkTheme = false;
        Preferences.isCustomTheme = false;
        _currentTheme = defaultTheme();
        break;

      case 2:
        Preferences.isDarkTheme = true;
        Preferences.isCustomTheme = false;
        _currentTheme = darkTheme();
        break;

      case 3:
        Preferences.isDarkTheme = false;
        Preferences.isCustomTheme = true;
        _currentTheme = customTheme();
        break;

    }

  }

  // Getters
  bool get isDarkTheme => Preferences.isDarkTheme;
  bool get isCustomTheme => Preferences.isCustomTheme;
  int get customColor => Preferences.customColor;
  ThemeData get currentTheme => this._currentTheme;

 // Setters
  set isDarkTheme( bool value ){
    Preferences.isDarkTheme = value;

    if ( value ) {

      _currentTheme = darkTheme();
      Preferences.theme = 2;
      print('DarkTheme ${Preferences.isDarkTheme}: ${Preferences.theme}');

    }else{

      if (Preferences.isDefaultTheme){

        _currentTheme = defaultTheme();
        Preferences.theme = 1;
        print('DarkTheme ${Preferences.isDarkTheme}: ${Preferences.theme}');

      }else{

        _currentTheme = customTheme();
        Preferences.theme = 3;
        print('DarkTheme ON, CustomTheme ON: ${Preferences.theme}');
      }

    }

    notifyListeners();
  }

  set isCustomTheme( bool value ){
    Preferences.isCustomTheme = value;
    Preferences.isDarkTheme = false;

    if ( value ) {

      _currentTheme = customTheme();
      Preferences.isDefaultTheme = false;
      Preferences.theme = 3;
      print('CustomTheme ${Preferences.isCustomTheme}: ${Preferences.theme}');

    }else{

      _currentTheme = defaultTheme();
      Preferences.isDefaultTheme = true;
      Preferences.theme = 1;
      print('CustomTheme ${Preferences.isCustomTheme}: ${Preferences.theme}');

    }

    notifyListeners();

  }

  set customColor ( int value ) {
    //print(value);
    if ( Preferences.isCustomTheme  ) {

      Preferences.customColor = value;
      notifyListeners();


    } else {

      Preferences.customColor = primaryDefault.value;

    }
    notifyListeners();

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
      appBarTheme: AppBarTheme(color: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor)),
      dividerColor: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor),
      primaryColor: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor),
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white,
              fontFamily: 'Luxurious',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor)),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor)),
    );
  }

  ThemeData customTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(color: Color(Preferences.customColor)),
      dividerColor: Color(Preferences.customColor),
      primaryColor: Color(Preferences.customColor),
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: 'Luxurious',
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(Preferences.customColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Color(Preferences.customColor)),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Preferences.isDefaultTheme ? primaryDefault : Color(Preferences.customColor)),
    );
  }

}





