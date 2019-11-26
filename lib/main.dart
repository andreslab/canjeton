import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';
import 'pages/navigator.dart';

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
      home: NavigatorPage(),
      routes: {
        "login": (context) => LoginPage(),
        "register": (context) => RegisterPage(),
        "home": (context) => HomePage(),
        "navigator": (context) => NavigatorPage()
      },
    );
  }  
}
