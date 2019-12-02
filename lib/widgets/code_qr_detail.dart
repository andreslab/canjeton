import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CodeQrDetailModel {
  String urlQr;
  String title;
  String discount;
  String description;
  CodeQrDetailModel({this.urlQr, this.title, this.discount, this.description});
}

class CodeQrDetail extends StatefulWidget {

  final CodeQrDetailModel codeQrDetailModel;

  const CodeQrDetail(
      {Key key,
      @required this.codeQrDetailModel,})
      : super(key: key);

  @override
  _CodeQrDetailState createState() => _CodeQrDetailState();
}

class _CodeQrDetailState extends State<CodeQrDetail> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;

    return Container(
      color: Colors.transparent,
      height: size.height / 2,
      width: size.width / 1.6,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -100,
            child: Hero(
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
          ),
          Container(
            margin: EdgeInsets.only(top: radius / 2),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Hamburguesa del colorado"),
                    ),
                    Icon(Icons.favorite)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "-30%",
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      ),
                    ),
                    Icon(Icons.file_download)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "En la compra del combo completo.\n 1 Homburguesa con queso 1 Papas fritas, 1 Cocacola mediana."),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Expira",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "30 Dic 2019",
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.share)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
