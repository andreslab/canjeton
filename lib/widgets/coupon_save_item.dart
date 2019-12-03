import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_save_detail.dart';

class CouponSaveModel {
  String urlImgMin;
  String title;
  String discount;
  String description;
  String urlQr;
  CouponSaveModel(
      {this.urlImgMin, this.title, this.discount, this.description, this.urlQr});
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
        child: Row(
          children: <Widget>[
            Container(
                width: 80,
                height: 80,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            widget.couponSaveItemModel.urlImgMin)))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.couponSaveItemModel.title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.couponSaveItemModel.discount,
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
                Text(widget.couponSaveItemModel.description,
                    style: TextStyle(fontSize: 15, color: Colors.orange))
              ],
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("");
              },
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return AlertDialog(content: CouponSaveDetail(couponSaveDetailModel: widget.couponSaveItemModel));
                }));
      },
    );
  }
}
