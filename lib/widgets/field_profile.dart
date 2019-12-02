import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FieldProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("campo"),
          ),
          Text("dato del campo"),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => print("editar campo"),
          )
        ],
      ),
    );
  }
}