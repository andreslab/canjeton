import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people)
          ),
        ],
      ),
    )
  }
}