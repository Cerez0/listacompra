
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/ui/inputs_decorations.dart';

class FormAddProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct!),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Container(
          width: double.infinity,
          height: 250,
          child: Column(
            children: [
              _Titulo(),
              SizedBox(height: 30,),
              _CustomForm(),
            ],
          ),

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
        child: Text(uiProvider.productNuevo == true ? 'Añadir Producto' : 'Editar Producto',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            fontFamily: 'assets/fonts/Luxurious.ttf'

          ),
        ),
      ),
    );
  }
}

class _CustomForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productFormProvider.product;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: productFormProvider.formKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecorations.inputDecoration(
                    context: context,
                    hintText: 'Leche',
                    labelText: 'Producto',
                    icono: Icons.shopping_basket_outlined,
                  ),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.normal
                  ),
                  validator: (value){
                    if(value!.length >= 1){
                      return null;
                    }else{
                      return 'El Producto es Obligatorio';
                    }
                  },
                ),

              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Botones.boton(
              context: context,
              nombre: 'Cancelar',
              accion: 'none',
              productFormProvider: productFormProvider,
              productsService: productService,
              uiProvider: uiProvider,
            ),
            Botones.boton(
              context: context,
              nombre: uiProvider.productNuevo == true ? 'Añadir' : 'Actualizar',
              accion: 'add',
              productFormProvider: productFormProvider,
              productsService: productService,
              uiProvider: uiProvider,
            ),

          ],
        ),
      ],
    );
  }

}

class Botones {

  static MaterialButton boton({
    required BuildContext context,
    required String nombre,
    required String accion,
    required ProductFormProvider productFormProvider,
    required ProductsService productsService,
    required UiProvider uiProvider,
    IconData? icono,
  }){
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        nombre,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      onPressed: (){
        if(accion == 'none') {
          Navigator.pop(context, false);
          uiProvider.showDialog = false;
        }
        if(!productFormProvider.isValidForm()) return;


        if(accion == 'add' && productFormProvider.isValidForm()) {
          productsService.saveOrCreateProduct(productFormProvider.product);
          Navigator.pop(context, false);
          uiProvider.showDialog = false;
        }else{
          return;
        }


      },
    );
  }
}


