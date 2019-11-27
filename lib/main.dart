import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';
import 'pages/navigator.dart';
import 'pages/favorite.dart';
import 'pages/ticket.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LoginPage(),
      routes: {
        "login": (context) => LoginPage(),
        "register": (context) => RegisterPage(),
        "home": (context) => HomePage(),
        "navigator": (context) => NavigatorPage(),
        "register": (context) => RegisterPage(),
        "favorite": (context) => FavoritePage(),
        "ticket": (context) => TicketPage()
      },
    );
  }  
}
