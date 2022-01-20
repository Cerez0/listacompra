import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/providers/providers.dart';

class CustomDialog {

  static Dialog customDialog({

    int? item,
    double? height,
    bool btnCancel = true,
    AppTheme? appTheme,
    required BuildContext context,
    required String titulo,
    required String nombreBtn,
    required String accionBtn,
    required Widget child,

}){

    final productsService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final appTheme = Provider.of<AppTheme>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        width: double.infinity,
        height: height == null ? 200 : height,
        child: Column(
          children: [
            _Titulo(titulo),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  child: child
                ),
                Row(
                  mainAxisAlignment: btnCancel == true ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                  children: [

                    btnCancel == true ? Botones.boton(
                      context: context,
                      nombre: 'Cancelar',
                      accion: 'cancel',
                      productsService: productsService,
                      uiProvider: uiProvider,
                      index: item,
                    ) : Container(),
                    Botones.boton(
                      context: context,
                      nombre: nombreBtn,
                      accion: accionBtn,
                      productsService: productsService,
                      uiProvider: uiProvider,
                      appTheme: appTheme,
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
    UiProvider? uiProvider,
    AppTheme? appTheme,
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
            uiProvider!.showDialog = false;
            Navigator.pop(context, false);

            break;

          case 'delete':

            Navigator.pop(context, true);
            uiProvider!.showDialog = false;
            await productsService.deleteProduct(productsService.products[index!]);


            break;

          case 'deleteAll':

              for (var i = 0; i < productsService.products.length; i++) {

              if(await productsService.products[i].select == true){
               await productsService.deleteProduct(productsService.products[i]);
               i--;
              }

            }
            uiProvider!.showDialog = false;
            Navigator.pop(context);

            break;

          case 'colorSelected':
            appTheme!.isCustomTheme = true;
            Navigator.pop(context);
            break;
        }
      }
    );
  }
}