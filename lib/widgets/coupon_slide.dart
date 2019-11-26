import 'package:flutter/material.dart';

class CouponSlide extends StatelessWidget {

  final String title;
  final String imgName;
  final bool isFavorite;
  final double discount;
  final DateTime dateExpire;

  const CouponSlide({Key key,@required this.title, @required this.imgName, @required this.isFavorite, @required this.discount, @required this.dateExpire})
  : super(key:key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    final List<Color> colorBorder = [Colors.orange, Colors.purple];

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(this.title),
              IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print("add favorite");
              },
            ),
            ],
          ),
          Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(colors: colorBorder),
              shape: BoxShape.circle,
            ),
            child: Image(image: AssetImage(this.imgName)),
          ),
          
          Text(this.discount.toString(),
          textAlign: TextAlign.left,),
          Text("En la compra del combo Completo",
          textAlign: TextAlign.left,),
          Row(
            children: [
              Icon(Icons.calendar_today),
              Column(children: <Widget>[
                Text("Expira", textAlign: TextAlign.left,),
                Text(this.dateExpire.day.toString() +" "+  this.dateExpire.month.toString() +" "+ this.dateExpire.year.toString(), textAlign: TextAlign.left,)
              ],),
              IconButton(icon: Icon(Icons.share), onPressed: () {
                print("share");
              },)
            ] 
          )
        ],
      ),
    );
  }
}