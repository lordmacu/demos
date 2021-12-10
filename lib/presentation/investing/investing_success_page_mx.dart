import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/infrastructure/investing/investing_repo_mx_true.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';

class InvestingSuccessPageMX extends StatefulWidget {
  final DashboardGoal goal;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool finishedVinculation;
  final bool isLoading;
  final double bankTransferValue;

  const InvestingSuccessPageMX(
      {Key key,
      this.goal,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen,
      this.finishedVinculation = false,
      this.isLoading = false,
      this.bankTransferValue = 0})
      : super(key: key);

  @override
  _InvestingSuccessPageMX createState() => _InvestingSuccessPageMX(
      multiple: this.multiple,
      goal: this.goal,
      bankAccountItem: this.bankAccountItem,
      goals: this.goals,
      valuesChosen: this.valuesChosen,
      finishedVinculation: this.finishedVinculation,
      isLoading: this.isLoading);
}

class _InvestingSuccessPageMX extends State<InvestingSuccessPageMX> {
  DashboardGoal goal;
  BankAccountItem bankAccountItem;
  bool multiple;
  List<DashboardGoal> goals;
  List<double> valuesChosen;
  bool finishedVinculation;
  bool isLoading;

  _InvestingSuccessPageMX(
      {this.goal,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen,
      this.finishedVinculation = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: AppDimens.layoutSpacerXL,
                  ),
                  Center(child: _centerIcon(context)),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _hemosTerminado(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _subtitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _overviewContainer(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _buttonNext(context),
                ],
              )),
          LoadingInProgressOverlay(isLoading: isLoading)
        ],
      ),
    );
  }

  Widget _centerIcon(BuildContext context) {
    return Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.successColor,
        ),
        child: Center(
            child: Icon(
          Icons.check_circle_outline,
          color: AppColors.whiteColor,
          size: 45,
        )));
  }

  Widget _hemosTerminado(BuildContext context) {
    return Text(S.of(context).weAreDone,
        style: AppTextStyles.title2.copyWith(
          color: AppColors.successColor,
        ));
  }

  Widget _subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.layoutSpacerM),
      child: Text(
        S.of(context).investingDomDoneSubtitle,
        style: AppTextStyles.normal4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _overviewContainer(BuildContext context) {
    double value = 0;
    value = widget.bankTransferValue;
    NumberFormat mxFormatter = NumberFormaters.mxFormater;
    String fee = mxFormatter.format(value);
    String total = mxFormatter.format(value + Values.bankTransferCost);
    return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.dialogBorderRadius))),
        padding: EdgeInsets.all(AppDimens.layoutMargin),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).yourInvestment,
                    style: AppTextStyles.normal4),
                Text("$fee",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).bankFee, style: AppTextStyles.normal4),
                Text("\$10.00",
                    style: AppTextStyles.normal2.copyWith(
                      color: AppColors.g75Color,
                    )),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(S.of(context).total, style: AppTextStyles.normal4),
                  Text("$total",
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ))
                ]),
          ],
        ));
  }

  Widget _buttonNext(BuildContext context) {

    List<DashboardGoal> goalsNew = [];
    List<DashboardGoal> lstGoals = goals == null ?  goalsNew : goals;

    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).finalizeInvestment,
        action: () async {
          setState(() {
            this.isLoading = true;
          });
          bool error = false;
          var lvl =
              (await getIt<ICustomerLevelRepoMx>().getCurrentCustomerLevel())
                  .fold((l) {
            error = true;
            setState(() {
              this.isLoading = false;
            });
            return -3;
          }, (r) => r);
          if (error) {
            setState(() {
              this.isLoading = false;
            });
            ToastHelper.createError(
                    message: "Error inesperado, intente de nuevo")
                .show(context);
            return;
          }
          if (lvl != CustomerLevelRepository.INVESTING_DONE) {
            //Firebase 42
            // await getIt<IFirebaseEventLoggerMX>()
            //     .domicilioVerificationSuccess();
            //AppsFlyer 42
            await getIt<IAppsFlyerEventLogger>()
                .logEvent(AFEvents.VERIFICACION_EXITO, {});
          }
          double value = 0;
          value = widget.bankTransferValue;

          //schedule transaction
          var response = await getIt<IInvestingRepositoryMx>()
              .addScheduledDebit(bankAccountItem, goal, multiple, lstGoals, value);

          response.fold((l) {
            setState(() {
              this.isLoading = false;
            });
            error = true;
            ToastHelper.createError(
                duration: Duration(seconds: 5),
                message: l.map(
                  unexpected: (value) => "Error Inesperado",
                  fromServer: (value) => value.message,
                )).show(context);
          }, (r) => null);
          setState(() {
            this.isLoading = false;
          });
          if (error) {
            return;
          }

          //customerLevel
          var customerLevelResponse = await getIt<ICustomerLevelRepoMx>()
              .updateCustomerLevel(CustomerLevelRepository.INVESTING_DONE);

          setState(() {
            this.isLoading = false;
          });

          ExtendedNavigator.rootNavigator.pushNamed(
              Routes.investingTransactionSummaryPageMX,
              arguments: InvestingTransactionSummaryMXArguments(
                  goal: goal,
                  bankTransfer: false,
                  bankTransferValue: widget.bankTransferValue,
                  goals: lstGoals,
                  multiple: multiple,
                  valuesChosen: valuesChosen));
        },
      ),
    );
  }
}
