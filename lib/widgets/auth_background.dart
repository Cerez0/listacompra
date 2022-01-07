import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack (
        children: [

          TopBox(),
          this.child

        ],
      ),
    );
  }
}

class TopBox extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      color: Colors.deepOrange,
      child: Center(
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );


  }


}



