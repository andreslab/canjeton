import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Colors.orange,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Row(
              children: <Widget>[
                Container(),
                Expanded(
                  child: Text("Canjetón", textAlign: TextAlign.center,),
                ),
                Container(
                    child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ))
              ],
            ),
            Center(
                        child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () => print("map"),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => print("map"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
