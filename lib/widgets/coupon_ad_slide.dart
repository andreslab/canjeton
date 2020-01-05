import 'package:canjeton/utils/color.dart';
import 'package:canjeton/utils/icons/fa_regular_icons.dart';
import 'package:canjeton/utils/icons/fa_solid_icons.dart';
import 'package:canjeton/widgets/coupon_ad_detail.dart';
import 'package:flutter/material.dart';
import '../utils/shape.dart';

class CouponAdModel {
  final String title;
  final String description;
  final String imgName;
  final bool isFavorite;
  final String discount;
  final DateTime dateExpire;
  final String urlImg;
  CouponAdModel(
      {this.title,
      this.description,
      this.imgName,
      this.isFavorite,
      this.discount,
      this.dateExpire,
      this.urlImg});
}

class CouponAdSlide extends StatefulWidget {
  final CouponAdModel couponAdSlideModel;

  const CouponAdSlide({Key key, this.couponAdSlideModel}) : super(key: key);

  @override
  _CouponAdSlideState createState() => _CouponAdSlideState();
}

class _CouponAdSlideState extends State<CouponAdSlide> {
  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    final List<Color> colorBorder = [Colors.orange, Colors.purple];
    isFavorite = widget.couponAdSlideModel.isFavorite;
    return InkWell(
      child: 
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("res/img/img_bg_ad_slide.png"),
            fit: BoxFit.fill,
          ),
        ),
      /*CustomPaint(
        painter: CouponPainter(isAdCoupon: true),*/
        /*elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),*/
        child: Container(
          margin: EdgeInsets.all(45),
          child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(this.widget.couponAdSlideModel.title,
                              style: TextStyle(fontSize: 20))),
                      Icon(
                        this.isFavorite
                            ? FaSolid.star
                            : FaRegular.star,
                            color: ColorsApp.colorP,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                Center(
                                  child: Container(
                    width: radius / 1.7,
                    height: radius / 1.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        gradient: LinearGradient(colors: colorBorder)),
                    child: Hero(
                      tag: 'detail_coupon',
                      child: Container(
                          width: radius / 1.7,
                          height: radius / 1.7,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new NetworkImage(
                                      widget.couponAdSlideModel.urlImg)))),
                    ),
                  ),
                ),
                
                 Expanded(
                                    child: Text(
                      this.widget.couponAdSlideModel.discount,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 50, color: ColorsApp.colorP),
                    ),
                 ),
                
                Expanded(
                  child: Text(this.widget.couponAdSlideModel.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14)),
                ),
                Row(children: [
                  Icon(FaRegular.calendar_alt,color: ColorsApp.colorP,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Expira",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, color: ColorsApp.colorP),
                        ),
        
                        Text(
                          this
                                  .widget
                                  .couponAdSlideModel
                                  .dateExpire
                                  .day
                                  .toString() +
                              " " +
                              this
                                  .widget
                                  .couponAdSlideModel
                                  .dateExpire
                                  .month
                                  .toString() +
                              " " +
                              this
                                  .widget
                                  .couponAdSlideModel
                                  .dateExpire
                                  .year
                                  .toString(),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: ColorsApp.colorP,),
                    onPressed: () {
                      print("share");
                    },
                  )
                ])
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
                      content: CouponAdDetail(
                          couponAdDetailModel: widget.couponAdSlideModel));
                }));
      },
    );
  }
}
