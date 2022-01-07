import 'package:cesta_compra/pages/home_page.dart';
import 'package:cesta_compra/pages/pages.dart';
import 'package:cesta_compra/providers/product_form_provider.dart';
import 'package:cesta_compra/providers/product_service.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService(), lazy: false,),
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cesta de la Compra',
      initialRoute: 'home',
      routes: {
        'login' : (_) => LoginPage(),
        'home'  : (_) => HomePage(),
      },
      theme: myTheme
    );
  }
}

MaterialColor PrimaryMaterialColor = MaterialColor(
  4294923264,
  <int, Color>{
    50: Color.fromRGBO(
      255,
      84,
      0,
      .1,
    ),
    100: Color.fromRGBO(
      255,
      84,
      0,
      .2,
    ),
    200: Color.fromRGBO(
      255,
      84,
      0,
      .3,
    ),
    300: Color.fromRGBO(
      255,
      84,
      0,
      .4,
    ),
    400: Color.fromRGBO(
      255,
      84,
      0,
      .5,
    ),
    500: Color.fromRGBO(
      255,
      84,
      0,
      .6,
    ),
    600: Color.fromRGBO(
      255,
      84,
      0,
      .7,
    ),
    700: Color.fromRGBO(
      255,
      84,
      0,
      .8,
    ),
    800: Color.fromRGBO(
      255,
      84,
      0,
      .9,
    ),
    900: Color.fromRGBO(
      255,
      84,
      0,
      1,
    ),
  },
);

ThemeData myTheme = ThemeData(
  fontFamily: "customFont",
  primaryColor: Color(0xffff5400),
  buttonColor: Color(0xffff5400),
  accentColor: Color(0xffff5400),

  primarySwatch: PrimaryMaterialColor,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color(0xffff5400),
      ),
    ),
  ),
);

