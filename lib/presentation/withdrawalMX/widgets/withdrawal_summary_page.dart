import 'dart:math';

import 'package:ualet/domain/goals/goal_balance_item.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/domain/withdrawalMX/simulate_transaction_remove_money.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:intl/intl.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/delete_goals_dialog.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/recalculated_goals_dialog.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/warning_debit_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WithdrawalSummaryPage extends HookWidget {
  final List<DashboardGoal> chosenGoals;
  final double chosenAmmount;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final BankInfo chosenAccount;
  final List<double> valuesChosen;
  final bool deleteGoal;
  final bool deleteDebit;
  final bool withdrawalType;
  final List<DebitInfo> goalDebits;

  final formatCurrencyMx = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 2,
      locale: "es");

  NumberFormat formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  formatedNumber(number) {
    var formatCurrency;

    formatCurrency =
    new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

    if (getIt<IEnv>().isColombia()) {
      formatCurrency = new NumberFormat.currency(
          customPattern: "\u00A4#,##0.00\u00A0",
          symbol: "\$",
          decimalDigits: 0,
          locale: "es");
    }

    return formatCurrency.format(number);
  }

  WithdrawalSummaryPage(
      {@required this.chosenGoals,
      @required this.chosenAmmount,
      @required this.withdrawalAll,
      @required this.withdrawalInfo,
      @required this.chosenAccount,
      @required this.valuesChosen,
      this.deleteGoal = false,
      this.deleteDebit = false,
      this.withdrawalType = false,
      this.goalDebits});

  SimulateTransactionRemoveMoney objSimulator =
      SimulateTransactionRemoveMoney.empty();

  NumberFormat formater = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  @override
  Widget build(BuildContext context) {
    /* useEffect(() {
      formatCurrency =
          getIt<IEnv>().isColombia() ? formatCurrency : formatCurrencyMx;
      return null;
    }, const []);*/

    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrency : formatCurrencyMx;

    String obfuscatedAccountNumber =
        "**** ${chosenAccount.accountNumber.substring(chosenAccount.accountNumber.length - 4)}";
    String accountType = "";
    if (chosenAccount.accountTypeId == 1) {
      accountType = S.of(context).accountType1;
    } else if (chosenAccount.accountTypeId == 2) {
      accountType = S.of(context).accountType2;
    } else {
      accountType = S.of(context).accountType1;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<WithdrawalFormBloc>(
            create: (context) => getIt<WithdrawalFormBloc>()
              ..add(WithdrawalFormEvent.getSimulation(chosenAmmount))),
      ],
      child: BlocConsumer<WithdrawalFormBloc, WithdrawalFormState>(
        builder: (context, state) {
          return Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColors.backgroundColor,
              body: SafeArea(
                  child: Stack(
                fit: StackFit.expand,
                children: [
                  LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _iconReturn(),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: AppDimens.layoutMargin,
                                      right: AppDimens.layoutMargin,
                                      top: AppDimens.layoutSpacerXs,
                                      bottom: AppDimens.layoutSpacerXs),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).resumeTitle,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyles.title2.copyWith(
                                          color: AppColors.g25Color,
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.layoutMarginS,
                                      ),
                                      Text(
                                        getIt<IEnv>().isColombia()
                                            ? S
                                                .of(context)
                                                .withdrawalDescriptionCO
                                            : S
                                                .of(context)
                                                .withdrawalDescriptionMX,
                                        style: AppTextStyles.normal1.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.g75Color),
                                      ),
                                      SizedBox(
                                        height: AppDimens.layoutSpacerM,
                                      ),
                                      Container(
                                        height: 135,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.dialogBorderRadius),
                                          shape: BoxShape.rectangle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.1),
                                                offset: Offset(0, 4),
                                                spreadRadius: 0.5,
                                                blurRadius: 8.0)
                                          ],
                                        ),
                                        padding: EdgeInsets.all(
                                            AppDimens.layoutMarginS),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Text(
                                                  S.of(context).withdrawal,
                                                  style: AppTextStyles.normal1
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
                                                ),
                                                Text(
                                                  "${formatedNumber(chosenAmmount)}",
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppDimens.layoutSpacerS,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Text(
                                                  S.of(context).withdrawalFee,
                                                  style: AppTextStyles.normal1
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
                                                ),
                                                Text(
                                                  getIt<IEnv>().isColombia()
                                                      ? "${formatedNumber(-1600)}"
                                                      : "${formatedNumber(-10)}",
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Text(
                                                  S.of(context).withdrawTotal,
                                                  style: AppTextStyles.normal1
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
                                                ),
                                                Text(
                                                  getIt<IEnv>().isColombia()
                                                      ? "${formatedNumber(chosenAmmount - 1600)}"
                                                      : "${formatedNumber(chosenAmmount - 10)}",
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .g75Color),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.layoutSpacerM,
                                      ),
                                      Text(
                                        S.of(context).withdrawalSummaryAccount,
                                        style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g75Color),
                                      ),
                                      SizedBox(
                                        height: AppDimens.layoutSpacerS,
                                      ),
                                      Container(
                                        height: getIt<IEnv>().isColombia()
                                            ? 80
                                            : 110,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            AppDimens.dialogBorderRadius,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(
                                            AppDimens.layoutMarginS),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CachedNetworkImage(
                                              imageUrl: chosenAccount.bankLogo
                                                  .trim()
                                                  .trimRight(),
                                              height: 40,
                                              width: getIt<IEnv>().isColombia()
                                                  ? 150
                                                  : 110,
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(
                                              width: AppDimens.layoutSpacerS,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    accountType,
                                                    style: AppTextStyles
                                                        .caption1
                                                        .copyWith(
                                                            color: AppColors
                                                                .g50Color,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Text(
                                                  obfuscatedAccountNumber,
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .g50Color),
                                                ),
                                                getIt<IEnv>().isColombia()
                                                    ? Container()
                                                    : Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .rfcText,
                                                              style: AppTextStyles
                                                                  .normal2
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .g50Color),
                                                            ),
                                                            Text(
                                                              chosenAccount.rfc,
                                                              style: AppTextStyles
                                                                  .normal2
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .g50Color),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.layoutSpacerM,
                                      ),
                                      Visibility(
                                        visible: objSimulator.goals.length > 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              S.of(context).retiredGoals,
                                              style: AppTextStyles.normal1
                                                  .copyWith(
                                                      color:
                                                          AppColors.g75Color),
                                            ),
                                            SizedBox(
                                              height: AppDimens.layoutSpacerS,
                                            ),
                                            _goalListData(context),
                                            SizedBox(
                                              height: AppDimens.layoutSpacerM,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              _footer(context, state)
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              )));
        },
        listener: (context, state) {
          state.responseSimulation.fold(() {}, (either) {
            either.fold((l) {}, (r) {
              objSimulator = r;
            });
          });

          if (state.confirmedWithdrawal && withdrawalAll) {
            List<DashboardGoal> goals = withdrawalInfo.goals;
            List<DebitInfo> validDebits = withdrawalInfo.debits;
            String goalNames = "";
            int ammount = 0;

            //Validar si el usuario tiene debitos automaticos.
            if (!state.showModalDeleteGoal && validDebits.length > 0) {
              context
                  .bloc<WithdrawalFormBloc>()
                  .add(WithdrawalFormEvent.confirmWithdrawal(false));

              showGeneralDialog(
                context: _scaffoldKey.currentContext,
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: true,
                barrierLabel: "Label",
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (ctx, anim1, anim2) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: WarningDebitDialog(
                      goalNames: goalNames,
                      buttonAcceptText:
                          S.of(context).withdrawalSummaryDialogButtonKeep,
                      buttonRejectText:
                          S.of(context).withdrawalSummaryDialogButtonDelete,
                      reject: () {
                        getIt<IFireBaseEventLogger>()
                            .withdrallMoneyDeleteDebit();

                        //Eliminar débitos
                        context
                            .bloc<WithdrawalFormBloc>()
                            .add(WithdrawalFormEvent.debitOptionChanged(1));
                        Navigator.pop(context);
                        context.bloc<WithdrawalFormBloc>().add(
                            WithdrawalFormEvent.showModalDeleteGoalChanged(
                                true));
                      },
                      accept: () {
                        getIt<IFireBaseEventLogger>().withdrallMoneyKeepDebit();

                        context
                            .bloc<WithdrawalFormBloc>()
                            .add(WithdrawalFormEvent.debitOptionChanged(2));
                        // Navigator.pop(context);
                      },
                      multiple: ammount > 1,
                    ),
                  );
                },
                transitionBuilder: (ctx, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0.25))
                        .animate(anim1),
                    child: child,
                  );
                },
              );
            } else {
              context
                  .bloc<WithdrawalFormBloc>()
                  .add(WithdrawalFormEvent.showModalDeleteGoalChanged(true));
            }
          }

          //Modal de eliminar metas.
          if (state.showModalDeleteGoal || state.showModalReCalculateDebits) {
            List<DashboardGoal> goals = withdrawalInfo.goals;

            if (goals.length > 0) {
              showGeneralDialog(
                context: _scaffoldKey.currentContext,
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: false,
                barrierLabel: "Label",
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (ctx, anim1, anim2) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: DeleteGoalsDialog(
                        buttonAcceptText:
                            S.of(context).withdrawalGoalsDeleteButtonKeep,
                        buttonRejectText:
                            S.of(context).withdrawalGoalsDeleteButtonDelete,
                        reject: () async {
                          getIt<IFireBaseEventLogger>()
                              .withdrallMoneyDeleteGoals();

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('deleteGoal', true);

                          context
                              .bloc<WithdrawalFormBloc>()
                              .add(WithdrawalFormEvent.goalOptionChanged(2));
                        },
                        accept: () {
                          getIt<IFireBaseEventLogger>()
                              .withdrallMoneyKeepGoals();

                          //Mantener Metas
                          context
                              .bloc<WithdrawalFormBloc>()
                              .add(WithdrawalFormEvent.goalOptionChanged(1));
                        }),
                  );
                },
                transitionBuilder: (ctx, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0.29))
                        .animate(anim1),
                    child: child,
                  );
                },
              );
            } else {
              context
                  .bloc<WithdrawalFormBloc>()
                  .add(WithdrawalFormEvent.goalOptionChanged(1));
            }
          } else

          //Recalcular débitos.
          if (state.debitOptions == 2) {
            context
                .bloc<WithdrawalFormBloc>()
                .add(WithdrawalFormEvent.goalOptionChanged(2));
          } else

          //Retiro parcial no aplican los pop ups.
          if (state.confirmedWithdrawal && !withdrawalAll) {
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
              Routes.sendOTPWithdrawalPageMX,
              arguments: SendOTPWithdrawalPageArguments(
                chosenGoals: chosenGoals,
                chosenValues: valuesChosen,
                chosenAmmount: chosenAmmount,
                withdrawalAll: withdrawalAll,
                withdrawalInfo: withdrawalInfo,
                chosenAccount: chosenAccount,
              ),
            );
          }

          //Enviar el otp.
          if (state.goalOptions == 1 || state.goalOptions == 2) {
            ExtendedNavigator.rootNavigator
                .popUntil(ModalRoute.withName(Routes.withdrawalSummaryPageMX));
            ExtendedNavigator.rootNavigator.pushReplacementNamed(
              Routes.sendOTPWithdrawalPageMX,
              arguments: SendOTPWithdrawalPageArguments(
                  chosenGoals: chosenGoals,
                  chosenValues: valuesChosen,
                  chosenAmmount: chosenAmmount,
                  withdrawalAll: withdrawalAll,
                  withdrawalInfo: withdrawalInfo,
                  chosenAccount: chosenAccount,
                  isValidDeleteDebit: state.debitOptions,
                  isValidDeleteGoal: state.goalOptions,
                  isValidReCalculateDebits: state.showModalReCalculateDebits),
            );
          }
        },
      ),
    );
  }

  Widget _goalListData(context) {
    return Container(
      child: Column(
        children: objSimulator.goals.map((element) {
          var index = objSimulator.goals.indexOf(element);
          GoalBalanceItem goalBalance = element;
          double value = goalBalance.transactionAmount;

          var parser = EmojiParser();
          var setEmoji = parser.info('${goalBalance.emoji}');
          var nameEmoji = setEmoji.full;

          return _returnDataGoal(
              goalBalance, value, setEmoji, nameEmoji, value, 0);
        }).toList(),
      ),
    );
  }

  Widget _returnDataGoal(
    GoalBalanceItem goal,
    double value,
    Emoji setEmoji,
    dynamic nameEmoji,
    double newAmmount,
    double newPercentage,
  ) {
    var parser = EmojiParser();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius:
                  BorderRadius.circular(AppDimens.dialogBorderRadius)),
          padding: EdgeInsets.all(AppDimens.layoutMarginS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  goal.id > 0
                      ? Text(
                          parser.emojify(nameEmoji),
                          style: TextStyle(fontSize: 40),
                        )
                      : Image.asset(
                          AppImages.appIcon,
                          height: 40.0,
                        ),
                  SizedBox(
                    width: AppDimens.layoutSpacerM,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${goal.nameGoal}",
                        style: AppTextStyles.caption1
                            .copyWith(color: AppColors.g50Color),
                      ),
                      Text(
                        "${formatedNumber(goal.transactionAmount)}",
                        style: AppTextStyles.caption2
                            .copyWith(color: AppColors.g50Color),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
      ],
    );
  }

  Widget _iconReturn() {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.layoutSpacerS, top: AppDimens.layoutSpacerS),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: AppDimens.buttonBack.height,
        ),
        onPressed: () {
          ExtendedNavigator.rootNavigator.pop();
        },
      ),
    );
  }

  Padding _footer(BuildContext context, WithdrawalFormState state) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerM,
      ),
      child: PrimaryButton(
        text: S.of(context).withdrawalSummaryButton,
        action: () {
          getIt<IFireBaseEventLogger>().withdrallMoneyConfirm();

          context
              .bloc<WithdrawalFormBloc>()
              .add(WithdrawalFormEvent.confirmWithdrawal(true));
        },
        enabled: true,
      ),
    );
  }

  confirmdebit(context) {
    //Retiro Total
    if (withdrawalType) {
      context
          .bloc<WithdrawalFormBloc>()
          .add(WithdrawalFormEvent.confirmWithdrawal(true));
    } else {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.sendOTPWithdrawalPageMX,
        arguments: SendOTPWithdrawalPageArguments(
            chosenGoals: chosenGoals,
            chosenAmmount: chosenAmmount,
            chosenValues: valuesChosen,
            withdrawalAll: withdrawalAll,
            withdrawalInfo: withdrawalInfo,
            chosenAccount: chosenAccount,
            isValidDeleteGoal: 0,
            isValidDeleteDebit: 0,
            isValidReCalculateDebits: false),
      );
    }
  }

  int recalculate(DashboardGoal goal) {
    var valueRentability = 0.0;
    double rentability = 0.08;
    var fee = goal.fee != 0 ? goal.fee : 1;
    switch (goal.periodicity) {
      case 1:
        valueRentability = rentability / 24;
        break;
      case 2:
        valueRentability = rentability / 12;
        break;
      case 3:
        valueRentability = rentability / 4;
        break;
      default:
    }
    var valGoal = 0;
    var valuePrev = ((log(1 + (valGoal * valueRentability) / fee)) /
        (log(1 + valueRentability)));
    int newMonths;
    switch (goal.periodicity) {
      case 2:
        newMonths = (valuePrev).toDouble().round() < 1
            ? 1
            : (valuePrev).toDouble().round();
        break;
      case 3:
        newMonths = (valuePrev * 3).toDouble().round() < 1
            ? 1
            : (valuePrev * 3).toDouble().round();
        break;
      case 1:
        newMonths = (valuePrev / 2).toDouble().round() < 1
            ? 1
            : (valuePrev / 2).toDouble().round();
        break;
      default:
    }

    return newMonths;
  }
}
