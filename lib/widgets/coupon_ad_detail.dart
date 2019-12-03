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
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    this.isFavorite = widget.couponAdDetailModel.isFavorite;

    return Container(
      height: size.height / 2.4,
      width: size.width / 1.6,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
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
                        child: Text(widget.couponAdDetailModel.title,
                        style: TextStyle(fontSize: 20)),
                      ),
                      IconButton(
                        icon: this.isFavorite
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                            setState(() {
                              this.isFavorite = !this.isFavorite;
                            });
                        },
                      )
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
                          style: TextStyle(fontSize: 50, color: Colors.orange),
                        ),
                      ),
                      Icon(Icons.file_download)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.couponAdDetailModel.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14)),
                  Row(
                    children: <Widget>[
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
                              widget.couponAdDetailModel.dateExpire.day
                                      .toString() +
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
      ),
    );
  }
}
