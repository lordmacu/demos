import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:intl/intl.dart';

class DeleteAccountDebitsDialog extends StatelessWidget {
  final VoidCallback leftButtonAction;
  final VoidCallback rightButtonAction;
  final String leftButtonText;
  final String rightButtonText;
  final List<DebitInfo> debitsAssociated;
  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  DeleteAccountDebitsDialog({
    Key key,
    this.leftButtonAction,
    this.rightButtonAction,
    this.rightButtonText = "",
    this.leftButtonText = "",
    this.debitsAssociated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  S.of(context).deleteAccountTitle,
                  style:
                      AppTextStyles.title2.copyWith(color: AppColors.g50Color),
                ),
              ),
              Icon(
                Icons.delete_outline,
                color: AppColors.errorToastColor,
                size: 35,
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutMargin,
          ),
          Text(
            debitsAssociated.length > 1
                ? S.of(context).deleteAccountAsociatedMultiple
                : S.of(context).deleteAccountAsociatedSingle,
            style: AppTextStyles.normal1.copyWith(
              color: AppColors.g75Color,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          Text(
            S.of(context).deleteAccountDescription2,
            style: AppTextStyles.normal1.copyWith(
              color: AppColors.g75Color,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          Column(
            children: [
              Column(
                  children: debitsAssociated
                      .map(
                        (element) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getPeriodicity(element.periodicity),
                                  style: AppTextStyles.normal2.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  formatCurrency.format(element.value),
                                  style: AppTextStyles.normal1.copyWith(
                                    color: AppColors.g75Color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerS,
                            ),
                          ],
                        ),
                      )
                      .toList())
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SecondaryButton(
                  action: leftButtonAction,
                  text: leftButtonText,
                ),
              ),
              SizedBox(
                width: AppDimens.layoutSpacerXs,
              ),
              Expanded(
                child: PrimaryButtonSmall(
                  text: rightButtonText,
                  action: rightButtonAction,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getPeriodicity(int number) {
    switch (number) {
      case 1:
        return "Quincenal";
        break;
      case 2:
        return "Mensual";
        break;
      case 3:
        return "Trimestral";
        break;
      default:
        return "Mensual";
    }
  }
}
