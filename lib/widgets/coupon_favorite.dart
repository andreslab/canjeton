import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CouponFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png")
                )
            )
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Las Menestras del Negro", style: TextStyle(fontSize: 20),),
            ],
          ),
          IconButton(icon: Icon(Icons.arrow_forward),
          onPressed: (){
            print("");
          },)
        ],
      ),
    );
  }
}