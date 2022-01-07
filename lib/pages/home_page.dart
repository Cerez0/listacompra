import 'package:cesta_compra/pages/settings_page.dart';
import 'package:cesta_compra/pages/listasCompra_page.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/widgets/Custom_floatActionButton.dart';
import 'package:cesta_compra/widgets/custom_navigatorBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de la Compra'),
        centerTitle: true,
      ),
      body: _HomePageBody(),
      floatingActionButton: uiProvider.selectedMenuOpt == 0 ? CustomFloatActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigatorBar()


    );
  }
}

class _HomePageBody extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex){

      case 0:
        return ListasCompraPage();

      case 1:
        return SettingsPage();

      default:
        return ListasCompraPage();
    }
  }
}

