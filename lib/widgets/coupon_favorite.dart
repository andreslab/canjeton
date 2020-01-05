import 'package:canjeton/pages/favorite_detail.dart';
import 'package:canjeton/utils/icons/fa_solid_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CouponFavoriteModel {
  String urlImg;
  String localName;
  CouponFavoriteModel({this.urlImg, this.localName});
}

class CouponFavorite extends StatefulWidget {
  final CouponFavoriteModel couponFavoriteModel;

  const CouponFavorite({
    Key key,
    @required this.couponFavoriteModel,
  }) : super(key: key);

  @override
  _CouponFavoriteState createState() => _CouponFavoriteState();
}

class _CouponFavoriteState extends State<CouponFavorite> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                              widget.couponFavoriteModel.urlImg)))),
              Expanded(
                child: Text(
                  widget.couponFavoriteModel.localName,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Icon(FaSolid.chevron_right)
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "favorite_detail");
      },
    );
  }
}
