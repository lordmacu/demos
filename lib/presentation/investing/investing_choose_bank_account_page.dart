import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page_col.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

import '../../injection.dart';

class InvestingChooseAccount extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;

  bool chooseBank = false;

  InvestingChooseAccount({
    this.goal,
    this.bankTransfer = false,
    this.investment = 0,
  });

  GoToInvest(state) {
    ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.investingSuccessPage,
        arguments: InvestingSuccessPageArguments(
            goal: goal,
            item: state.bankChosen,
            investment: investment,
            typePopUp: state.bankChosen.status == 2 ? 2 : 1,
            //Cuando la cuenta es nueva o esta en estado "pendiente" = 1
            successData: {
              "type": 2,
              "data": "",
              "popupType": state.bankChosen.status == 2 ? 2 : 1
            }));
  }

  @override
  Widget build(BuildContext context) {
    var registerNew = useState(false);
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestingMxDomBloc>(
          create: (context) => getIt<InvestingMxDomBloc>()
            ..add(InvestingMxDomEvent.getBankAccounts()),
        )
      ],
      child: BlocConsumer<InvestingMxDomBloc, InvestingMxDomState>(
          listener: (context, state) {
        if (state.banksFetched && state.bankAccounts.length == 0) {
          ExtendedNavigator.rootNavigator
              .pushReplacementNamed(Routes.investingAddAccountPage,
                  arguments: InvestingAddAccountPageArguments(
                    goal: goal,
                    bankTransfer: bankTransfer,
                  ));
        }
      }, builder: (context, state) {
        if (state.isSubmitting) {
          return Stack(
            children: <Widget>[
              Container(
                color: AppColors.backgroundColor,
              ),
              LoadingInProgressOverlay(isLoading: true)
            ],
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: AppDimens.layoutMarginM,
                right: AppDimens.layoutMarginM,
                bottom: AppDimens.layoutSpacerL,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryButton(
                      text: S.of(context).nextButton,
                      action: () async {
                        //TO Success
                        if (registerNew.value) {
                          ExtendedNavigator.rootNavigator.pushReplacementNamed(
                              Routes.investingAddAccountPage,
                              arguments: InvestingAddAccountPageArguments(
                                bankTransfer: bankTransfer,
                                goal: goal,
                                investment: investment,
                              ));
                        } else {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          if (getIt<IEnv>().isColombia()) {
                            if (prefs.getBool("videoLoaded") == false) {
                              if (goal.fee >= 300000) {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoSenderIntroPageCol()),
                                );

                                if (result) {
                                  GoToInvest(state);
                                }
                              } else {
                                GoToInvest(state);
                              }
                            } else {
                              GoToInvest(state);
                            }
                          } else {
                            GoToInvest(state);
                          }
                        }
                      },
                      enabled: registerNew.value
                          ? true
                          : state.bankChosen.id != 0 &&
                              state.bankChosen.id != -1,
                    ),
                  ],
                ),
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
                    onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                  ),
                  Text(
                    S.of(context).investingGoalsChooseAccountTitle,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.title2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutMarginS,
                  ),
                  Text(
                    S.of(context).investingChooseAccountDescription,
                    style: AppTextStyles.normal1.copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.g75Color),
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  Column(
                    children: [
                      state.bankAccounts.length > 0
                          ? Container(
                              height: 400,
                              child: ListView.builder(
                                primary: false,
                                itemCount: state.bankAccounts.length,
                                itemBuilder: (context, index) {
                                  BankInfo bank = state.bankAccounts[index];
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

                                  if (index == state.bankAccounts.length - 1) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () => {
                                            //Cuenta Pre-Inscrita (Pendiente)
                                            if (bank.status != 2)
                                              {
                                                chooseBank = false,
                                                registerNew.value = false,
                                                context
                                                    .bloc<InvestingMxDomBloc>()
                                                    .add(
                                                      InvestingMxDomEvent
                                                          .chooseAccount(bank),
                                                    ),
                                                if (state.bankChosen.id == -1)
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
                                                                  .isValidPopUpAccountPendingTitleI,
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
                                                chooseBank = false,
                                                registerNew.value = false,
                                                context
                                                    .bloc<InvestingMxDomBloc>()
                                                    .add(
                                                      InvestingMxDomEvent
                                                          .chooseAccount(bank),
                                                    )
                                              }
                                          },
                                          splashColor: Colors.transparent,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 95,
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
                                                                    .id !=
                                                                bank
                                                                    .bankAccountId
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .successColor),
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
                                                        groupValue:
                                                            state.bankChosen.id,
                                                        activeColor: AppColors
                                                            .successColor,
                                                        onChanged: (value) {
                                                          registerNew.value =
                                                              false;
                                                          context
                                                              .bloc<
                                                                  InvestingMxDomBloc>()
                                                              .add(
                                                                InvestingMxDomEvent
                                                                    .chooseAccount(
                                                                        bank),
                                                              );
                                                        },
                                                      ),
                                                      CachedNetworkImage(
                                                        imageUrl: bank.bankLogo
                                                            .trim()
                                                            .trimRight(),
                                                        width: 90,
                                                      ),
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
                                                          Text(
                                                            bank.stateName,
                                                            style: AppTextStyles
                                                                .caption2
                                                                .copyWith(
                                                              color: bank.status ==
                                                                      2
                                                                  ? AppColors
                                                                      .successColor2
                                                                  : AppColors
                                                                      .infoColor,
                                                            ),
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
                                        ),
                                        InkWell(
                                          onTap: () {
                                            chooseBank = true;
                                            registerNew.value = true;
                                            context
                                                .bloc<InvestingMxDomBloc>()
                                                .add(
                                                  InvestingMxDomEvent
                                                      .chooseAccount(
                                                          BankInfo.empty()),
                                                );
                                          },
                                          splashColor: Colors.transparent,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 62,
                                                decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    AppDimens
                                                        .dialogBorderRadius,
                                                  ),
                                                  border: Border.fromBorderSide(
                                                    BorderSide(
                                                        color: !registerNew
                                                                .value
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .successColor),
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
                                                        value: true,
                                                        onChanged: (s) {
                                                          registerNew.value =
                                                              !registerNew
                                                                  .value;
                                                          context
                                                              .bloc<
                                                                  InvestingMxDomBloc>()
                                                              .add(
                                                                InvestingMxDomEvent
                                                                    .chooseAccount(
                                                                        BankInfo
                                                                            .empty()),
                                                              );
                                                        },
                                                        groupValue:
                                                            registerNew.value,
                                                        activeColor: AppColors
                                                            .successColor,
                                                      ),
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
                                                            S
                                                                .of(context)
                                                                .registerNewAccount,
                                                            style: AppTextStyles
                                                                .normal1
                                                                .copyWith(
                                                              color: AppColors
                                                                  .g75Color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
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
                                        )
                                      ],
                                    );
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        registerNew.value = false;
                                        context.bloc<InvestingMxDomBloc>().add(
                                              InvestingMxDomEvent.chooseAccount(
                                                  bank),
                                            );
                                      },
                                      splashColor: Colors.transparent,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppDimens.dialogBorderRadius,
                                              ),
                                              border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: state.bankChosen
                                                                .id !=
                                                            bank.bankAccountId
                                                        ? AppColors.whiteColor
                                                        : AppColors
                                                            .successColor),
                                              ),
                                            ),
                                            padding: EdgeInsets.only(
                                                right: AppDimens.layoutMarginS,
                                                top: AppDimens.layoutMarginS,
                                                bottom:
                                                    AppDimens.layoutMarginS),
                                            child: Theme(
                                              data: ThemeData(
                                                  unselectedWidgetColor:
                                                      AppColors.g25Color),
                                              child: Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: bank.bankAccountId,
                                                    groupValue:
                                                        state.bankChosen.id,
                                                    activeColor:
                                                        AppColors.successColor,
                                                    onChanged: (value) {
                                                      registerNew.value = false;
                                                      context
                                                          .bloc<
                                                              InvestingMxDomBloc>()
                                                          .add(
                                                            InvestingMxDomEvent
                                                                .chooseAccount(
                                                                    bank),
                                                          );
                                                    },
                                                  ),
                                                  CachedNetworkImage(
                                                    imageUrl: bank.bankLogo
                                                        .trim()
                                                        .trimRight(),
                                                    width: 90,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimens.layoutSpacerS,
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
                                                      Text(
                                                        bank.stateName,
                                                        style: AppTextStyles
                                                            .caption2
                                                            .copyWith(
                                                          color: bank.status ==
                                                                  2
                                                              ? AppColors
                                                                  .successColor2
                                                              : AppColors
                                                                  .infoColor,
                                                        ),
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
                                  }
                                },
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                chooseBank = true;
                                registerNew.value = true;
                                context.bloc<InvestingMxDomBloc>().add(
                                      InvestingMxDomEvent.chooseAccount(
                                          BankInfo.empty()),
                                    );
                              },
                              splashColor: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 62,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        AppDimens.dialogBorderRadius,
                                      ),
                                      border: Border.fromBorderSide(
                                        BorderSide(
                                            color: !registerNew.value
                                                ? AppColors.whiteColor
                                                : AppColors.successColor),
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
                                        children: <Widget>[
                                          Radio(
                                            value: true,
                                            groupValue: registerNew.value,
                                            activeColor: AppColors.successColor,
                                            onChanged: (s) {
                                              registerNew.value =
                                                  !registerNew.value;
                                              context
                                                  .bloc<InvestingMxDomBloc>()
                                                  .add(
                                                    InvestingMxDomEvent
                                                        .chooseAccount(
                                                            BankInfo.empty()),
                                                  );
                                            },
                                          ),
                                          SizedBox(
                                            width: AppDimens.layoutSpacerS,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                S
                                                    .of(context)
                                                    .registerNewAccount,
                                                style: AppTextStyles.normal1
                                                    .copyWith(
                                                  color: AppColors.g75Color,
                                                  fontWeight: FontWeight.w400,
                                                ),
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
                            ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
