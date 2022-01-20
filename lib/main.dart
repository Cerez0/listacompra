import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/pages/pages.dart';
import 'package:cesta_compra/providers/providers.dart';

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
        ChangeNotifierProvider(create: (_) => AppTheme( 1 )),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<AppTheme>(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cesta de la Compra',
      initialRoute: 'home',
      routes: Routes.routes,
      theme: appTheme.currentTheme,
    );
  }
}

class Routes {

  static final routes = {

    'home'  : (_) => HomePage(),

  };


}





