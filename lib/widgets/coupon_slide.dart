import 'package:canjeton/widgets/coupon_detail.dart';
import 'package:flutter/material.dart';

class CouponSlide extends StatelessWidget {
  final String title;
  final String imgName;
  final bool isFavorite;
  final double discount;
  final DateTime dateExpire;

  const CouponSlide(
      {Key key,
      @required this.title,
      @required this.imgName,
      @required this.isFavorite,
      @required this.discount,
      @required this.dateExpire})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    final List<Color> colorBorder = [Colors.orange, Colors.purple];

    return InkWell(
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text(this.title)),
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
                    gradient: LinearGradient(colors: colorBorder)),
                child: Hero(
                  tag: 'detail_coupon',
                  child: Container(
                      width: radius / 2,
                      height: radius / 2,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(
                                  "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg")))),
                ),
              ),
              Expanded(
                child: Text(
                  "-" + this.discount.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 50, color: Colors.orange),
                ),
              ),
              Expanded(
                child: Text(
                  "En la compra del combo Completo",
                  textAlign: TextAlign.left,
                ),
              ),
              Row(children: [
                Icon(Icons.calendar_today),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Expira",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        this.dateExpire.day.toString() +
                            " " +
                            this.dateExpire.month.toString() +
                            " " +
                            this.dateExpire.year.toString(),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    print("share");
                  },
                )
              ])
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return AlertDialog(content: CouponDetail());
                }));
      },
    );
  }
}
