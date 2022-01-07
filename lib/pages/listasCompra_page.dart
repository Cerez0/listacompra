
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
      return Center(child: Text('Añade Productos'));

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
                  Divider(color: Theme.of(context).primaryColor,)
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

    return Container(
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
                //fontWeight: FontWeight.bold,
                decoration: productsService.products[index!].select == true ? (TextDecoration.lineThrough): TextDecoration.none,
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

                IconButton(
                  icon: Icon(Icons.edit,color: Colors.green),
                  onPressed: (){
                    uiProvider.productNuevo = false;
                    productsService.selectedProduct = productsService.products[index!];
                    showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => FormAddProduct());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed: (){
                    productsService.deleteProduct(productsService.products[index!]);
                  },
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

}


