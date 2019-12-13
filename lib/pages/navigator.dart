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
            icon: Icon(Icons.home),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
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
        padding: EdgeInsets.only(top: statusBarSize),
        height: sizeBar + statusBarSize,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () => print(""),
            ),
            Expanded(
              child: Text(
                "Canjeton",
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, "search"),
            ),
          ],
        ));
  }
}
