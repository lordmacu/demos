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

class InvestingPopupDialog extends StatelessWidget {
  final InvestingMxMainState state;
  final Function acceptCallBack;
  final Function undoCallback;

  const InvestingPopupDialog(
      {Key key, this.state, this.acceptCallBack, this.undoCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius))),
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
              height: AppDimens.layoutSpacerM,
            ),
            _disclamer(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(state.goal.name,
                style: AppTextStyles.normal3.copyWith(
                  color: AppColors.g50Color,
                )),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            _before(context),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            _now(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(S.of(context).doYouWantToApplyTheChanges,
                style: AppTextStyles.normal4),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: SecondaryButton(
                      text: S.of(context).goBack, action: undoCallback),
                ),
                SizedBox(
                    // width: AppDimens.layoutHSpacerS,
                    ),
                Container(
                  // padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: PrimaryButtonSmall(
                      text: S.of(context).yesContinue, action: acceptCallBack),
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
            S.of(context).goalRecalculated,
            style: AppTextStyles.title2.copyWith(
              color: AppColors.g25Color,
            ),
          ),
        ),
        Icon(Icons.info_outline, color: AppColors.g25Color, size: 40),
      ],
    );
  }

  Widget _disclamer(BuildContext context) {
    return Text(S.of(context).youChangedPeriodicity,
        style: AppTextStyles.normal4);
  }

  Widget _before(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(S.of(context).before, style: AppTextStyles.normal4),
        Text("${state.oldMonths.toString()} ${S.of(context).months}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.g50Color,
            ))
      ],
    );
  }

  Widget _now(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(S.of(context).now, style: AppTextStyles.normal4),
        Text("${state.goal.numMonths.toString()} ${S.of(context).months}",
            style: AppTextStyles.normal3.copyWith(
              color: AppColors.successColor,
            ))
      ],
    );
  }
}
