import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';

class ReturnPage extends StatelessWidget {
  final String title;
  const ReturnPage({@required this.title});

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return Container(
      width: _media.width * 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: AppDimens.buttonBack.height,
            ),
            onPressed: () {
              ExtendedNavigator.rootNavigator.pop(context);
            },
          ),
          Container(
            padding: EdgeInsets.only(left: AppDimens.layoutSpacerHeader),
            child: Text(title, style: AppTextStyles.title2.copyWith(color: AppColors.g25Color))
          ),
        ],
      ),
    );
  }
}