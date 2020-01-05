import 'package:canjeton/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_ad_slide.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  final List listCoupons;

  const HomePage({
    Key key,
    this.listCoupons,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _HomePageState extends State<HomePage> {
  /*List<CouponAdModel> data= [
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne",imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now() , urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg"),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: false, discount: "-23%",dateExpire: DateTime.now() , urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: true, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
    CouponAdModel(title: "hamburguesa con queso", description: "lleva queso,tomate y carne", imgName: "", isFavorite: false, discount: "-23%",dateExpire: DateTime.now(), urlImg: "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg" ),
  ];*/
  int _current = 0;
  List<CouponAdModel> data = new List<CouponAdModel>();
  List<CouponAdModel> dataSlider = new List<CouponAdModel>();

  @override
  Widget build(BuildContext context) {
    print("data home" + widget.listCoupons.toString());
    if (widget.listCoupons != null) {
      final dataResponse = widget.listCoupons;
      for (var i = 0; i < dataResponse.length; i++) {
        final title = dataResponse[i]["coupon_title"];
        final description = dataResponse[i]["coupon_description"];
        final isFavorite = true;
        final discount = dataResponse[i]["coupon_value_discount"];
        data.add(CouponAdModel(
            title: title,
            description: description,
            imgName: "",
            isFavorite: isFavorite,
            discount: "-" + discount + "%",
            dateExpire: DateTime.now(),
            urlImg:
                "https://279340-865961-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/01/receta-hamburguesa-americana.jpeg"));

        
      }

      if(dataSlider.length < 3){
        dataSlider.add(data[0]);
        dataSlider.add(data[1]);
        dataSlider.add(data[2]);
      }
      
    }

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Text(
                "MÁS POPULARES",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, color: ColorsApp.colorP),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: size.width * 0.9,
                  height: size.height * 0.6,
                  child: PageView.builder(
                    itemCount: dataSlider.length,
                    itemBuilder: (context, position) {
                      return CouponAdSlide(couponAdSlideModel: dataSlider[position]);
                    },
                    onPageChanged: (index) {
                    setState(() {
                      _current = index;
                      print("${_current}");
                    });
                  },
                  )),
              /*CarouselSlider.builder(
                height: size.height * 0.55,
                itemCount: listDot.length,
                itemBuilder: (BuildContext context, int itemIndex) =>
                    CouponAdSlide(couponAdSlideModel: dataSlider[itemIndex]),
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                    print("${_current}");
                  });
                },
              ),*/
              SizedBox(
                height: 20,
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(
                  dataSlider,
                  (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4)),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                width: size.width,
                height: size.height * 0.2,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Categoria",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        )),
                        IconButton(
                          icon: Icon(Icons.category),
                          onPressed: () => {
                            showBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                      color: Colors.grey[900],
                                      height: 250,
                                    ))
                          },
                        )
                      ],
                    )),
                    Container(
                      width: size.width,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.restaurant),
                          Expanded(
                            child: Icon(Icons.help),
                            flex: 2,
                          ),
                          Icon(Icons.alarm),
                        ],
                      ),
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
