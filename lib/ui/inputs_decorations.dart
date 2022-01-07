import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration(
  {

    required String hintText,
    required String labelText,
    IconData? icono,

  }){

    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.deepOrange
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepOrange,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.deepOrange,
      ),
      prefixIcon: icono != null
          ? Icon(icono, color: Colors.deepOrange,)
          : null,

    );
  }


}