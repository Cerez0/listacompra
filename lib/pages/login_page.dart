import 'package:cesta_compra/ui/inputs_decorations.dart';
import 'package:cesta_compra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 250,),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text('Login', style:  Theme.of(context).textTheme.headline4,),
                    SizedBox(height: 30,),
                    _LoginForm(),
                  ],
                ),
              ),

              SizedBox(height: 50,),

              TextButton(
                child: Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: (){},

              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Ejemplo@correo.com',
                labelText: 'Correo Electronico',
                icono: Icons.alternate_email,
              ),
            ),

            SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                icono: Icons.lock,
              ),
            ),

            SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              color: Colors.deepOrange,
              disabledColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, 'home'),
            )
          ],
        ),
      ),
    );
  }
}
