import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_item_min.dart';

class FavoriteDetailPage extends StatefulWidget {
  @override
  _FavoriteDetailPageState createState() => _FavoriteDetailPageState();
}

class _FavoriteDetailPageState extends State<FavoriteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(),
          Container(),
          Text("Este local tiene 3 cupones disponibles"),
          Expanded(
                          child: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      
      height: 120,
      child: CouponItemMin(),
    ),
    Container(
      height: 120,
      child: CouponItemMin(),
    ),
    Container(
      height: 120,
      child: CouponItemMin(),
    ),
    Container(
      height: 120,
      child: CouponItemMin(),
    ),
    Container(
      height: 120,
      child: CouponItemMin(),
    ),
    Container(
      height: 120,
      child: CouponItemMin(),
    ),
  ],
),
            ),
        ],
      ),
    );
  }
}