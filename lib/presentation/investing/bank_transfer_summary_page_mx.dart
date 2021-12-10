import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
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
import 'package:ualet/presentation/investing/widgets/bank_transfer_dialog_mx.dart';
import 'package:ualet/router/router.gr.dart';

class BankTransferSummaryPageMX extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final BankAccountItem accountItem;
  final formatCurrency = NumberFormaters.mxFormater;

  BankTransferSummaryPageMX({
    @required this.accountItem,
    @required this.multiple,
    @required this.goals,
    @required this.valuesChosen,
    @required this.goal,
    @required this.bankTransfer,
    @required this.bankTransferValue,
  });

  @override
  Widget build(BuildContext context) {
    double value = 0;
    value = bankTransferValue;
    double total = (value + Values.bankTransferCost);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppDimens.layoutMarginM,
              right: AppDimens.layoutMarginM,
              bottom: AppDimens.layoutSpacerL,
            ),
            child: PrimaryButton(
              text: S.of(context).continueButton,
              action: () {
                _showPopup(context, value);
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.layoutMarginS),
                  child: Text(
                    S.of(context).bankTransferSummaryTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title2
                        .copyWith(color: AppColors.successColor),
                  ),
                ),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                Container(
                  height: 135,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius:
                        BorderRadius.circular(AppDimens.dialogBorderRadius),
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
                            style: AppTextStyles.normal1
                                .copyWith(color: AppColors.g75Color),
                          ),
                          Text(
                            "${formatCurrency.format(value)}",
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color),
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
                            style: AppTextStyles.normal1
                                .copyWith(color: AppColors.g75Color),
                          ),
                          Text(
                            "\$10.00",
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color),
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
                            style: AppTextStyles.normal1
                                .copyWith(color: AppColors.g75Color),
                          ),
                          Text(
                            "${formatCurrency.format(total)}",
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {});
  }

  _showPopup(context, value) async {
    var date = DateTime.now().add(Duration(days: 3));
    if (date.weekday == 7)
      date = date.add(Duration(days: 1));
    else if (date.weekday == 6) date = date.add(Duration(days: 2));
    var otherGoals = goals
        .map<DashboardGoal>((e) => e.copyWith(
              periodicity: 4,
              created: date,
            ))
        .toList();
    showDialog(
        context: context,
        builder: (BuildContext context) =>LoadingInProgressOverlay(isLoading: true)
        );
    var response = await getIt<IInvestingRepositoryMx>().addScheduledDebit(
        accountItem,
        goal.copyWith(periodicity: 4, created: date),
        multiple,
        otherGoals,
        value);
    // var response = await getIt<IInvestingRepositoryMx>()
    //     .generateSpei(value, goals, valuesChosen);
    var error = false;
    ExtendedNavigator.rootNavigator.pop();
    response.fold((l) {
      error = true;
      ToastHelper.createError(
          duration: Duration(seconds: 5),
          message: l.map(
            unexpected: (value) => "Error Inesperado",
            fromServer: (value) => value.message,
          )).show(context);
    }, (r) {});
    if (error) return;
    ExtendedNavigator.rootNavigator.pushNamed(
      Routes.investingTransactionSummaryPageMX,
      arguments: InvestingTransactionSummaryMXArguments(
        bankTransfer: bankTransfer,
        bankTransferValue: value,
        goal: goal,
        multiple: multiple,
        goals: goals,
        valuesChosen: valuesChosen,
      ),
    );
  }
}
