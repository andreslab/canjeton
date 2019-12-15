import 'package:flutter/material.dart';

class FilterCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
    itemCount: 10,
    gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 3,
                                   )
    ));
  }
}

class ItemGridFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon:Icon(Icons.restaurant),
                                     onPressed: ()=> print("categoria"),),
    );
  }
}