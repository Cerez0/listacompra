
import 'package:cesta_compra/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListasCompraPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    if(productsService.isLoading) {
      return Center(child: CircularProgressIndicator());
    }else if(productsService.products.length == 0){
      return Center(child: Text(
        'Añade Productos a la lista',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange
        ),
        ),
      );

    }else {
      return RefreshIndicator(
        onRefresh: () =>  productsService.refreshList(),
        child: ListView.builder(
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              child: Column(
                children: [
                  _ItemProduct(index),
                ],
              ),
            ),
              ),
        ),
      );
    }
  }
}

class _ItemProduct extends StatelessWidget {

   int? index;

   _ItemProduct(this.index);

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);

    return Dismissible(

      key: Key(productsService.products[index!].id!),
      background: Container(
        padding: EdgeInsets.only(left: 20),
        color: Colors.green,
        child: Row(
          children: [
            Container(
              child: Icon(Icons.edit,color: Colors.white,size: 26,),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text('EDITAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 20),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Text('ELIMINAR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            Container(
              child: Icon(Icons.delete_forever,color: Colors.white,size: 26,),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async{

        if (direction == DismissDirection.startToEnd) {
          uiProvider.showDialog = true;
          uiProvider.productNuevo = false;
          productsService.selectedProduct = productsService.products[index!];
          showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => FormAddProduct());
        };

        if (direction == DismissDirection.endToStart) {
          showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => CustomDialog.customDialog(
            item: index,
            context: context,
            titulo: 'Eliminar Producto',
            contenido: '¿Quieres eliminar ${productsService.products[index!].name}?',
            nombreBtn: 'Eliminar',
            accionBtn: 'delete',
          ));
        };
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 50,
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    productsService.products[index!].name,
                    style: TextStyle(
                      fontSize: 18,
                      color: productsService.products[index!].select == true ? Colors.red : Colors.black,
                      decoration: productsService.products[index!].select == true ? TextDecoration.lineThrough : TextDecoration.none,
                      decorationColor: Colors.red,
                    ),
                  ),
                ),

                Container(
                  //color: Colors.red,
                  child: Row(
                    children: [

                      Checkbox(
                          value: productsService.products[index!].select,
                          onChanged:(value) {
                            productsService.updateSelected(value!, index!);
                            productsService.updateProduct(productsService.products[index!]);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Theme.of(context).primaryColor,)
        ],

      ),
    );
  }

}


