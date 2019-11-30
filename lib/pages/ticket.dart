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
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Row(children: <Widget>[
              RaisedButton(child: Text("btn 1"), onPressed: ()=> print(""),),
              Expanded(flex: 2, child: RaisedButton(child: Text("btn 2"), onPressed: ()=> print(""),)),
              RaisedButton(child: Text("btn 3"), onPressed: ()=> print(""),)
            ],),
            SizedBox(height: 10,),
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
    ),
    );
  }
}