import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_item_min.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
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
    CouponItemMinModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImg:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%")
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("btn 1"),
                  onPressed: () => print(""),
                ),
                Expanded(
                    flex: 2,
                    child: RaisedButton(
                      child: Text("btn 2"),
                      onPressed: () => print(""),
                    )),
                RaisedButton(
                  child: Text("btn 3"),
                  onPressed: () => print(""),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return CouponItemMin(couponItemMinModel: data[position]);
              },
            )),
          ],
        ),
      ),
    );
  }
}
