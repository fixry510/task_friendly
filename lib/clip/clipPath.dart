import 'package:flutter/material.dart';

class ClipContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double fromTop = 30;
    path.moveTo(-50, fromTop);
    path.quadraticBezierTo(size.width / 2, 0, size.width + 50, fromTop);
    path.lineTo(size.width + 50, size.height + 50);
    path.lineTo(-50, size.height + 50);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
