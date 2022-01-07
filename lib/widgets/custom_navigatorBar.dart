import 'package:cesta_compra/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: uiProvider.selectedMenuOpt,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Listas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ajustes',
        ),
      ],
    );
  }
}
