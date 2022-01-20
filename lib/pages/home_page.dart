import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/pages/pages.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/widgets/widgets.dart';
import 'package:cesta_compra/widgets/custom_dialog.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;



    return Scaffold(
      appBar: AppBar(
        title: currentIndex == 0 ? Text('Lista de la Compra') : Text('AJUSTES'),
        centerTitle: true,
        actions: [
          Container(
            width: 75,
            child: currentIndex == 0
              ? IconButton(
              icon: Icon(Icons.library_add_check_sharp,size: 25),
              onPressed: (){
                _seleccionarTodos(productService);
              },
              )
              : null,

          ),
        ],
        leading: Container(
          width: 75,
          child:  currentIndex == 0
            ? IconButton(
            icon: Icon(Icons.delete_sweep, size: 25),
            onPressed: (){
              _eliminarTodos(productService, context);
            },
          )
          : null,
        ),

      ),
      body: _HomePageBody(),
      floatingActionButton: (uiProvider.selectedMenuOpt == 0 && uiProvider.showDialog == false) ? CustomFloatActionButton() : null ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigatorBar(),
    );
  }

  _seleccionarTodos (ProductsService productService){

    int seleccionados = productService.products.indexWhere((element) => element.select == true);

    if(seleccionados == -1) { // marca todos
      for (var i = 0; i < productService.products.length; i++) {
        if (productService.products[i].select == false) {
          productService.updateSelected(true, i);
          productService.updateProduct(productService.products[i]);
        }
      }
    }else{ // Desmarca todos

      for (var i = 0; i < productService.products.length; i++) {
        if (productService.products[i].select == true) {
          productService.updateSelected(false, i);
          productService.updateProduct(productService.products[i]);
        }
      }

    }
  }

  _eliminarTodos (ProductsService productService, BuildContext context){

  showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => CustomDialog.customDialog(
      context: context,
      titulo: 'Eliminar',
      child: Container(
        alignment: Alignment.center,
        height: 75,

        child: Text(
          '¿Quieres eliminar todos los tachados de la lista?',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
      nombreBtn: 'Eliminar',
      accionBtn: 'deleteAll'),
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

