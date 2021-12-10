import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/investing/widgets/success_dialog_account.dart';

import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';

class InvestingSuccessPage extends StatefulWidget {
  final DashboardGoal goal;
  final BankAccountItem item;
  final bool isFirstInvestment;
  final double investment;
  final Map successData;
  final int typePopUp;

  const InvestingSuccessPage(
      {Key key,
      @required this.goal,
      @required this.item,
      this.investment,
      this.isFirstInvestment = false,
      this.successData,
      this.typePopUp})
      : super(key: key);

  @override
  _InvestingSuccessPageState createState() => _InvestingSuccessPageState(
      goal, item, isFirstInvestment, investment, successData, typePopUp);
}

class _InvestingSuccessPageState extends State<InvestingSuccessPage> {
  final DashboardGoal goal;
  final BankAccountItem item;
  final bool isFirstInvestment;
  final double investment;
  final Map successData;
  final int typePopUp;

  bool isLoading = false;

  _InvestingSuccessPageState(this.goal, this.item, this.isFirstInvestment,
      this.investment, this.successData, this.typePopUp);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
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
                          height: 40,
                        ),
                        Row(
                          children: [_movimientosEnProcesoTitle(context)],
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        _movimientoItem(context, goal, 0),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        _buttonNext(context),
                      ],
                    )),
              ),
              LoadingInProgressOverlay(isLoading: isLoading),
            ],
          ),
        ));
  }

  Widget _movimientoItem(
      BuildContext context, DashboardGoal goal, double value) {
    final coFormatter = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es");
    DateTime date = DateTime.now();
    return Column(
      children: [
        successData["type"] == 1
            ? Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(AppDimens.layoutSpacerM),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppDimens.dialogBorderRadius))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(S.of(context).registerBankAccount,
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color)),
                        Text("${date.day}/${date.month}/${date.year}",
                            style: AppTextStyles.normal4),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            "****${successData["data"].replaceAll(' ', '').substring(successData["data"].replaceAll(' ', '').length - 4)}",
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color)),
                        Text(S.of(context).myGoalMovementsAwaiting,
                            style: AppTextStyles.caption2
                                .copyWith(color: AppColors.infoColor)),
                      ],
                    )
                  ],
                ),
              )
            : Container(),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(AppDimens.layoutSpacerM),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimens.dialogBorderRadius))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(S.of(context).addDebitMoney,
                      style: AppTextStyles.normal2
                          .copyWith(color: AppColors.g75Color)),
                  Text("${date.day}/${date.month}/${date.year}",
                      style: AppTextStyles.normal4),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("${coFormatter.format(goal.fee + (950))}",
                      style: AppTextStyles.normal2
                          .copyWith(color: AppColors.g75Color)),
                  Text(S.of(context).myGoalMovementsAwaiting,
                      style: AppTextStyles.caption2
                          .copyWith(color: AppColors.infoColor)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _movimientosEnProcesoTitle(BuildContext context) {
    return Text(S.of(context).movementsInProgress,
        style: AppTextStyles.subtitle2.copyWith(
          color: AppColors.g75Color,
        ));
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
        successData["type"] == 1
            ? S.of(context).bankTransferAlmostDescriptionSuccessDebit
            : "${S.of(context).bankTransferAlmostDescriptionSuccess}",
        style: AppTextStyles.normal4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _overviewContainer(BuildContext context) {
    final coFormatter = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es");
    String fee = coFormatter.format(goal.fee);
    String total = coFormatter.format(goal.fee + 950);
    return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.dialogBorderRadius))),
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).debitValue, style: AppTextStyles.normal4),
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
                Text(S.of(context).withdrawalFee, style: AppTextStyles.normal4),
                Text("\$950",
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

  _showPopUp(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return WillPopScope(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SuccessDialogAccount(
                typePopUp: typePopUp,
                type: successData["type"],
                acceptCallBack: () async {
                  ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.homePage,
                    (route) => route.isFirst,
                  );
                },
                undoCallback: () {
                  ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.homePage,
                    (route) => route.isFirst,
                  );
                }),
          ),
          onWillPop: () {}
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.2)).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _buttonNext(BuildContext context) {
    final coFormatter = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es");
    String total = coFormatter.format(goal.fee + 950);

    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).finalizeInvestment,
        action: () async {
          //  getIt<IFireBaseEventLogger>().personalSuccessfulVerification();

          getIt<IFireBaseEventLogger>().investmentDebitResume({
            "Price": "$total",
            "Currency": "COP",
            "periodicidad": "${goal.periodicity}"
          });

          getIt<IAppsFlyerEventLogger>().logEvent(
              AFEvents.EVENT_INVEST_DBT_CONTINUE_RESUME, {
            "Price": "$total",
            "Currency": "COP",
            "periodicidad": "${goal.periodicity}"
          });

          setState(() {
            isLoading = true;
          });

          await getIt<IFireBaseEventLogger>().myDebitsEditConfirm();

          if (isFirstInvestment) {
            await getIt<IAppsFlyerEventLogger>()
                .logEvent(AFEvents.VERIFICACION_EXITO, {});
          }
          var response = await getIt<IInvestingRepository>().addScheduledDebit(
            item,
            goal,
            false,
            [],
            investment,
          );

          response.fold((l) {
            setState(() {
              isLoading = false;
            });
            ToastHelper.createError(
                duration: Duration(seconds: 5),
                message: l.map(
                    unexpected: (_) => "Error Inesperado",
                    fromServer: (e) => e.message)).show(context);
          }, (r) {
            setState(() {
              isLoading = false;
              _showPopUp(context);
            });
          });
        },
      ),
    );
  }
}
