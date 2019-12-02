import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CouponDetailModel {
  String urlImg;
  String title;
  bool isFavorite;
  String discount;
  String description;
  DateTime dateExpire;
  CouponDetailModel(
      {this.urlImg,
      this.title,
      this.isFavorite,
      this.discount,
      this.description,
      this.dateExpire});
}

class CouponDetail extends StatefulWidget {
  final CouponDetailModel couponDetailModel;

  const CouponDetail({
    Key key,
    @required this.couponDetailModel,
  }) : super(key: key);

  @override
  _CouponDetailState createState() => _CouponDetailState();
}

class _CouponDetailState extends State<CouponDetail> {
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
                              widget.couponDetailModel.urlImg)))),
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
                      child: Text(widget.couponDetailModel.title),
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
                        widget.couponDetailModel.discount,
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      ),
                    ),
                    Icon(Icons.file_download)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.couponDetailModel.description),
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
                            widget.couponDetailModel.dateExpire.day.toString() +
                                " " +
                                widget.couponDetailModel.dateExpire.month
                                    .toString() +
                                " " +
                                widget.couponDetailModel.dateExpire.year
                                    .toString(),
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
