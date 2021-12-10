import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class FloatingBottom extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color background;
  final Icon icon;
  final Function onClick;

  FloatingBottom({this.width, this.height, this.color, this.background, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: width,
    //   height: height * 1.0,
    //   child: Column(
    //     children: <Widget>[
          return Container(
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle
            ),
            width: width,
            height: height,
            child: IconButton(
              icon: icon,
              color: color,
              enableFeedback: true,
              onPressed: onClick,
            ),
      //     ),
      //     Text(text,style: AppTextStyles.caption2.copyWith(color: AppColors.txtColorGrey)),
      //   ],
      // ),
    );
  }
}