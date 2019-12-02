import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CouponItemMinModel {
  String urlImg;
  String title;
  String discount;
  String description;
}

class CouponItemMin extends StatelessWidget {

  final CouponItemMinModel  couponItemMinModel ;

  const CouponItemMin(
      {Key key,
      @required this.couponItemMinModel ,})
      : super(key: key);

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
                        "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg")
                )
            )
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Las Menestras del Negro", style: TextStyle(fontSize: 20),),
              Text("-30%", style: TextStyle(fontSize: 20, color: Colors.orange),),
              Text("Combo completo", style: TextStyle(fontSize: 15, color: Colors.orange))
            ],
          ),
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            print("");
          },)
        ],
      ),
    );
  }
}