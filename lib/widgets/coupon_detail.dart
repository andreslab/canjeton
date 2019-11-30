import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CouponDetail extends StatefulWidget {
  @override
  _CouponDetailState createState() => _CouponDetailState();
}

class _CouponDetailState extends State<CouponDetail> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;

    return Container(
      height: size.height / 1.5,
      width: size.width / 1.8,
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'detail_coupon',
            child: Container(
            width: radius / 2,
            height: radius / 2,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg")
                )
            )
        ),
          )
        ],
      ),
    );
  }
}