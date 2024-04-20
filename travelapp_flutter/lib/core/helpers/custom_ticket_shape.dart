import 'package:flutter/material.dart';

class CustomOneWayTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int distance = 50;
    final path = Path()
      ..lineTo(0, (size.height / 2 + distance) - 30)
      ..quadraticBezierTo(size.width * 0.10, (size.height / 2 + distance), 0,
          (size.height / 2 + distance) + 30)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, (size.height / 2 + distance) + 30)
      ..quadraticBezierTo(size.width * 0.90, (size.height / 2 + distance),
          size.width, (size.height / 2 + distance) - 30)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomTwoWayTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int distance = 120;
    final path = Path()
      ..lineTo(0, (size.height / 2 + distance) - 30)
      ..quadraticBezierTo(size.width * 0.10, (size.height / 2 + distance), 0,
          (size.height / 2 + distance) + 30)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, (size.height / 2 + distance) + 30)
      ..quadraticBezierTo(size.width * 0.90, (size.height / 2 + distance),
          size.width, (size.height / 2 + distance) - 30)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
