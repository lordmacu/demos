import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

import '../../../injection.dart';

class AddMoneyDialog extends StatelessWidget {
  final Function continueCallBack;
  final String message;
  final bool fromEditDebit;
  final bool isLoading;

  const AddMoneyDialog({
    Key key,
    this.continueCallBack,
    this.message = "",
    this.fromEditDebit = false,
    this.isLoading = false,
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
              fromEditDebit ? S.of(context).editDebitDialogText1 : message,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            fromEditDebit
                ? SizedBox(
                    height: AppDimens.layoutSpacerS,
                  )
                : Container(),
            fromEditDebit
                ? Text(
                    getIt<IEnv>().isColombia()
                        ? S.of(context).editDebitDialogText2
                        : S.of(context).editDebitDialogText2Mx,
                    style: AppTextStyles.normal1.copyWith(
                      color: AppColors.g75Color,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${S.of(context).addMoneySubtitle}",
                  style: AppTextStyles.normal2.copyWith(
                    color: AppColors.g75Color,
                  ),
                ),
                Text(
                  S.of(context).businessDays,
                  style: AppTextStyles.normal1.copyWith(
                    color: AppColors.g75Color,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            PrimaryButton(
              text: S.of(context).goalsRecalculatedButtonUnderstood,
              action: continueCallBack,
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
        )
      ],
    );
  }
}
