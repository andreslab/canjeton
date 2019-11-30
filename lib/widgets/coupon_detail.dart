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
      width: size.width / 1.6,
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'detail_coupon',
            child: Container(
                width: radius,
                height: radius,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg")))),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            Expanded(
              child: Text("Hamburguesa del colorado"),
            ),
            Icon(Icons.favorite)
          ],),
            SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            Expanded(
              child: Text("-30%", style:  TextStyle(fontSize: 30, color: Colors.orange),),
            ),
            Icon(Icons.file_download)
          ],),
            SizedBox(
            height: 20,
          ),
          Text("En la compra del combo completo.\n 1 Homburguesa con queso 1 Papas fritas, 1 Cocacola mediana."),
          Row(children: <Widget>[
            Icon(Icons.calendar_today),
            Expanded(
              child: Column(children: <Widget>[
                Text("Expira", textAlign: TextAlign.left,),
                Text("30 Dic 2019", textAlign: TextAlign.left,)
              ],),
            ),
            Icon(Icons.share)
          ],)
        ],
      ),
    );
  }
}
