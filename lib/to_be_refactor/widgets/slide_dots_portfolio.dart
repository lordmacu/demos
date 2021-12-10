import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class SlideDotsPortfolio extends StatelessWidget {
  bool isActive;
  SlideDotsPortfolio(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: isActive ? 4 : 2,
      width: isActive ? 20 : 20,
      decoration: BoxDecoration(
          color: isActive ? AppColors.successColor : AppColors.g10Color,
          borderRadius: BorderRadius.circular(2.0)),
    );
  }
}
