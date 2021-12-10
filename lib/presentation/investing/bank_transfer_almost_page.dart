import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/investing/widgets/bank_transfer_dialog.dart';
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
import 'package:ualet/router/router.gr.dart';

class BankTransferAlmostPage extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  final formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

  NumberFormat formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final double investment;
  final bool isFirstInvestment;
  final bool finishedVinculation;

  BankTransferAlmostPage(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.bankTransferValue,
      this.multiple = false,
      this.goals,
      this.valuesChosen,
      this.investment = 0,
      this.isFirstInvestment = false,
      this.finishedVinculation = false});

  @override
  Widget build(BuildContext context) {
    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;
    double value = bankTransferValue;
    if (multiple) {
      value = 0;
      valuesChosen.forEach((element) {
        value += element;
      });
    }
    double total;
    if (getIt<IEnv>().isColombia()) {
      total = multiple
          ? valuesChosen.fold(0, (i, j) => i + j) + (bankTransfer ? 1600 : 950)
          : (bankTransferValue + (bankTransfer ? 1600 : 950));
    } else {
      total = (value + Values.bankTransferCost);
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: PrimaryButton(
          text: S.of(context).continueButton,
          action: () async {
            if (getIt<IEnv>().isColombia())
              _showPopup(context);
            else {
              ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.investingChooseAccountMx,
                      arguments: InvestingChooseAccountMxArguments(
                        goal: goal,
                        bankTransfer: bankTransfer,
                        bankTransferValue: bankTransferValue,
                        multiple: multiple,
                        goals: goals,
                        valuesChosen: valuesChosen,
                      ));
            }
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
            top: AppDimens.layoutSpacerX * 1.5,
          ),
          children: <Widget>[
            Image.asset(
              AppImages.checkIconSuccess,
              height: 90,
              width: 90,
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              S.of(context).bankTransferAlmostTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.title2.copyWith(
                color: AppColors.successColor,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Text(
              getIt<IEnv>().isColombia()
                  ? S.of(context).almostPSEDescription
                  : S.of(context).almostPSEDescriptionMx,
              textAlign: TextAlign.center,
              style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color,
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            infoContainer(context, total, value),
          ],
        ),
      ),
    );
  }

  Container infoContainer(BuildContext context, double total, double value) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          AppDimens.dialogBorderRadius,
        ),
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
                "${formatCurrency.format(value)}",
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
                S.of(context).bankFee,
                style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                getIt<IEnv>().isColombia()
                    ? bankTransfer ? "\$1.600 " : "\$950 "
                    : bankTransfer ? "\$10.0 " : "\$10.0 ",
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
                style: AppTextStyles.normal2.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showPopup(context) async {
    if (isFirstInvestment) {
      // await getIt<IFirebaseEventLoggerMX>().domicilioVerificationSuccess();
      await getIt<IAppsFlyerEventLogger>()
          .logEvent(AFEvents.VERIFICACION_EXITO, {});
    }

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: BankTransferDialog(
            buttonAction: () async {
              getIt<IFireBaseEventLogger>().investmentPseGoBank();

              List<DashboardGoal> goals = [];
              if (goal != null && goal.id != 0) {
                goals.add(goal);
              }
              String url = 'https://www.google.com/';
              ExtendedNavigator.rootNavigator.pop();
              bool error = false;
              List<double> oValues = [investment];
              var result = await getIt<IInvestingRepository>()
                  .generateSpei(investment, goals, oValues);
              result.fold((l) {
                error = true;
                ToastHelper.createError(
                        message: l.map(
                            unexpected: (e) => "Error inesperado",
                            fromServer: (e) => "Error: ${e.message}"))
                    .show(context);
                Future.delayed(Duration(seconds: 6)).then((_) =>
                    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                        Routes.homePage, (route) => false));
              }, (r) {
                url = r;
              });
              if (error) return;

              ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.investingPseWebView,
                      arguments: InvestingPseWebViewArguments(url: url))
                  .then((value) {
                print(value);
                double transferTotal = investment;

                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.investingTransactionSummary,
                  arguments: InvestingTransactionSummaryArguments(
                    goal: goal,
                    bankTransfer: bankTransfer,
                    bankTransferValue: transferTotal,
                  ),
                );
              });
            },
            buttonText: S.of(context).continueButton,
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.23)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
