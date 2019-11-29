import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_item_min.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
    );
  }
}