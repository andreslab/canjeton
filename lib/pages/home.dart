import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_ad_slide.dart';

class HomePage extends StatefulWidget {

    final List listCoupons;

   const HomePage({
    Key key,
    this.listCoupons,
  }) : super(key: key);

  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /*List<CouponAdModel> data= [
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne",imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now() , urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg"),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: false, discount: "-23%",dateExpire: DateTime.now() , urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: false, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
  ];*/

  List<CouponAdModel> data = new List<CouponAdModel>();
  
  @override
  Widget build(BuildContext context) {
    print("data home" + widget.listCoupons.toString());
    if (widget.listCoupons != null) {
      final dataResponse  = widget.listCoupons;
      for (var i = 0; i < dataResponse.length; i++) {
        final title = dataResponse[i]["coupon_title"];
        final description =  dataResponse[i]["coupon_description"];
        final isFavorite = true;
        final discount = dataResponse[i]["coupon_value_discount"];
        data.add( CouponAdModel(
          title: title , 
          description: description,
          imgName: "", 
          isFavorite: isFavorite, 
          discount: "-"+ discount +"%",
          dateExpire: DateTime.now() , 
          urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg"));
      } 
    }


    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
              children: [Column(
          children: <Widget>[
            Container(
              width: size.width * 0.8,
              height: size.height * 0.5,
              child: 
              PageView.builder(
                itemCount: data.length,
                itemBuilder: (context, position){
                  return CouponAdSlide(couponAdSlideModel: data[position]);
                },

              )
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



