import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'ticket.dart';
import 'favorite.dart';
import 'profile.dart';

class DataCoupon{
  final List dataListCoupon;

  DataCoupon(this.dataListCoupon);
}

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  int _currentIndex = 0;

  final screens = [
    HomePage(),
    TicketPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {

    final DataCoupon args = ModalRoute.of(context).settings.arguments;
    print("args: " + args.dataListCoupon.toString());

    return Scaffold(
      body: Column(
        children : [
        CustomAppBar(),
        Expanded(child: _currentIndex == 0 ? HomePage(listCoupons: args.dataListCoupon,) : screens[_currentIndex],)
         ,]
      ),
      
     
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
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
          IconButton(icon: Icon(Icons.add_circle), onPressed: () => print(""),),
          Expanded(child: Text("Canjeton", textAlign: TextAlign.center,),),
          IconButton(icon: Icon(Icons.search), onPressed: () => Navigator.pushNamed(context, "search"),),
        ],
      )
      );
  }
}