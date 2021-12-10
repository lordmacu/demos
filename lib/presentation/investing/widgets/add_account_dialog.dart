import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';

class AddAccountDialog extends StatelessWidget {
  final Function acceptCallBack;
  final Function undoCallback;

  const AddAccountDialog({Key key, this.acceptCallBack, this.undoCallback})
      : super(key: key);

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
      content: Container(
        margin: EdgeInsets.all(0),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(AppDimens.dialogBorderRadius),
        //     ),
        //     color: AppColors.whiteColor),
        // width: MediaQuery.of(context).size.width * 1.1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(context),
            SizedBox(
              height: AppDimens.layoutSpacerHeader,
            ),
            Text(
              S.of(context).addAccountDialogSubtitle,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Text(
              S.of(context).addAccountDialogSubtitle2,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: SecondaryButton(
                        text: S.of(context).goBack, action: undoCallback),
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutHSpacerS,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: PrimaryButtonSmall(
                      text: S.of(context).continueButton,
                      action: acceptCallBack,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            S.of(context).addAccountDialogTitle,
            style: AppTextStyles.title2.copyWith(
              color: AppColors.g50Color,
            ),
          ),
        ),
        Image.asset(
          AppImages.monetizationSucess,
          height: 30,
        ),
      ],
    );
  }
}
