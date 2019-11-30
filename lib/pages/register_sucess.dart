import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterSucessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
            Container(),
            Text("Bienvenido, " + "Juan" + "\n empieza a ahorrar."),
            RaisedButton(
              child: Icon(Icons.arrow_forward),
              onPressed: () => Navigator.pushNamed(context, "home"),
            ),
            Text("Canjetón, derechos reservados.")
        ],
      ),
    );
  }
}