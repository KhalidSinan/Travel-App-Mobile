import 'package:flutter/material.dart';

class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, (size.height / 2 + 50) - 30)
      ..quadraticBezierTo(size.width * 0.10, (size.height / 2 + 50), 0,
          (size.height / 2 + 50) + 30)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, (size.height / 2 + 50) + 30)
      ..quadraticBezierTo(size.width * 0.90, (size.height / 2 + 50), size.width,
          (size.height / 2 + 50) - 30)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
