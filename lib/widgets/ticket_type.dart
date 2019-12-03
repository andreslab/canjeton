import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coupon_save_item.dart';

class TicketTypePage extends StatefulWidget {
  @override
  _TicketTypePageState createState() => _TicketTypePageState();
}

class _TicketTypePageState extends State<TicketTypePage> {

  List<CouponSaveModel> data = [
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr: "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr: "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr: "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr: "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg"),
    CouponSaveModel(
        title: "Hamburguesa",
        description: "Hamburuesa con queso",
        urlImgMin:
            "https://media.metrolatam.com/2019/10/24/capturadepantall-41ce6991af50c8087af5dafb6c0e6785-600x400.jpg",
        discount: "-30%",
        urlQr: "https://www.vanguardia.com/binrepository/716x477/0c0/0d0/none/12204/WTSC/DATA_ART_325251_BIG_CE_VL216321_MG21568226.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return CouponSaveItem(couponSaveItemModel: data[position]);
              },
            ),
      ),
    );
  }
}