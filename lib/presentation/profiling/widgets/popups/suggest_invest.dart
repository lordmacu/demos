import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';

class SuggestInvestDialog extends StatelessWidget {
  final Function continueCallBack;

  const SuggestInvestDialog({
    Key key,
    this.continueCallBack,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(context),
            SizedBox(
              height: AppDimens.layoutSpacerHeader,
            ),
            Text(
              getIt<IEnv>().isColombia() ? S.of(context).sugestedInvestmentMessage1 : S.of(context).sugestedInvestmentMessageMx,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              getIt<IEnv>().isColombia() ? S.of(context).sugestedInvestmentMessage2 : S.of(context).sugestedInvestmentMessage2Mx,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).sugestedInvestmentMessage3,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutMargin,
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
