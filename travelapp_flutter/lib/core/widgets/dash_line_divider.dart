import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/dashed_line_painter.dart';

class DashLineDivider extends StatelessWidget {
  const DashLineDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(),
      child: Container(),
    );
  }
}
