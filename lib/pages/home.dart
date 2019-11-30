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
      body: Stack(
              children: [Column(
          children: <Widget>[
            Container(
              width: size.width * 0.8,
              height: size.height * 0.5,
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
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(top: 40, left: 40, right: 40),
              width: size.width,
              height: size.height * 0.2,
              child: Column(
                children: <Widget>[
                  Expanded(child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Categoria", textAlign: TextAlign.left, style: TextStyle(fontSize: 40),)),
                      RaisedButton(child: Icon(Icons.category),onPressed: () => print("show categories"),)
                    ],
                  )),
                  Container(
                    width: size.width,
                    child: Row(children: <Widget>[
                      Icon(Icons.restaurant),
                      Expanded(child: Icon(Icons.help), flex: 2,),
                      Icon(Icons.alarm),
                    ],),
                  )
                ],
              ),
            )
          ],
        ),
        ],
      ),
    );
  }


  
}



