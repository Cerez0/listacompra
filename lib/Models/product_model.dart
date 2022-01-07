
import 'dart:convert';

class Product {
  Product({
    required this.name,
    required this.select,
  });

  String name;
  bool select;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    name: json["name"],
    select: json["select"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "select": select,
  };
}


