import 'package:canjeton/utils/color.dart';
import 'package:canjeton/utils/icons/fa_brands_icons.dart';
import 'package:canjeton/utils/icons/fa_regular_icons.dart';
import 'package:canjeton/utils/icons/fa_solid_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'ticket.dart';
import 'favorite.dart';
import 'profile.dart';
import '../api/favorite.dart';
import '../api/coupon.dart';

class DataCoupon {
  final List dataListCoupon;

  DataCoupon(this.dataListCoupon);
}

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  final screens = [HomePage(), TicketPage(), FavoritePage(), ProfilePage()];

  final _couponAPI = CouponAPI();
  final _favoriteAPI = FavoriteAPI();

  @override
  Widget build(BuildContext context) {
    final DataCoupon args = ModalRoute.of(context).settings.arguments;
    print("args: " + args.dataListCoupon.toString());

    return Scaffold(
      body: Column(children: [
        CustomAppBar(),
        Expanded(
          child: _currentIndex == 0
              ? HomePage(
                  listCoupons: args.dataListCoupon,
                )
              : screens[_currentIndex],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FaSolid.home, color: _currentIndex==0 ? ColorsApp.colorP: Colors.grey,),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FaSolid.ticket_alt, color: _currentIndex==1 ? ColorsApp.colorP: Colors.grey,),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FaRegular.star, color: _currentIndex==2 ? ColorsApp.colorP: Colors.grey,),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FaRegular.user, color: _currentIndex==3 ? ColorsApp.colorP: Colors.grey,),
            title: Text(""),
          ),
        ],
        onTap: (index) => _loadFavorite(index),
      ),
    );
  }

  _loadFavorite(int index) async {
    if (index == 0) {
      print("call coupons");
      //call request
      final data = await _couponAPI.getCouponsList(context);

      if (data != null) {
        print("LIST FAVORITE SUCCESS");
        print(data.toString());
      }
    }
    if (index == 1) {
      /*print("call coupons");
      //call request
      final data = await _couponAPI.getCouponsList(context);

      if (data != null) {
        print("LIST FAVORITE SUCCESS");
        print(data.toString());
      }*/
    }
    if (index == 2) {
      print("call coupons");
      //call request
      final data = await _favoriteAPI.getFavoriteByUser(context, id: "0");
      if (data != null) {
        print("LIST FAVORITE SUCCESS");
        print(data.toString());
      }
    }
    setState(() {
      _currentIndex = index;
    });
  }
}

class CustomAppBar extends StatelessWidget {
  final double sizeBar = 66;
  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;
    return Container(
        padding: EdgeInsets.only(top:statusBarSize, left:20, right: 20),
        height: sizeBar + statusBarSize,
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: ColorsApp.colorP,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: IconButton(
                icon: Icon(FaSolid.adjust),
                color: Colors.white,
                onPressed: () => print(""),
              ),
            ),
            Expanded(
              child: Image.asset("res/img/img_title_canjeton.png")
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: ColorsApp.colorP,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: IconButton(
                icon: Icon(FaSolid.search),
                color: Colors.white,
                onPressed: () => Navigator.pushNamed(context, "search"),
              ),
            ),
          ],
        ));
  }
}
