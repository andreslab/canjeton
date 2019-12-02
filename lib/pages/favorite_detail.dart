import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_item_min.dart';

class FavoriteDetailPage extends StatefulWidget {
  @override
  _FavoriteDetailPageState createState() => _FavoriteDetailPageState();
}

class _FavoriteDetailPageState extends State<FavoriteDetailPage> {
  List<CouponItemMinModel> data = [
    CouponItemMinModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImg:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%"),
    CouponItemMinModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImg:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(),
          Container(),
          Text("Este local tiene 3 cupones disponibles"),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, position) {
              return CouponItemMin(
                couponItemMinModel: data[position],
              );
            },
          )),
        ],
      ),
    );
  }
}
