import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double screenHeight({double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize.height - reducedBy) / dividedBy;
  }

  double screenWidth({double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize.width - reducedBy) / dividedBy;
  }

  double screenHeightExcludingToolbar({double dividedBy = 1}) {
    return screenHeight(dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }
}
