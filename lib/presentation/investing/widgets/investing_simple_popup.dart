import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';

class InvestingSimplePopupDialog extends StatelessWidget {
  final String message;
  final String title;
  final String button;
  final Function onAccept;
  final double height;
  final double descriptionHeight;

  const InvestingSimplePopupDialog({
    Key key,
    this.message,
    this.title,
    this.button,
    this.onAccept,
    this.height = 130.0,
    this.descriptionHeight = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimens.dialogBorderRadius,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.title2.copyWith(
                color: AppColors.g25Color,
              ),
            ),
          ),
          Icon(
            Icons.info_outline,
            color: AppColors.infoColor,
            size: 40,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: descriptionHeight,
            child: Column(
               children: [
                Text(
                  message,
                  style: AppTextStyles.normal4,
                ),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        action: () {
                          ExtendedNavigator.rootNavigator.pop();
                        },
                        text: button,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
