import 'package:ualet/application/withdrawalMX/withdrawal_bloc.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:ualet/router/router.gr.dart';

// ignore: must_be_immutable
class ChooseAccountPage extends HookWidget {
  final List<DashboardGoal> chosenGoals;
  final DashboardGoal chosenGoal;
  final double chosenAmmount;
  final bool withdrawalAll;
  final WithdrawalInfo withdrawalInfo;
  final List<double> chosenValues;
  final bool deleteGoal;
  final bool deleteDebit;
  final bool editGoal;
  final bool withdrawalType;
  final List<DebitInfo> goalDebits;
  final bool isFormDeleteGoal;
  final List<BankInfo> banksInfoDebits;
  WithdrawalInfo info;

  ChooseAccountPage(
      {@required this.withdrawalInfo,
      @required this.withdrawalAll,
      @required this.chosenAmmount,
      @required this.chosenGoals,
      @required this.chosenGoal,
      @required this.chosenValues,
      this.deleteGoal = false,
      this.deleteDebit = false,
      this.editGoal = false,
      this.withdrawalType = false,
      this.goalDebits,
      this.banksInfoDebits,
      this.isFormDeleteGoal = false});

  @override
  Widget build(BuildContext context) {
    List<BankInfo> filteredBanks = [];

    try {
      if (withdrawalInfo.banksInfoDebits != null) {
        if (withdrawalInfo.banksInfoDebits.length == 0) {
          filteredBanks = withdrawalInfo.banksInfo;
        } else {
          filteredBanks = banksInfoDebits != null
              ? banksInfoDebits
              : withdrawalInfo.banksInfoDebits;
        }
      }
    } catch (e) {}

    return MultiBlocProvider(
      providers: [
        BlocProvider<WithdrawalFormBloc>(
            create: (context) => getIt<WithdrawalFormBloc>()),
        BlocProvider<WithdrawalBloc>(
          create: (context) =>
              getIt<WithdrawalBloc>()..add(WithdrawalEvent.getItems(true)),
        )
      ],
      child: editGoal
          ? BlocBuilder<WithdrawalBloc, WithdrawalState>(
              builder: (context1, state1) {
                List<DashboardGoal> newgoalsChosen = [];
                List<double> newValuesChosen = [];
                newgoalsChosen.add(chosenGoal);
                newValuesChosen.add(chosenAmmount);
                return state1.map(
                    initial: (_) => Container(),
                    loadInProgress: (_) {
                      print("LOAD IN PROGRESSSSS");
                      return Stack(
                        children: <Widget>[
                          Container(
                            color: AppColors.backgroundColor,
                          ),
                          LoadingInProgressOverlay(isLoading: true),
                        ],
                      );
                    },
                    loadSuccess: (data) {
                      print("LOAD WAS SUCCESSSSS");
                      var info = data.info;
                      List<BankInfo> infoBanksFiltered = [];
                      if (data.info.debits.length == 0) {
                        infoBanksFiltered = data.info.banksInfo;
                      } else {
                        List<int> infoDebitsIds = data.info.debits
                            .map<int>((e) => e.bankAccountId)
                            .toList();
                        data.info.banksInfo.forEach((element) {
                          if (infoDebitsIds.contains(element.bankAccountId)) {
                            infoBanksFiltered.add(element);
                          }
                        });
                      }

                      return BlocBuilder<WithdrawalFormBloc,
                          WithdrawalFormState>(
                        builder: (context, state) {
                          return Scaffold(
                            backgroundColor: AppColors.backgroundColor,
                            bottomNavigationBar: Padding(
                              padding: EdgeInsets.only(
                                left: AppDimens.layoutMarginM,
                                right: AppDimens.layoutMarginM,
                                bottom: AppDimens.layoutSpacerL,
                              ),
                              child: PrimaryButton(
                                text: S.of(context).nextButton,
                                action: () =>
                                    ExtendedNavigator.rootNavigator.pushNamed(
                                  Routes.withdrawalSummaryPageMX,
                                  arguments: WithdrawalSummaryPageArguments(
                                      chosenGoals: newgoalsChosen,
                                      chosenAmmount: chosenAmmount,
                                      withdrawalAll: withdrawalAll,
                                      withdrawalInfo:
                                          editGoal ? info : withdrawalInfo,
                                      chosenAccount: state.bankChosen,
                                      valuesChosen: newValuesChosen,
                                      deleteGoal: deleteGoal,
                                      deleteDebit: deleteDebit,
                                      withdrawalType: withdrawalType,
                                      goalDebits: goalDebits),
                                ),
                                enabled: state.bankChosen.bankId != 0,
                              ),
                            ),
                            body: SafeArea(
                              child: ListView(
                                primary: false,
                                padding: EdgeInsets.only(
                                    left: AppDimens.layoutMargin,
                                    right: AppDimens.layoutMargin,
                                    top: AppDimens.layoutSpacerXs,
                                    bottom: AppDimens.layoutSpacerXs),
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                    ),
                                    color: AppColors.primaryColor,
                                    alignment: Alignment.topLeft,
                                    tooltip: "Volver",
                                    onPressed: () =>
                                        ExtendedNavigator.rootNavigator.pop(),
                                  ),
                                  Text(
                                    S.of(context).withdrawalTitle,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.title2.copyWith(
                                      color: AppColors.g25Color,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimens.layoutMarginS,
                                  ),
                                  Text(
                                    S
                                        .of(context)
                                        .withdrawalChooseAccountDescription,
                                    style: AppTextStyles.normal1.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.g75Color),
                                  ),
                                  SizedBox(
                                    height: AppDimens.layoutSpacerL,
                                  ),
                                  Container(
                                    height: withdrawalInfo.banksInfo.length > 0
                                        ? 400
                                        : 0,
                                    child: ListView.builder(
                                      primary: false,
                                      itemCount: editGoal
                                          ? infoBanksFiltered.length
                                          : filteredBanks.length,
                                      itemBuilder: (context, index) {
                                        BankInfo bank = editGoal
                                            ? infoBanksFiltered[index]
                                            : filteredBanks[index];
                                        String obfuscatedAccountNumber =
                                            "**** ${bank.accountNumber.substring(bank.accountNumber.length - 4)}";
                                        String accountType = "";
                                        if (bank.accountTypeId == 1) {
                                          accountType =
                                              S.of(context).accountType1;
                                        } else if (bank.accountTypeId == 2) {
                                          accountType =
                                              S.of(context).accountType2;
                                        } else {
                                          accountType =
                                              S.of(context).accountType1;
                                        }
                                        return InkWell(
                                          onTap: () => {
                                            //Cuenta Pre-Inscrita (Pendiente)
                                            if (bank.status != 2)
                                              {
                                                context
                                                    .bloc<WithdrawalFormBloc>()
                                                    .add(
                                                      WithdrawalFormEvent
                                                          .chooseAccount(bank),
                                                    ),
                                                if (state.bankChosen
                                                        .bankAccountId ==
                                                    0)
                                                  {
                                                    showGeneralDialog(
                                                        context: context,
                                                        barrierColor: Colors
                                                            .black
                                                            .withOpacity(0.4),
                                                        barrierDismissible:
                                                            true,
                                                        barrierLabel: "Label",
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    600),
                                                        pageBuilder: (ctx,
                                                            anim1, anim2) {
                                                          return Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: CustomDialog(
                                                              buttonText: S
                                                                  .of(context)
                                                                  .isValidPopUpAccountPendingButton,
                                                              icon: Icons
                                                                  .add_to_home_screen,
                                                              iconColor: AppColors
                                                                  .successColor,
                                                              title: S
                                                                  .of(context)
                                                                  .isValidPopUpAccountPendingTitleR,
                                                              description: S
                                                                  .of(context)
                                                                  .isValidPopUpAccountPendingDescription,
                                                              buttonAction: () =>
                                                                  ExtendedNavigator
                                                                      .rootNavigator
                                                                      .pop(),
                                                            ),
                                                          );
                                                        },
                                                        transitionBuilder: (ctx,
                                                            anim1,
                                                            anim2,
                                                            child) {
                                                          return SlideTransition(
                                                            position: Tween(
                                                                    begin:
                                                                        Offset(
                                                                            0,
                                                                            1),
                                                                    end: Offset(
                                                                        0,
                                                                        0.28))
                                                                .animate(anim1),
                                                            child: child,
                                                          );
                                                        }),
                                                  }
                                              }
                                            else
                                              {
                                                context
                                                    .bloc<WithdrawalFormBloc>()
                                                    .add(
                                                      WithdrawalFormEvent
                                                          .chooseAccount(bank),
                                                    ),
                                              }
                                          },
                                          splashColor: Colors.transparent,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    AppDimens
                                                        .dialogBorderRadius,
                                                  ),
                                                  border: Border.fromBorderSide(
                                                    BorderSide(
                                                        color: state.bankChosen
                                                                    .bankAccountId ==
                                                                bank
                                                                    .bankAccountId
                                                            ? AppColors
                                                                .successColor
                                                            : AppColors
                                                                .whiteColor),
                                                  ),
                                                ),
                                                padding: EdgeInsets.only(
                                                    right:
                                                        AppDimens.layoutMarginS,
                                                    top:
                                                        AppDimens.layoutMarginS,
                                                    bottom: AppDimens
                                                        .layoutMarginS),
                                                child: Theme(
                                                  data: ThemeData(
                                                      unselectedWidgetColor:
                                                          AppColors.g25Color),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Radio(
                                                        value:
                                                            bank.bankAccountId,
                                                        groupValue: state
                                                            .bankChosen
                                                            .bankAccountId,
                                                        activeColor: AppColors
                                                            .successColor,
                                                        onChanged: (value) =>
                                                            context
                                                                .bloc<
                                                                    WithdrawalFormBloc>()
                                                                .add(
                                                                  WithdrawalFormEvent
                                                                      .chooseAccount(
                                                                          bank),
                                                                ),
                                                      ),
                                                      CachedNetworkImage(
                                                          width: 80,
                                                          imageUrl: bank
                                                              .bankLogo
                                                              .trim()
                                                              .trimRight()),
                                                      SizedBox(
                                                        width: AppDimens
                                                            .layoutSpacerS,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Text(
                                                            accountType,
                                                            style: AppTextStyles
                                                                .caption1
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g50Color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          Text(
                                                            obfuscatedAccountNumber,
                                                            style: AppTextStyles
                                                                .normal2
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .g50Color),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimens.layoutSpacerS,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        withdrawalInfo.banksInfoDebits.length ==
                                            0,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      onTap: () => ExtendedNavigator
                                          .rootNavigator
                                          .pushNamed(
                                        Routes.investingAddAccountPage,
                                        arguments:
                                            InvestingAddAccountPageArguments(
                                                isWithdrawal: true,
                                                info: info,
                                                accArgs:
                                                    ChooseAccountPageArguments(
                                                        deleteDebit:
                                                            deleteDebit,
                                                        deleteGoal: deleteGoal,
                                                        editGoal: editGoal,
                                                        withdrawalInfo:
                                                            withdrawalInfo,
                                                        withdrawalAll:
                                                            withdrawalAll,
                                                        chosenAmmount:
                                                            chosenAmmount,
                                                        chosenGoals:
                                                            chosenGoals,
                                                        chosenGoal: chosenGoal,
                                                        chosenValues:
                                                            chosenValues,
                                                        banksInfoDebits: [])),
                                      ),
                                      child: Text(
                                        S
                                            .of(context)
                                            .registerBankAccountInkWell,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.normal1.copyWith(
                                          color: AppColors.primaryColor,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    loadFailure: (failure) {
                      ToastHelper.createError(
                              message: failure.failure.map(
                                  unexpected: (_) => 'Unexpected',
                                  fromServer: (failure) => failure.message))
                          .show(context);
                      Future.delayed(Duration(seconds: 4), () {
                        ExtendedNavigator.rootNavigator.pop();
                      });
                      return Scaffold(
                        backgroundColor: AppColors.backgroundColor,
                      );
                    });
              },
            )
          : BlocBuilder<WithdrawalFormBloc, WithdrawalFormState>(
              builder: (context, state) {
                List<DashboardGoal> goals = [];
                List<double> values = [];
                for (int i = 0; i < chosenGoals.length; i++) {
                  if (chosenGoals[i].id != 0) {
                    goals.add(chosenGoals[i]);
                    values.add(chosenValues[i]);
                  }
                }

                if (filteredBanks.length == 0) {
                  ExtendedNavigator.rootNavigator.pushReplacementNamed(
                      Routes.noAccountPage,
                      arguments: NoAccountPageArguments(
                          isWithdrawal: true,
                          info: info,
                          chosenGoals: chosenGoals,
                          goals: goals,
                          chosenAmmount: chosenAmmount,
                          withdrawalAll: withdrawalAll,
                          withdrawalInfo: withdrawalInfo,
                          editGoal: editGoal,
                          deleteGoal: deleteGoal,
                          deleteDebit: deleteDebit,
                          values: values,
                          goal: DashboardGoal.empty(),
                          accArgs: ChooseAccountPageArguments(
                              deleteDebit: deleteDebit,
                              deleteGoal: deleteGoal,
                              editGoal: editGoal,
                              withdrawalInfo: withdrawalInfo,
                              withdrawalAll: withdrawalAll,
                              chosenAmmount: chosenAmmount,
                              chosenGoals: chosenGoals,
                              chosenGoal: chosenGoal,
                              chosenValues: chosenValues,
                              banksInfoDebits: [])));
                }

                return Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  bottomNavigationBar: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimens.layoutMarginM,
                        right: AppDimens.layoutMarginM,
                        bottom: AppDimens.layoutSpacerL,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: getIt<IEnv>().isColombia() &&
                                withdrawalInfo.banksInfoDebits.length == 0,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: RaisedButton(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: AppColors.primaryColor)),
                                    color: Colors.white,
                                    onPressed: () {
                                      var chosenGoals2 = goals.length == 0
                                          ? [chosenGoal]
                                          : goals;
                                      var valuesChosen = goals.length == 0
                                          ? [chosenAmmount]
                                          : values;
                                      return ExtendedNavigator.rootNavigator
                                          .pushNamed(
                                        Routes.investingAddAccountPage,
                                        arguments:
                                            InvestingAddAccountPageArguments(
                                                isWithdrawal: true,
                                                info: info,
                                                accArgs:
                                                    ChooseAccountPageArguments(
                                                        deleteDebit:
                                                            deleteDebit,
                                                        deleteGoal: deleteGoal,
                                                        editGoal: editGoal,
                                                        withdrawalInfo:
                                                            withdrawalInfo,
                                                        withdrawalAll:
                                                            withdrawalAll,
                                                        chosenAmmount:
                                                            chosenAmmount,
                                                        chosenGoals:
                                                            chosenGoals2,
                                                        chosenGoal: chosenGoal,
                                                        chosenValues:
                                                            valuesChosen)),
                                      );
                                    },
                                    child: Text(
                                      S.of(context).registerBankAccountInkWell,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.normal1.copyWith(
                                        color: AppColors.primaryColor,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          PrimaryButton(
                            text: S.of(context).nextButton,
                            action: () {
                              var chosenGoals =
                                  goals.length == 0 ? [chosenGoal] : goals;
                              var valuesChosen =
                                  goals.length == 0 ? [chosenAmmount] : values;

                              return ExtendedNavigator.rootNavigator.pushNamed(
                                Routes.withdrawalSummaryPageMX,
                                arguments: WithdrawalSummaryPageArguments(
                                    chosenGoals: chosenGoals,
                                    chosenAmmount: chosenAmmount,
                                    withdrawalAll: withdrawalAll,
                                    withdrawalInfo: withdrawalInfo,
                                    chosenAccount: state.bankChosen,
                                    valuesChosen: valuesChosen,
                                    deleteGoal: deleteGoal,
                                    deleteDebit: deleteDebit,
                                    withdrawalType: withdrawalType,
                                    goalDebits: goalDebits),
                              );
                            },
                            enabled: state.bankChosen.bankId != 0,
                          ),
                        ],
                      )),
                  body: SafeArea(
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          right: AppDimens.layoutMargin,
                          top: AppDimens.layoutSpacerXs,
                          bottom: AppDimens.layoutSpacerXs),
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: AppColors.primaryColor,
                          alignment: Alignment.topLeft,
                          tooltip: "Volver",
                          onPressed: () =>
                              ExtendedNavigator.rootNavigator.pop(context),
                        ),
                        Text(
                          S.of(context).withdrawalTitle,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.title2.copyWith(
                            color: AppColors.g25Color,
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutMarginS,
                        ),
                        Text(
                          S.of(context).withdrawalChooseAccountDescription,
                          style: AppTextStyles.normal1.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.g75Color),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        Container(
                          height: 350,
                          child: ListView.builder(
                            primary: false,
                            itemCount: filteredBanks.length,
                            itemBuilder: (context, index) {
                              BankInfo bank = filteredBanks[index];
                              String obfuscatedAccountNumber =
                                  "**** ${bank.accountNumber.substring(bank.accountNumber.length - 4)}";
                              String accountType = "";
                              if (bank.accountTypeId == 1) {
                                accountType = S.of(context).accountType1;
                              } else if (bank.accountTypeId == 2) {
                                accountType = S.of(context).accountType2;
                              } else {
                                accountType = S.of(context).accountType1;
                              }
                              return InkWell(
                                onTap: () => {
                                  //Cuenta Pre-Inscrita (Pendiente)
                                  if (bank.status != 2)
                                    {
                                      context.bloc<WithdrawalFormBloc>().add(
                                            WithdrawalFormEvent.chooseAccount(
                                                bank),
                                          ),
                                      if (state.bankChosen.bankAccountId == 0)
                                        {
                                          showGeneralDialog(
                                              context: context,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.4),
                                              barrierDismissible: true,
                                              barrierLabel: "Label",
                                              transitionDuration:
                                                  Duration(milliseconds: 600),
                                              pageBuilder: (ctx, anim1, anim2) {
                                                return Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: CustomDialog(
                                                    buttonText: S
                                                        .of(context)
                                                        .isValidPopUpAccountPendingButton,
                                                    icon: Icons
                                                        .add_to_home_screen,
                                                    iconColor:
                                                        AppColors.successColor,
                                                    title: S
                                                        .of(context)
                                                        .isValidPopUpAccountPendingTitleR,
                                                    description: S
                                                        .of(context)
                                                        .isValidPopUpAccountPendingDescription,
                                                    buttonAction: () =>
                                                        ExtendedNavigator
                                                            .rootNavigator
                                                            .pop(),
                                                  ),
                                                );
                                              },
                                              transitionBuilder:
                                                  (ctx, anim1, anim2, child) {
                                                return SlideTransition(
                                                  position: Tween(
                                                          begin: Offset(0, 1),
                                                          end: Offset(0, 0.28))
                                                      .animate(anim1),
                                                  child: child,
                                                );
                                              }),
                                        }
                                    }
                                  else
                                    {
                                      context.bloc<WithdrawalFormBloc>().add(
                                            WithdrawalFormEvent.chooseAccount(
                                                bank),
                                          ),
                                    }
                                },
                                splashColor: Colors.transparent,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(
                                          AppDimens.dialogBorderRadius,
                                        ),
                                        border: Border.fromBorderSide(
                                          BorderSide(
                                              color: state.bankChosen
                                                          .bankAccountId ==
                                                      bank.bankAccountId
                                                  ? AppColors.successColor
                                                  : AppColors.whiteColor),
                                        ),
                                      ),
                                      padding: EdgeInsets.only(
                                          right: AppDimens.layoutMarginS,
                                          top: AppDimens.layoutMarginS,
                                          bottom: AppDimens.layoutMarginS),
                                      child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                AppColors.g25Color),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              value: bank.bankAccountId,
                                              groupValue: state
                                                  .bankChosen.bankAccountId,
                                              activeColor:
                                                  AppColors.successColor,
                                              onChanged: (value) => context
                                                  .bloc<WithdrawalFormBloc>()
                                                  .add(
                                                    WithdrawalFormEvent
                                                        .chooseAccount(bank),
                                                  ),
                                            ),
                                            CachedNetworkImage(
                                                width: 80,
                                                imageUrl: bank.bankLogo
                                                    .trim()
                                                    .trimRight()),
                                            SizedBox(
                                              width: AppDimens.layoutSpacerS,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  accountType,
                                                  style: AppTextStyles.caption1
                                                      .copyWith(
                                                          color: AppColors
                                                              .g50Color,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                Text(
                                                  obfuscatedAccountNumber,
                                                  style: AppTextStyles.normal2
                                                      .copyWith(
                                                          color: AppColors
                                                              .g50Color),
                                                ),
                                                Text(
                                                  bank.stateName,
                                                  style: AppTextStyles.caption2
                                                      .copyWith(
                                                    color: bank.status == 2
                                                        ? AppColors.successColor
                                                        : AppColors.infoColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: AppDimens.layoutSpacerS,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerS,
                                    ),
                                    SizedBox(
                                      height: AppDimens.layoutSpacerS,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
