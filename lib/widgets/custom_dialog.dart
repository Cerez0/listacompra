import 'package:cesta_compra/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialog {

  static Dialog customDialog({

    int? item,
    required BuildContext context,
    required String titulo,
    required String contenido,
    required String nombreBtn,
    required String accionBtn,

}){

    final productsService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        child: Column(
          children: [
            _Titulo(titulo),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 130,
                  child: Text(
                    contenido,
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
                      uiProvider: uiProvider,
                      index: item,
                    ),
                    Botones.boton(
                      context: context,
                      nombre: nombreBtn,
                      accion: accionBtn,
                      productsService: productsService,
                      uiProvider: uiProvider,
                      index: item,
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

  String? titulo;

  _Titulo(this.titulo);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        alignment: Alignment.center,
        height: 50,
        child: Text(titulo!,
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
    required UiProvider uiProvider,
    int? index,
    IconData? icono,
  }){
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        nombre,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      onPressed: () async {
        switch (accion) {
          case 'cancel':
            uiProvider.showDialog = false;
            Navigator.pop(context, false);

            break;

          case 'delete':

            Navigator.pop(context, true);
            uiProvider.showDialog = false;
            await productsService.deleteProduct(productsService.products[index!]);


            break;

          case 'deleteAll':

              for (var i = 0; i < productsService.products.length; i++) {

              if(await productsService.products[i].select == true){
               await productsService.deleteProduct(productsService.products[i]);
               i--;
              }

            }
            uiProvider.showDialog = false;
            Navigator.pop(context);

            break;
        }
      }
    );
  }
}