import 'package:cesta_compra/Models/product_model.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;
  ProductFormProvider(this.product);


  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }

}