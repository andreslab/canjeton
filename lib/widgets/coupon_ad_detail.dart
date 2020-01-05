import 'package:canjeton/utils/color.dart';
import 'package:canjeton/utils/icons/fa_solid_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coupon_ad_slide.dart';
import '../api/favorite.dart';

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
  final _favoriteAPI = FavoriteAPI();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    this.isFavorite = widget.couponAdDetailModel.isFavorite;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("res/img/img_bg_ad_slide.png"),
              fit: BoxFit.fill,
            ),
          ),
        height: size.height / 2.4,
        width: size.width / 1.4,
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
                          onPressed: () => _saveFavorite(),
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
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: ColorsApp.colorP,
                              borderRadius: BorderRadius.all(Radius.circular(25))),
                          child: IconButton(
                            icon: Icon(FaSolid.download, color: Colors.white,),
                            color: Colors.white,
                            onPressed: () => print(""),
                          ),
                        ),
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
      ),
    );
  }

  _saveFavorite() async {
    final data = await _favoriteAPI.saveCouponByUser(context, idCoupon: "213", idUser: "4");

      if (data != null) {
        print("SAVE FAVORITE SUCCESS");
        print(data.toString());
      }

      setState(() {
        this.isFavorite = true;
      });
  }
}
