import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_save_item.dart';

class CouponSaveDetail extends StatefulWidget {
  final CouponSaveModel couponSaveDetailModel;

  const CouponSaveDetail({
    Key key,
    @required this.couponSaveDetailModel,
  }) : super(key: key);

  @override
  _CouponSaveDetailState createState() => _CouponSaveDetailState();
}

class _CouponSaveDetailState extends State<CouponSaveDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;

    return Container(
      height: size.height / 3.5,
      width: size.width / 1.6,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -100,
              child: Container(
                  width: radius,
                  height: radius,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              widget.couponSaveDetailModel.urlQr)))),
            ),
            Container(
              margin: EdgeInsets.only(top: radius / 2),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(widget.couponSaveDetailModel.title,
                        style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.couponSaveDetailModel.discount,
                      style: TextStyle(fontSize: 50, color: Colors.orange),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(widget.couponSaveDetailModel.description,
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
