

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cesta_compra/Models/product_model.dart';
import 'package:cesta_compra/private_data/private_data.dart';


class ProductsService extends ChangeNotifier{

  final String _baseUrl = PrivateData().urlDataBase(); //TODO: Url privada de mi base de datos(FireBase)
  final List<Product> products = [];
  Product? selectedProduct;
  bool isLoading = true;
  bool isSaving = false;

  ProductsService(){
    this.loadProducts();
  }


  updateSelected(bool value, int index){
    //print(value);
    //print(index);
    this.products[index].select = value;
    notifyListeners();

    //print('Producto Actualizado ${products[index].name}');
  }

  Future <void> refreshList () async{
    this.products.clear();
    await loadProducts();
  }

  Future<List<Product>>loadProducts() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    if(resp.body.toString() != 'null') {
      final Map<String, dynamic> productsMap = json.decode(resp.body);

      productsMap.forEach((key, value) {
        final tempProduct = Product.fromMap(value);
        tempProduct.id = key;
        this.products.add(tempProduct);
      });
    }

    this.isLoading = false;
    notifyListeners();

    return this.products;

  }

  Future saveOrCreateProduct (Product product) async {

    isSaving = true;
    notifyListeners();

    if(product.id == null) {
      //Crear
      await createProduct(product);

    }else{
      //Actualizar
      await updateProduct(product);
    }


    isSaving = false;
    notifyListeners();

  }

  Future createProduct(Product product) async {

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    product.id = decodedData['name'];
    this.products.add(product);
    
    //print(decodedData);

    return product.id!;

  }

  Future updateProduct(Product product) async {

    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    final index = this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;
    //print('Producto Actualizado ${product.name}');

    return product.id!;

  }

  Future<String> deleteProduct (Product product) async {


    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.delete(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    final index = this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;
    this.products.remove(product);
    notifyListeners();


    return product.id!;

  }


}