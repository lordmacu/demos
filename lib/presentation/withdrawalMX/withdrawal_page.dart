import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/valid_transaction_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_bloc.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';

import '../../injection.dart';

// ignore: must_be_immutable
class WithDrawalPage extends HookWidget {
  final focusInputPartial = FocusNode();

  final formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  final formatCurrencyMx = NumberFormaters.mxFormater;
  NumberFormat formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");
  TextEditingController _controllerValue = TextEditingController();

  double getDoubleFromFee(String fee) {
    if (fee != "" && fee != " " && fee != null) {
      double doubleFee = getIt<IEnv>().isColombia()
          ? double.tryParse(
              fee.replaceAll(".", "").replaceAll("\$", "").replaceAll(" ", ""))
          : double.tryParse(
              fee.replaceAll(",", "").replaceAll("\$", "").replaceAll(" ", ""));
      if (doubleFee != null) {
        return doubleFee;
      } else {
        return 0.0;
      }
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;
    final messageError = useState("");

    return MultiBlocProvider(
      providers: [
        BlocProvider<WithdrawalBloc>(
          create: (context) =>
              getIt<WithdrawalBloc>()..add(WithdrawalEvent.getItems(true)),
        ),
        BlocProvider(
          create: (context) => getIt<WithdrawalFormBloc>(),
        )
      ],
      child: BlocBuilder<WithdrawalBloc, WithdrawalState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => Stack(
              children: <Widget>[
                Container(
                  color: AppColors.backgroundColor,
                ),
                LoadingInProgressOverlay(isLoading: true),
              ],
            ),
            loadSuccess: (data) {
              var totalBalance = 0.0;

              print("aquiii esta el info del dataaaa  ${data}");

              WithdrawalInfo info = data.info;
              totalBalance = info.totaBalance;
              return BlocConsumer<WithdrawalFormBloc, WithdrawalFormState>(
                builder: (context, state) {
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
                            text: S.of(context).nextButton,
                            action: () async {
                              //Validar que el saldo sea mayor a 0

                              if (state.withdrawalType == 2) {
                                if (_controllerValue.text.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusInputPartial);
                                  return;
                                }
                              }
                              if (totalBalance > 0) {
                                //Reglas de negocio.
                                if (state.withdrawalType == 1) {
                                  //Retiro total
                                  context.bloc<WithdrawalFormBloc>().add(
                                      WithdrawalFormEvent.choosePopUpType(
                                          1, 0));
                                } else if (state.withdrawalType == 2) {
                                  double valueParsed =
                                      getDoubleFromFee(_controllerValue.text);

                                  //Retiro parcial
                                  context.bloc<WithdrawalFormBloc>().add(
                                      WithdrawalFormEvent.choosePopUpType(
                                          1, valueParsed));
                                }
                              }
                            },
                            enabled: state.withdrawalType != 0,
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
                                onPressed: () => ExtendedNavigator.rootNavigator
                                    .pop(context),
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
                                  getIt<IEnv>().isColombia() ? S.of(context).withdrawalDescriptionCO :S.of(context).withdrawalDescriptionMX ,
                                style: AppTextStyles.normal1.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.g75Color),
                              ),
                              SizedBox(
                                height: AppDimens.layoutSpacerL,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.layoutMarginS),
                                margin: EdgeInsets.symmetric(
                                    horizontal: AppDimens.layoutSpacerXXs),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppDimens.dialogBorderRadius,
                                    ),
                                    color: AppColors.whiteColor),
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text(
                                      S.of(context).withdrawalTotalBalance,
                                      style: AppTextStyles.normal1.copyWith(
                                        color: AppColors.g75Color,
                                      ),
                                    ),
                                    Text(
                                      "  ${formatCurrency.format(totalBalance)}",
                                      style: AppTextStyles.normal2
                                          .copyWith(color: AppColors.g75Color),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.layoutMarginS,
                              ),
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: AppColors.g25Color),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Radio(
                                            value: 1,
                                            groupValue: state.withdrawalType,
                                            onChanged: (int value) => context
                                                .bloc<WithdrawalFormBloc>()
                                                .add(WithdrawalFormEvent
                                                    .chooseWithdrawalType(
                                                        value)),
                                            activeColor:
                                                AppColors.successColor),
                                        InkWell(
                                          onTap: () => context
                                              .bloc<WithdrawalFormBloc>()
                                              .add(WithdrawalFormEvent
                                                  .chooseWithdrawalType(1)),
                                          splashColor: Colors.transparent,
                                          child: Text(
                                            S.of(context).withdrawalRadioAll,
                                            style: AppTextStyles.normal1
                                                .copyWith(
                                                    color: AppColors.g50Color),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Radio(
                                          value: 2,
                                          groupValue: state.withdrawalType,
                                          onChanged: (int value) => context
                                              .bloc<WithdrawalFormBloc>()
                                              .add(WithdrawalFormEvent
                                                  .chooseWithdrawalType(value)),
                                          activeColor: AppColors.successColor,
                                        ),
                                        InkWell(
                                          onTap: () => context
                                              .bloc<WithdrawalFormBloc>()
                                              .add(WithdrawalFormEvent
                                                  .chooseWithdrawalType(2)),
                                          splashColor: Colors.transparent,
                                          child: Text(
                                            S
                                                .of(context)
                                                .withdrawalRadioParcial,
                                            style: AppTextStyles.normal1
                                                .copyWith(
                                                    color: AppColors.g50Color),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: state.withdrawalType == 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 18, right: 18, top: 3),
                                            child: CustomTextFormField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly,
                                                MoneyTextInputFormatter(),
                                              ],
                                              focusNode: focusInputPartial,
                                              controller: _controllerValue,
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                hoverColor: AppColors.g25Color,
                                                fillColor: AppColors.inputColor,
                                                filled: true,
                                                hintText:
                                                    S.of(context).valueToRetire,
                                                prefixStyle: TextStyle(
                                                    fontFamily:
                                                        'open-sans-semi-bold',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                    color: AppColors.g90Color),
                                                contentPadding:
                                                    EdgeInsets.only(left: 20),
                                                labelStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors.g90Color),
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        'open-sans-regular',
                                                    color: AppColors.g25Color),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors
                                                        .primarySoftColor,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors.g10Color,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors.g10Color,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    color:
                                                        AppColors.dangerColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    color:
                                                        AppColors.dangerColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  borderSide: BorderSide(
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              onChanged: (value) {
                                                double valueParsed =
                                                    getDoubleFromFee(
                                                        "${value}");

                                                if (valueParsed >
                                                    totalBalance) {
                                                  messageError.value = S
                                                      .of(context)
                                                      .messageErrorRetire;
                                                } else if ((totalBalance -
                                                        valueParsed) <
                                                    11600) {
                                                  messageError
                                                      .value = getIt<IEnv>()
                                                          .isColombia()
                                                      ? S
                                                          .of(context)
                                                          .minimunMessageRetire
                                                      : S
                                                          .of(context)
                                                          .minimunMessageRetireMx;
                                                } else {
                                                  messageError.value = "";
                                                }
                                              },
                                              validator: (String value) {},
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 7, right: 20),
                                            child: Text(
                                              "${messageError.value}.",
                                              style: TextStyle(
                                                  height: 1.3,
                                                  color: AppColors.redColor
                                                      .withOpacity(0.7),
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onWillPop: () {});
                },
                listener: (context, state) {
                  if (state.withdrawalType == 1 && !state.isNextProcess) {
                    showGeneralDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.4),
                        barrierDismissible: true,
                        barrierLabel: "Label",
                        transitionDuration: Duration(milliseconds: 600),
                        pageBuilder: (ctx, anim1, anim2) {
                          return WillPopScope(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: CustomDialog(
                                  buttonText: S.of(context).continueButton,
                                  icon: Icons.account_balance,
                                  iconColor: AppColors.successColor,
                                  title: S.of(context).withdrawalModalTitle,
                                  description:
                                      S.of(context).withdrawalModalDescription,
                                  buttonAction: () =>
                                      ExtendedNavigator.rootNavigator.pop(),
                                ),
                              ),
                              onWillPop: () {});
                        },
                        transitionBuilder: (ctx, anim1, anim2, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0.28))
                                    .animate(anim1),
                            child: child,
                          );
                        });
                  }
                  if (state.isNextProcess) {
                    switch (state.popUpType.popUpType) {
                      case 0:
                        //Validación para identificar, si la meta tiene débito asociado.
                        List<DebitInfo> debits = info.debits;
                        List<DebitInfo> goalDebits = [];

                        if (state.withdrawalType == 1) {
                          getIt<IFireBaseEventLogger>().withdrawalTypeFull();

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
                                      child: CustomDialogExtend(
                                        description: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                  S
                                                      .of(context)
                                                      .questionPartialValue,
                                                  style: AppTextStyles.normal1
                                                      .copyWith(
                                                    color: AppColors.g75Color,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .withdrawalTitle,
                                                      style: AppTextStyles
                                                          .normal1
                                                          .copyWith(
                                                        color:
                                                            AppColors.g75Color,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        S.of(context).fiveDays,
                                                        style: AppTextStyles
                                                            .normal1
                                                            .copyWith(
                                                          color: AppColors
                                                              .g75Color,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                        color: Colors.white,
                                                        onPressed: () async {
                                                          ExtendedNavigator
                                                              .rootNavigator
                                                              .pushReplacementNamed(
                                                                  Routes
                                                                      .withDrawalPageMX);
                                                        },
                                                        child: Text(
                                                          S.of(context).goBack,
                                                          style: AppTextStyles
                                                              .normal2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .txtColorPurple),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          ExtendedNavigator.rootNavigator.pushNamed(
                                                              Routes
                                                                  .chooseAccountPageMX,
                                                              arguments: ChooseAccountPageArguments(
                                                                  withdrawalInfo:
                                                                      info,
                                                                  withdrawalAll:
                                                                      true,
                                                                  chosenAmmount:
                                                                      totalBalance,
                                                                  chosenGoal:
                                                                      DashboardGoal
                                                                          .empty(),
                                                                  chosenGoals: [],
                                                                  chosenValues: [],
                                                                  deleteGoal:
                                                                      true,
                                                                  withdrawalType:
                                                                      true,
                                                                  banksInfoDebits:
                                                                      info
                                                                          .banksInfoDebits,
                                                                  goalDebits:
                                                                      goalDebits));
                                                        },
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .continueButton,
                                                          style: AppTextStyles
                                                              .normal2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        icon: Image.asset(
                                          AppImages.monetizationSucess,
                                          height: 30,
                                        ),
                                        iconColor: AppColors.successColor,
                                        title: S.of(context).remember,
                                        buttonAction: () => ExtendedNavigator
                                            .rootNavigator
                                            .pop(),
                                      ),
                                    ),
                                    onWillPop: () {});
                              },
                              transitionBuilder: (ctx, anim1, anim2, child) {
                                return SlideTransition(
                                  position: Tween(
                                          begin: Offset(0, 1),
                                          end: Offset(0, 0.23))
                                      .animate(anim1),
                                  child: child,
                                );
                              });
                        } else if (state.withdrawalType == 2) {
                          getIt<IFireBaseEventLogger>().withdrawalTypePartial();

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
                                      child: CustomDialogExtend(
                                        description: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                  S
                                                      .of(context)
                                                      .questionPartialValue,
                                                  style: AppTextStyles.normal1
                                                      .copyWith(
                                                    color: AppColors.g75Color,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .withdrawalTitle,
                                                      style: AppTextStyles
                                                          .normal1
                                                          .copyWith(
                                                        color:
                                                            AppColors.g75Color,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        S.of(context).fiveDays,
                                                        style: AppTextStyles
                                                            .normal1
                                                            .copyWith(
                                                          color: AppColors
                                                              .g75Color,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                        color: Colors.white,
                                                        onPressed: () async {
                                                          context
                                                              .bloc<
                                                                  WithdrawalFormBloc>()
                                                              .add(WithdrawalFormEvent
                                                                  .resetWithdraw(
                                                                      true));
                                                          ExtendedNavigator
                                                              .rootNavigator
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          S.of(context).goBack,
                                                          style: AppTextStyles
                                                              .normal2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .txtColorPurple),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          double valueParsed =
                                                              getDoubleFromFee(
                                                                  _controllerValue
                                                                      .text);

                                                          // getIt<IFireBaseEventLogger>()
                                                          //     .withdrawKindPartial();

                                                          ExtendedNavigator
                                                              .rootNavigator
                                                              .pushNamed(
                                                            Routes
                                                                .chooseAccountPageMX,
                                                            arguments: ChooseAccountPageArguments(
                                                                withdrawalInfo:
                                                                    info,
                                                                withdrawalAll:
                                                                    false,
                                                                chosenAmmount:
                                                                    valueParsed,
                                                                chosenValues: [],
                                                                chosenGoal:
                                                                    DashboardGoal
                                                                        .empty(),
                                                                chosenGoals: [],
                                                                withdrawalType:
                                                                    false,
                                                                banksInfoDebits:
                                                                    info.banksInfoDebits,
                                                                goalDebits: []),
                                                          );

                                                          _controllerValue
                                                              .text = "";
                                                          context
                                                              .bloc<
                                                                  WithdrawalFormBloc>()
                                                              .add(WithdrawalFormEvent
                                                                  .resetWithdraw(
                                                                      true));
                                                        },
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .continueButton,
                                                          style: AppTextStyles
                                                              .normal2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        icon: Image.asset(
                                          AppImages.monetizationSucess,
                                          height: 30,
                                        ),
                                        iconColor: AppColors.successColor,
                                        title: S.of(context).remember,
                                        buttonAction: () => ExtendedNavigator
                                            .rootNavigator
                                            .pop(),
                                      ),
                                    ),
                                    onWillPop: () {});
                              },
                              transitionBuilder: (ctx, anim1, anim2, child) {
                                return SlideTransition(
                                  position: Tween(
                                          begin: Offset(0, 1),
                                          end: Offset(0, 0.23))
                                      .animate(anim1),
                                  child: child,
                                );
                              });
                        }
                        break;
                      case 1: // No tiene saldo para hacer retiro parcial.
                        _showPopupValidTransaction(
                            context,
                            'Retiros Parciales',
                            state.popUpType.message,
                            S.of(context).validateTransactionPopUpButton,
                            'Has llegado al límite de tu saldo para realizar un retiro parcial.');
                        break;
                      case 2: // Valida si ya tiene otro retiro total pendiente.
                        _showPopupValidTransaction(
                            context,
                            'Retiro Total en\ncurso',
                            state.popUpType.message,
                            S.of(context).validateTransactionPopUpButton,
                            '');
                        break;
                      case 3: // Valida si ya tiene otro retiro parcial pendiente.
                        _showPopupValidTransaction(
                            context,
                            'Retiro Parcial en\ncurso',
                            state.popUpType.message,
                            S.of(context).validateTransactionPopUpButton,
                            '');
                        break;
                      case 5: // Valida si ya tiene una inversión en progreso.
                        _showPopupValidTransaction(
                            context,
                            'Inversión en curso',
                            state.popUpType.message,
                            S.of(context).validateTransactionPopUpButton,
                            '');
                        break;

                      default:
                    }
                  }
                },
              );
            },
            loadFailure: (state) {
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
                    action: () {},
                    enabled: true,
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    SafeArea(
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
                            S.of(context).withdrawalDescriptionMX,
                            style: AppTextStyles.normal1.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.g75Color),
                          ),
                          SizedBox(
                            height: AppDimens.layoutSpacerL,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimens.layoutMarginS),
                            margin: EdgeInsets.symmetric(
                                horizontal: AppDimens.layoutSpacerXXs),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.dialogBorderRadius,
                                ),
                                color: AppColors.whiteColor),
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  S.of(context).withdrawalTotalBalance,
                                  style: AppTextStyles.normal1.copyWith(
                                    color: AppColors.g75Color,
                                  ),
                                ),
                                Text(
                                  "  ${formatCurrency.format(0.0)}",
                                  style: AppTextStyles.normal2
                                      .copyWith(color: AppColors.g75Color),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.layoutMarginS,
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.g25Color),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Radio(
                                        value: 1,
                                        groupValue: 1,
                                        onChanged: (int value) {},
                                        activeColor: AppColors.successColor),
                                    InkWell(
                                      onTap: () => context
                                          .bloc<WithdrawalFormBloc>()
                                          .add(WithdrawalFormEvent
                                              .chooseWithdrawalType(1)),
                                      splashColor: Colors.transparent,
                                      child: Text(
                                        S.of(context).withdrawalRadioAll,
                                        style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g50Color),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Radio(
                                      value: 2,
                                      groupValue: 1,
                                      onChanged: (int value) {},
                                      activeColor: AppColors.successColor,
                                    ),
                                    InkWell(
                                      onTap: () => context
                                          .bloc<WithdrawalFormBloc>()
                                          .add(WithdrawalFormEvent
                                              .chooseWithdrawalType(2)),
                                      splashColor: Colors.transparent,
                                      child: Text(
                                        S.of(context).withdrawalRadioParcial,
                                        style: AppTextStyles.normal1.copyWith(
                                            color: AppColors.g50Color),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

_showPopupValidTransaction(context, String titlePopUp, String bodyPopUp,
    String buttonText, String subTitlePopUp) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.4),
    barrierDismissible: false,
    barrierLabel: "Label",
    transitionDuration: Duration(milliseconds: 600),
    pageBuilder: (ctx, anim1, anim2) {
      return Align(
          alignment: Alignment.bottomCenter,
          child: ValidTransactionPopUp(
            title: titlePopUp,
            body: bodyPopUp,
            subTitlePopUp: subTitlePopUp,
            buttonAction: () {
              ExtendedNavigator.rootNavigator.pop();
            },
            buttonText: buttonText,
          ));
    },
    transitionBuilder: (ctx, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}

_popUpType(
    BuildContext context, int rulePopUpType, double transactionValue) async {
  var response = await getIt<IWithdrawalRepository>()
      .validateTransactionPopUpType(rulePopUpType, transactionValue);
  response.fold(
      (l) => ToastHelper.createError(
          message: l.map(
              unexpected: (_) => "Error inesperado",
              fromServer: (e) => e.message)), (r) {
    if (r.popUpType > 0) {
      _showPopupValidTransaction(context, 'Retiro Total en\ncurso', r.message,
          S.of(context).validateTransactionPopUpButton, '');
    }
  });
}
