import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cesta_compra/providers/providers.dart';
import 'package:cesta_compra/widgets/custom_dialog.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class SettingsPage extends StatelessWidget {

  final time = DateTime.now();



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [

          Container(
            height: size.height * 0.83,
            child: Column(
              children: [


                ColorApp(Theme.of(context).primaryColor),

                Divider(height: 50,),

                /*_NotificacionesApp(),

                Divider(
                  height: 50,
                  color: Theme.of(context).primaryColor,
                ),*/

              ],

            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: 30,
              child: _copyRight(context, time),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorApp extends StatelessWidget {

  Color color;

  ColorApp(this.color);


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<AppTheme>(context);

    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 40,
            child: Text(
              'Colores de la Aplicacion',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 28,
                color: Theme.of(context).primaryColor
              ),
            ),
          ), //Titulo Colores App

          customColor(context, appTheme),
          darkColor(context, appTheme),

        ],
      ),
    );
  }

  Widget customColor( BuildContext context, AppTheme appTheme){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Color Personalizado',
              style: Theme.of(context).textTheme.bodyText1),
              Switch(
                activeColor: Theme.of(context).primaryColor,
                value: appTheme.isCustomTheme,
                onChanged: (value) => appTheme.isCustomTheme = value,
              ),
            ],
          ),

          appTheme.isCustomTheme == true ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                  'Color',
                  style: Theme.of(context).textTheme.bodyText1
              ),

              IconButton(
                icon: Icon(
                  Icons.color_lens_rounded,
                  size: 30,
                  color: Theme.of(context).primaryColor,

                ),
                onPressed: (){

                  pickColor(context, appTheme);

                },
              ),

            ],
          ) : Container(),
        ],
      ),
    );
  }

  Widget darkColor(BuildContext context, AppTheme appTheme){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
              'Modo oscuro',
              style: Theme.of(context).textTheme.bodyText1
          ),

          Switch(
            activeColor: Theme.of(context).primaryColor,
            value: appTheme.isDarkTheme,
            onChanged: (value) => appTheme.isDarkTheme = value,
          ),

        ],
      ),
    );
  }


  void pickColor(BuildContext context , AppTheme appTheme) {

    showDialog(
      barrierDismissible: false,
      context: context, builder: (BuildContext context)  => WillPopScope(
        onWillPop: () async => false,
        child: CustomDialog.customDialog(
          context: context,
          height: 510,
          titulo: 'Selecionar Color',
          nombreBtn: 'Aceptar',
          accionBtn: 'colorSelected',
          btnCancel: false,
          child: SingleChildScrollView(
            child: ColorPicker(
                labelTypes: [],
                enableAlpha: false,
                pickerColor: appTheme.customColor,
                onColorChanged: (color) => appTheme.customColor = color
            ),
          ),
        ),
      ),
    );

  }
}

class _NotificacionesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notificaciones',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: true,
                  onChanged: (value){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _copyRight(BuildContext context, DateTime time){

  return Text(
    'JMCerezo © ${time.year}',
    style: Theme.of(context).textTheme.bodyText1?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,

    ),
  );
}


