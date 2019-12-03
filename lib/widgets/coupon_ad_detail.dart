import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_ad_slide.dart';


class CouponAdDetail extends StatefulWidget {
  final CouponAdModel couponAdDetailModel;

  const CouponAdDetail({
    Key key,
    @required this.couponAdDetailModel,
  }) : super(key: key);

  @override
  _CouponAdDetailState createState() => _CouponAdDetailState();
}

class _CouponAdDetailState extends State<CouponAdDetail> {
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
                              widget.couponAdDetailModel.urlImg)))),
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
                      child: Text(widget.couponAdDetailModel.title),
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
                        widget.couponAdDetailModel.discount,
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      ),
                    ),
                    Icon(Icons.file_download)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.couponAdDetailModel.description),
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
                            widget.couponAdDetailModel.dateExpire.day.toString() +
                                " " +
                                widget.couponAdDetailModel.dateExpire.month
                                    .toString() +
                                " " +
                                widget.couponAdDetailModel.dateExpire.year
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
