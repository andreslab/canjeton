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
      {this.urlImgMin,
      this.title,
      this.discount,
      this.description,
      this.urlQr});
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
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        child: Container(
          height: 150,
          child: CustomPaint(
            painter: CouponPainter(),
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
                Expanded(
                  child: Column(
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
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return AlertDialog(
                      content: CouponSaveDetail(
                          couponSaveDetailModel: widget.couponSaveItemModel));
                }));
      },
    );
  }
}

class CouponPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;


    var path = Path();
    
    //border left
    path.lineTo(0.0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.5, 0.0, size.height * 0.75);
    path.lineTo(0.0, size.height);
    //bottom line
    path.lineTo(size.width, size.height);
    //border right
    path.lineTo(size.width, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.88, size.height * 0.50, size.width, size.height * 0.25);
    path.lineTo(size.width, 0.0);

    //top line
    path.lineTo(0, 0);



    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
