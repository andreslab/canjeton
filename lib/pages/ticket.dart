import 'package:canjeton/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_save_item.dart';
import '../widgets/ticket_type.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  List<CouponSaveModel> data = [
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr:
            "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr:
            "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr:
            "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr:
            "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr:
            "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg")
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              width: size.width,
              child: /*CupertinoSegmentedControl(
                pressedColor: ColorsApp.colorP,
                selectedColor: ColorsApp.colorP,
                borderColor: Colors.grey,
                children: logoWidgets,
                onValueChanged: (val) {
                  setState(() {
                    sharedVal = val;
                  });
                },
                groupValue: sharedVal,
              ),*/
              MaterialSegmentedControl(
          children: tabs,
          selectionIndex: current,
          selectedColor: ColorsApp.colorP,
          borderColor: Colors.grey,
          unselectedColor: Colors.white,
          borderRadius: 32.0,
          disabledChildren: [
            3,
          ],
          onSegmentChosen: (index) {
            setState(() {
              current = index;
            });
          },
         )
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child:
                    /*ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return CouponSaveItem(couponSaveItemModel: data[position]);
              },
            )*/
                    PageView.builder(
              itemCount: 3,
              itemBuilder: (context, position) {
                return TicketTypePage();
              },
            )),
          ],
        ),
      ),
    );
  }

  final Map<int, Widget> tabs = const <int, Widget>{
    0: Text("Activos"),
    1: Text("Inactivos"),
    2: Text("Por vencer"),
  };
}
