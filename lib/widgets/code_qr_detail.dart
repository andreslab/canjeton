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
              tag: 'code_qr',
              child: Container(
                  width: radius,
                  height: radius,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              widget.codeQrDetailModel.urlQr)))),
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
                      child: Text(widget.codeQrDetailModel.title),
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
                        widget.codeQrDetailModel.discount,
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
                    widget.codeQrDetailModel.description),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Expira",
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
