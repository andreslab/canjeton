import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      width: size.width,
      height: size.height,
      child: Column(children: <Widget>[
        Text("TAB BAR"),
          ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Cupon1"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Cupon1"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Cupon1"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Cupon1"),
              )
            ],
          )
        ],),
    ),
    );
  }
}