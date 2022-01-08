import 'package:cesta_compra/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogDeleteItem extends StatelessWidget {
  int? index;

  DialogDeleteItem(this.index);

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    print(index);

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        child: Column(
          children: [
            _Titulo(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 130,
                  child: Text('¿Seguro que quieres eliminar este producto?',
                    style: TextStyle(
                      fontSize: 18,

                    ),
                  ),
                ),
                Divider(color: Theme.of(context).primaryColor,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Botones.boton(
                      context: context,
                      nombre: 'Cancelar',
                      accion: 'cancel',
                      productsService: productsService,
                      index: index!,
                    ),
                    Botones.boton(
                      context: context,
                      nombre: 'Eliminar',
                      accion: 'delete',
                      productsService: productsService,
                      index: index!,
                    ),

                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return Container(
      child: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        alignment: Alignment.center,
        height: 50,
        child: Text('Eliminar Producto',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20

          ),
        ),
      ),
    );
  }
}

class Botones {

  static MaterialButton boton({
    required BuildContext context,
    required String nombre,
    required String accion,
    required ProductsService productsService,
    required int index,
    IconData? icono,
  }) {
    return MaterialButton(
      color: Theme
          .of(context)
          .primaryColor,
      child: Text(
        nombre,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      onPressed: () {
        if (accion == 'cancel') Navigator.pop(context, false);

        if (accion == 'delete') {
          productsService.deleteProduct(productsService.products[index]);
          Navigator.pop(context, true);
        } else {
          return;
        }
      },
    );
  }
}