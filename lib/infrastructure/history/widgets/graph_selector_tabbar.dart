import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class GraphSelectorTabBar extends HookWidget {
  final VoidCallback onClickLeft;
  final VoidCallback onClickMiddle;
  final VoidCallback onClickRight;
  final int tabActivated;

  GraphSelectorTabBar({
    @required this.onClickLeft,
    @required this.onClickRight,
    @required this.onClickMiddle,
    @required this.tabActivated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                  color: tabActivated == 0
                      ? AppColors.inputColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: onClickLeft,
                child: Text(
                  S.of(context).graphSelectorLeft,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normal2.copyWith(
                    color: tabActivated == 0
                        ? AppColors.primaryColor
                        : AppColors.g25Color,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 6.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                  color: tabActivated == 1
                      ? AppColors.inputColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: onClickMiddle,
                child: Text(
                  S.of(context).graphSelectorMiddle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normal2.copyWith(
                    color: tabActivated == 1
                        ? AppColors.primaryColor
                        : AppColors.g25Color,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 6.0,
          ),
          //segundo boton
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                  color: tabActivated == 2
                      ? AppColors.inputColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: onClickRight,
                child: Text(
                  S.of(context).graphSelectorRight,
                  style: AppTextStyles.normal2.copyWith(
                    color: tabActivated == 2
                        ? AppColors.primaryColor
                        : AppColors.g25Color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
