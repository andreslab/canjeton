import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_save_item.dart';


class CouponSaveDetail extends StatefulWidget {

  final CouponSaveModel couponSaveDetailModel;

  const CouponSaveDetail(
      {Key key,
      @required this.couponSaveDetailModel,})
      : super(key: key);

  @override
  _CouponSaveDetailState createState() => _CouponSaveDetailState();
}

class _CouponSaveDetailState extends State<CouponSaveDetail> {

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
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              widget.couponSaveDetailModel.urlQr)))),
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
                      child: Text(widget.couponSaveDetailModel.title),
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
                        widget.couponSaveDetailModel.discount,
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
                    widget.couponSaveDetailModel.description),
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
