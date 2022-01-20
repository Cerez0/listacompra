import 'package:cesta_compra/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/pages/pages.dart';
import 'package:cesta_compra/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(AppState());
  print('CustomTheme ${Preferences.isCustomTheme}: ${Preferences.theme}');
  print(Preferences.customColor);
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService(), lazy: false,),
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => AppTheme( Preferences.theme )),
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





