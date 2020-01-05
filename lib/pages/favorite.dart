import 'package:canjeton/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_favorite.dart';

class FavoritePage extends StatelessWidget {
  List<CouponFavoriteModel> data = [
    CouponFavoriteModel(
        localName: "KFC",
        urlImg:
            "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png"),
    CouponFavoriteModel(
        localName: "KFC",
        urlImg:
            "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png"),
    CouponFavoriteModel(
        localName: "KFC",
        urlImg:
            "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png"),
    CouponFavoriteModel(
        localName: "KFC",
        urlImg:
            "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png"),
    CouponFavoriteModel(
        localName: "KFC",
        urlImg:
            "https://logosmarcas.com/wp-content/uploads/2018/11/KFC-S%C3%ADmbolo.png")
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("MIS FAVORITOS", style: TextStyle(color: ColorsApp.colorP),),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return CouponFavorite(couponFavoriteModel: data[position]);
              },
            )),
          ],
        ),
      ),
    );
  }
}
