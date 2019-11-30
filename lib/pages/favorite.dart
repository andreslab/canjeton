import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_favorite.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Favoritos"),
            Expanded(
                          child: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      
      height: 120,
      child: CouponFavorite(),
    ),
    Container(
      height: 120,
      child: CouponFavorite(),
    ),
    Container(
      height: 120,
      child: CouponFavorite(),
    ),
    Container(
      height: 120,
      child: CouponFavorite(),
    ),
    Container(
      height: 120,
      child: CouponFavorite(),
    ),
    Container(
      height: 120,
      child: CouponFavorite(),
    ),
  ],
),
            ),
          ],
        ),
    ),
    );
  }
}