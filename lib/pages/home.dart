import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_slide.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.8,
            height: size.height * 0.6,
            child: PageView(
              children: <Widget>[
                Container(
                  child: CouponSlide(title: "Hamburguesas del Colorado",imgName: "lib/res/img/img_hamb.jpg",isFavorite:false,discount:30.0,dateExpire:DateTime.now()),
                ),
                Container(
                  child: CouponSlide(title: "Hamburguesas del Colorado",imgName: "lib/res/img/img_hamb.jpg",isFavorite:false,discount:30.0,dateExpire:DateTime.now()),
                ),
                Container(
                  child: CouponSlide(title: "Hamburguesas del Colorado",imgName: "lib/res/img/img_hamb.jpg",isFavorite:false,discount:30.0,dateExpire:DateTime.now()),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: Column(
              children: <Widget>[
                Text("Categoria", textAlign: TextAlign.left,),
                Container(
                  width: size.width,
                  child: Row(children: <Widget>[
                    Icon(Icons.restaurant),
                    Icon(Icons.help),
                    Icon(Icons.alarm),
                  ],),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}