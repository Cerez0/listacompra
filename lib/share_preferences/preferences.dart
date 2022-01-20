
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {


  static late SharedPreferences _prefs;

  static int _theme = 1;
  static bool _isDefaultTheme = true;
  static bool _isDarkTheme = false;
  static bool _isCustomTheme = false;
  static int _customColor = 4294923520;


  static Future init() async{

    _prefs = await SharedPreferences.getInstance();

  }

  // Getters

  static int get theme {
    return _prefs.getInt('theme') ?? _theme;
  }

  static bool get isDefaultTheme {
    return _prefs.getBool('defaultTheme') ?? _isDefaultTheme;
  }

  static bool get isDarkTheme {
    return _prefs.getBool('darkTheme') ?? _isDarkTheme;
  }

  static bool get isCustomTheme {
    return _prefs.getBool('customTheme') ?? _isCustomTheme;
  }

  static int get customColor {
    return _prefs.getInt('customColor') ?? _customColor;
  }

  // Setters

  static set theme(int value){
    _theme = value;
    _prefs.setInt('theme', _theme);
  }

  static set isDefaultTheme(bool value){
    _isDefaultTheme = value;
    _prefs.setBool('defaultTheme', _isDefaultTheme);
  }

  static set isDarkTheme(bool value){
    _isDarkTheme = value;
    _prefs.setBool('darkMode', _isDarkTheme);
  }

  static set isCustomTheme(bool value){
    _isCustomTheme = value;
    _prefs.setBool('customTheme', _isCustomTheme);
  }

  static set customColor (int value){
    _customColor = value;
    _prefs.setInt('customColor', _customColor);
  }

}