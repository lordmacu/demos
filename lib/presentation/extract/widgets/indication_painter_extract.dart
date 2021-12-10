import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class TabIndicationPainterExtract extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  TabIndicationPainterExtract(
      {this.dxTarget = 150.0,
      this.dxEntry = 5,
      this.radius = 25.0,
      this.dy = 25.0,
      this.pageController})
      : super(repaint: pageController) {
    painter = Paint()
      ..color = AppColors.inputColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;
    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(entry.dx, dy - 25, target.dx, dy + 25),
        Radius.circular(radius)));

    canvas.translate(size.width * pageOffset, 0.0);
    //canvas.drawShadow(path, Colors.white, 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainterExtract oldDelegate) => true;
}
