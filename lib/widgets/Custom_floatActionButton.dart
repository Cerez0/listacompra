import 'package:cesta_compra/Models/product_model.dart';
import 'package:cesta_compra/providers/product_service.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFloatActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        uiProvider.showDialog = true;
        productsService.selectedProduct = new Product(
          name: '',
          select: false,
        );
        uiProvider.productNuevo = true;
        showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => FormAddProduct());

      },
    );
  }
}





