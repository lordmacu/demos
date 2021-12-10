import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: isActive ? 10 : 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.primarySoftColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
