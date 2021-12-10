import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class DeleteDebitPopup extends StatelessWidget {
  final VoidCallback accept;
  final VoidCallback reject;
  final List<DashboardGoal> goals;

  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  DeleteDebitPopup({
    Key key,
    this.accept,
    this.reject,
    @required this.goals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double extraHeight = 50.0 * goals.length;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
      content: Container(
        height: 280 + extraHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).deleteDebitTitle,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g50Color,
                    ),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: AppColors.g25Color,
                  size: 40,
                ),
              ],
            ),
            Text(
              S.of(context).deleteDebitRelatedGoals,
              style: AppTextStyles.normal4,
            ),
            _goals(),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Text(
              S.of(context).deleteDebitSubTitle,
              style: AppTextStyles.normal4,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    child: SecondaryButton(
                        text: S.of(context).goalsRecalculatedButtonBack,
                        action: reject),
                  ),
                ),
                SizedBox(
                  width: AppDimens.layoutHSpacerS,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: PrimaryButtonSmall(
                        text: S.of(context).yesContinue, action: accept),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _goals() {
    var parser = EmojiParser();
    List<Widget> lst = [];
    goals.forEach((g) {
      lst.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(g.name,
              style:
                  AppTextStyles.subtitle2.copyWith(color: AppColors.g50Color)),
          Text(
            parser.emojify(":${g.emoji}:"),
            style: TextStyle(fontSize: 40),
          )
        ],
      ));
      lst.add(Divider());
    });
    return Column(
      children: lst,
    );
  }

  getPeriodicity(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).quincenal;
        break;
      case 2:
        return S.of(context).mensual;
        break;
      case 3:
        return S.of(context).trimestral;
        break;
      default:
        return "";
    }
  }
}
