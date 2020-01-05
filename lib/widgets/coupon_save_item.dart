import 'package:canjeton/utils/color.dart';
import 'package:canjeton/utils/icons/fa_solid_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_save_detail.dart';
import '../utils/shape.dart';

class CouponSaveModel {
  String urlImgMin;
  String title;
  String discount;
  String description;
  String urlQr;
  CouponSaveModel(
      {this.urlImgMin,
      this.title,
      this.discount,
      this.description,
      this.urlQr});
}

class CouponSaveItem extends StatefulWidget {
  final CouponSaveModel couponSaveItemModel;

  const CouponSaveItem({
    Key key,
    @required this.couponSaveItemModel,
  }) : super(key: key);

  @override
  _CouponSaveItemState createState() => _CouponSaveItemState();
}

class _CouponSaveItemState extends State<CouponSaveItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("res/img/img_bg_coupon.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(left: 45, right: 45, top: 25, bottom: 25),
        child: Container(
          child: /*CustomPaint(
            painter: CouponPainter(isAdCoupon: false),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 60,
                    height: 60,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                widget.couponSaveItemModel.urlImgMin)))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.couponSaveItemModel.title,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.couponSaveItemModel.discount,
                        style: TextStyle(fontSize: 20, color: ColorsApp.colorP),
                      ),
                      Text(widget.couponSaveItemModel.description,
                          style: TextStyle(fontSize: 15, color: ColorsApp.colorP))
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(FaSolid.plus_circle, color: ColorsApp.colorP),
                  onPressed: () {
                    print("");
                  },
                )
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
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                      content: CouponSaveDetail(
                          couponSaveDetailModel: widget.couponSaveItemModel));
                }));
      },
    );
  }
}