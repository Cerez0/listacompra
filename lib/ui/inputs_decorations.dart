import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration inputDecoration(
  {

    required BuildContext context,
    required String hintText,
    required String labelText,
    IconData? icono,

  }){

    return InputDecoration(

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context).primaryColor
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      prefixIcon: icono != null
          ? Icon(icono, color: Theme.of(context).primaryColor)
          : null,

    );
  }


}