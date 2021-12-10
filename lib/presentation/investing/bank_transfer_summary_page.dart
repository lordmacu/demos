import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/investing/widgets/bank_transfer_warning_dialog.dart';
import 'package:ualet/router/router.gr.dart';

class BankTransferSummaryPage extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  BankTransferSummaryPage({
    @required this.goal,
    @required this.bankTransfer,
    @required this.investment,
  });

  @override
  Widget build(BuildContext context) {
    double total = (investment + (bankTransfer ? 1600 : 950));
    DateTime fecha = DateTime.now();
    String fechaString = "${fecha.day}/${fecha.month}/${fecha.year}";
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
          text: S.of(context).finalizeInvestment,
          action: () {
            // getIt<IFireBaseEventLogger>().personalSuccessfulVerification();

            _showPopup(context);
          },
          enabled: true,
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(
            left: AppDimens.layoutMargin,
            right: AppDimens.layoutMargin,
            top: AppDimens.layoutMargin,
          ),
          children: <Widget>[
            title(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            subtitle(context),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            transactionSummaryContainer(context, total),
            SizedBox(
              height: AppDimens.layoutSpacerL * 1.3,
            ),
            Text(
              S.of(context).movementsInProgress,
              style: AppTextStyles.subtitle2.copyWith(
                color: AppColors.g75Color,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            movementContainer(context, total, fechaString),
          ],
        ),
      ),
    );
  }

  Text subtitle(BuildContext context) {
    return Text(
      S.of(context).pseSummaryDescription,
      style: AppTextStyles.normal1.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Padding title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppDimens.layoutSpacerM,
      ),
      child: Text(
        S.of(context).bankTransferSummaryTitle,
        style: AppTextStyles.title2.copyWith(
          color: AppColors.g25Color,
        ),
      ),
    );
  }

  Container movementContainer(
      BuildContext context, double total, String fechaString) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                S.of(context).pseMovementTitle,
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
              Text(
                "${formatCurrency.format(total)}",
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              )
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                fechaString,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${S.of(context).pendient} ",
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.infoColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container transactionSummaryContainer(BuildContext context, double total) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                S.of(context).yourInvestment,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${formatCurrency.format(investment)}",
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              )
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                S.of(context).withdrawalFee,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                bankTransfer ? "\$1.600 " : "\$950",
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXs,
          ),
          Divider(
            color: AppColors.backgroundColor,
            thickness: 1.0,
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXs,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                S.of(context).withdrawTotal,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${formatCurrency.format(total)}",
                style:
                    AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              )
            ],
          ),
        ],
      ),
    );
  }

  _showPopup(context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: BankTransferWarningDialog(
            buttonText: S.of(context).withdrawalTransactionSummaryButton,
            buttonAction: () => ExtendedNavigator.rootNavigator
                .pushNamedAndRemoveUntil(
                    Routes.homePage, (route) => route.isFirst),
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.25)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
