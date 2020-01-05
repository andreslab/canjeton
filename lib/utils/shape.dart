import 'package:flutter/material.dart';

class CouponPainter extends CustomPainter {

  final bool isAdCoupon;

  CouponPainter({this.isAdCoupon});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    paint.blendMode = BlendMode.clear;


    var path = Path();

    final double borderRadius = 15;

    //border top left
      path.moveTo(10, 0.0);
      path.quadraticBezierTo(0,0.0, 0.0, borderRadius);
      path.lineTo(0.0, size.height * 0.50);

    if (isAdCoupon) {
      //border left
      path.quadraticBezierTo(size.width * 0.12, (size.height * 0.50 ) + 40, 0.0, (size.height * 0.50) + 80);
      
      //border bottom left
      path.lineTo(0.0, size.height- borderRadius);
      path.quadraticBezierTo(0, size.height, borderRadius, size.height);

      //border bottom right
      path.lineTo(size.width - borderRadius, size.height);
      path.quadraticBezierTo(size.width, size.height, size.width, size.height - borderRadius);

      //border right
      path.lineTo(size.width, ((size.height * 0.50) + 80));
      path.quadraticBezierTo(size.width * 0.88,  ((size.height * 0.50) + 80) - 40, size.width, ((size.height * 0.50) + 80) - 80);
    }else{
      //border left
      path.quadraticBezierTo(size.width * 0.12, size.height * 0.5, 0.0, size.height * 0.75);
      
      //border bottom left
      path.lineTo(0.0, size.height- borderRadius);
      path.quadraticBezierTo(0, size.height, borderRadius, size.height);

     //border bottom right
      path.lineTo(size.width - borderRadius, size.height);
      path.quadraticBezierTo(size.width, size.height, size.width, size.height - borderRadius);

      //border right
      path.lineTo(size.width, size.height * 0.75);
      path.quadraticBezierTo(size.width * 0.88, size.height * 0.50, size.width, size.height * 0.25);
    }

    //border top right
    path.lineTo(size.width, borderRadius);
    path.quadraticBezierTo(size.width,0.0, size.width - borderRadius, 0.0);
    path.lineTo(10, 0);
    
    



    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
