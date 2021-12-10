import 'package:ualet/domain/core/values.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/investing_multiple_popup_dialog.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar_mx.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter_mx.dart';
import 'package:ualet/to_be_refactor/pages/goals/resume_goal_page.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_datetime_picker.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/investing/widgets/investing_popup_dialog.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvestingGoalPageMx extends StatefulWidget {
  final DashboardGoal goal;
  final bool leftSelected;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> values;
  final int periodicity;
  final bool onlyPSE;
  final bool fromRegister;

  const InvestingGoalPageMx({
    Key key,
    this.goal,
    @required this.leftSelected,
    this.multiple = false,
    this.goals,
    this.values,
    this.periodicity = 1,
    this.onlyPSE = false,
    this.fromRegister = false,
  }) : super(key: key);

  @override
  _InvestingGoalPageState createState() => _InvestingGoalPageState(goal);
}

class _InvestingGoalPageState extends State<InvestingGoalPageMx> {
  final DashboardGoal goal;
  final MoneyMaskedTextController _feeController =
      new MoneyMaskedTextController(
          decimalSeparator: ".",
          precision: 2,
          thousandSeparator: ",",
          initialValue: 0.0,
          leftSymbol: "\$");
  // TextEditingController _feeController;
  bool leftSelected = true;
  // final formatCurrency = new NumberFormat.currency(
  //     customPattern: "\u00A4#,##0.00\u00A0", symbol: "\$", decimalDigits: 0);
  final formatCurrency = NumberFormaters.mxFormater;

  final _dateController = TextEditingController();
  final investmentController = MoneyMaskedTextController(
    thousandSeparator: ",",
    precision: 2,
    decimalSeparator: ".",
    leftSymbol: "\$ ",
  );

  _InvestingGoalPageState(this.goal);

  @override
  void initState() {
    super.initState();
    leftSelected = widget.leftSelected;

    if (!widget.multiple) {
      investmentController.text = widget.goal.fee.toStringAsFixed(2);
      // _feeController = new TextEditingController(
      //     text: "${formatCurrency.format(widget.goal.fee)}");
      _feeController.text = widget.goal.fee.toStringAsFixed(2);
    } else {
      // _feeController = new TextEditingController();
    }
    print(goal.fee.toStringAsFixed(2));
    _dateController.addListener(() {
      print("_dateController${_dateController.text}");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Main Bloc
        BlocProvider<InvestingMxMainBloc>(
          create: widget.multiple
              ? (context) => getIt<InvestingMxMainBloc>()
                ..add(InvestingMxMainEvent.getMultipleData(
                    widget.goals, widget.values))
              : (context) => getIt<InvestingMxMainBloc>()
                ..add(InvestingMxMainEvent.selectGoal(goal, 0))
                ..add(InvestingMxMainEvent.updateFee(widget.goal.fee)),
        ),
      ],
      child: MultiBlocListener(
          listeners: [
            BlocListener<InvestingMxMainBloc, InvestingMxMainState>(
                listener: (context, state) {
              if (state.showDialog && !widget.multiple) {
                showDialog(
                    context: context,
                  builder: (BuildContext context) =>Container(
                      child: InvestingPopupDialog(
                        state: state,
                        acceptCallBack: () {
                          print("accept()");
                          context.bloc<InvestingMxMainBloc>()
                            ..add(InvestingMxMainEvent.acceptChange(false));
                          ExtendedNavigator.rootNavigator.pop(state);
                        },
                        undoCallback: () {
                          print("undo()");
                          context.bloc<InvestingMxMainBloc>()
                            ..add(InvestingMxMainEvent.undoChange(false));
                          ExtendedNavigator.rootNavigator.pop();
                        },
                      ))
                   );
              }

              if (state.showDialog && widget.multiple) {
                List<DashboardGoal> oldGoals = [];
                for (int i = 0; i < widget.goals.length; i++) {
                  if (widget.goals[i].id != 0) {
                    oldGoals.add(widget.goals[i]);
                  }
                }
                showDialog(
                    context: context,
                  builder: (BuildContext context) =>Container(
                    child: InvestingMultiplePopupDialog(
                      oldGoals: state.oldGoals,
                      newGoals: state.newGoals,
                      acceptCallBack: () {
                        print("accept()");
                        context.bloc<InvestingMxMainBloc>()
                          ..add(InvestingMxMainEvent.acceptChange(true));
                        ExtendedNavigator.rootNavigator.pop(state);
                      },
                      undoCallback: () {
                        print("undo()");
                        context.bloc<InvestingMxMainBloc>()
                          ..add(InvestingMxMainEvent.undoChange(true));
                        ExtendedNavigator.rootNavigator.pop();
                      },
                    ),
                  )
                      );
              }
            }),
          ],
          child: BlocBuilder<InvestingMxMainBloc, InvestingMxMainState>(
            builder: (context, state) => _buildRoot(context, state),
          )),
    );
  }

  Widget _buildRoot(BuildContext context, InvestingMxMainState state) {
    var pseValue = 0.0;
    try {
      pseValue = investmentController.numberValue;
    } on Exception {
      investmentController.updateValue(0.0);
      pseValue = 0.0;
    }
    List<DashboardGoal> goals = [];
    List<double> values = [];
    double totalValue = 0.0;
    for (int i = 0; i < widget.goals.length; i++) {
      if (widget.goals[i].id != 0) {
        goals.add(widget.goals[i]);
        values.add(widget.values[i]);
      }
    }
    totalValue = values.fold(0, (prev, element) => prev + element);
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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                widget.multiple
                    ? Container(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.layoutMargin),
                          primary: false,
                          children: [
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    if (widget.fromRegister) {
                                      ExtendedNavigator.rootNavigator
                                          .pushNamedAndRemoveUntil(
                                              Routes.homePage,
                                              (route) => route.isFirst);
                                    } else {
                                      ExtendedNavigator.rootNavigator.pop();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.primaryColor,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                            _headerInvestIntro(context),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                            Container(
                              height: goals.length > 1 ? 200 : 100,
                              child: ListView.builder(
                                primary: false,
                                itemCount: goals.length,
                                itemBuilder: (context, index) {
                                  DashboardGoal goalItem = goals[index];
                                  double value = values[index];
                                  var parser = EmojiParser();
                                  var setEmoji =
                                      parser.info('${goalItem.emoji}');
                                  var nameEmoji = setEmoji.full;
                                  return Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppDimens.dialogBorderRadius,
                                            ),
                                            color: AppColors.whiteColor,
                                          ),
                                          padding: EdgeInsets.all(
                                            AppDimens.layoutSpacerM,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        EmojiParser()
                                                            .emojify(nameEmoji),
                                                        style: TextStyle(
                                                            fontSize: AppDimens
                                                                .emojiFontSizeS),
                                                      ),
                                                      SizedBox(
                                                        width: AppDimens
                                                            .layoutSpacerM,
                                                      ),
                                                      Text(
                                                        goalItem.name,
                                                        style: AppTextStyles
                                                            .normal1
                                                            .copyWith(
                                                          color: AppColors
                                                              .g75Color,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "${formatCurrency.format(value)}",
                                                style: AppTextStyles.normal2
                                                    .copyWith(
                                                  color: AppColors.g75Color,
                                                ),
                                              ),
                                            ],
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
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.dialogBorderRadius,
                                ),
                                color: AppColors.whiteColor,
                              ),
                              padding: EdgeInsets.all(
                                AppDimens.layoutSpacerM,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.of(context).investingTotalValue,
                                    style: AppTextStyles.normal1.copyWith(
                                      color: AppColors.g75Color,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "${formatCurrency.format(totalValue)}",
                                    style: AppTextStyles.normal2.copyWith(
                                      color: AppColors.g75Color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerL,
                            ),
                            leftSelected
                                ? _buildDebitoMultiple(
                                    context,
                                    state,
                                    widget.periodicity,
                                    goals,
                                  )
                                : _buildPSEMultiple(context, totalValue),
                          ],
                        ),
                      )
                    : Container(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.layoutMargin),
                          primary: false,
                          children: <Widget>[
                            //Back Button
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    if (widget.fromRegister) {
                                      ExtendedNavigator.rootNavigator
                                          .pushNamedAndRemoveUntil(
                                              Routes.homePage,
                                              (route) => route.isFirst);
                                    } else {
                                      ExtendedNavigator.rootNavigator.pop();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.primaryColor,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                            _headerInvestIntro(context),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                            _buildGoalHeader(context),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                            _selectInvestingOptionHeader(context),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                            _selectInvestingOptionButtons(context),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                            leftSelected
                                ? _buildDomiciliacion(context, state)
                                : _buildBankTransfer(context, state, pseValue),
                          ],
                        ),
                      ),
                Visibility(
                  maintainAnimation: false,
                  maintainInteractivity: false,
                  maintainSize: false,
                  maintainState: false,
                  visible: !leftSelected,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppDimens.layoutMarginM,
                        right: AppDimens.layoutMarginM,
                        bottom: AppDimens.layoutSpacerL,
                      ),
                      child: PrimaryButton(
                          text: S.of(context).continueButton,
                          enabled: widget.multiple
                              ? true
                              : pseValue >= 100 &&
                                  pseValue <= widget.goal.goalAmt,
                          action: () {
                            //TRANSITION
                            // Firebase 27
                            // getIt<IFirebaseEventLoggerMX>()
                            //     .speiInvestmentContinue();
                            return ExtendedNavigator.rootNavigator
                                .pushNamed(Routes.investingOverviewPageMX,
                                    arguments: InvestingOverviewPageMXArguments(
                                      goal: widget.goal,
                                      bankTransfer: true,
                                      investment: pseValue,
                                      multiple: widget.multiple,
                                      goals: state.oldGoals,
                                      valuesChosen: state.valuesChosen,
                                    ));
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }
  }

  Widget _buildPSEMultiple(context, totalValue) {
    double total = totalValue + Values.bankTransferCost;
    return Column(
      children: [
        Text(
          S.of(context).withdrawalDescriptionMX,
          style: AppTextStyles.normal1.copyWith(
            color: AppColors.g75Color,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
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
                    "${formatCurrency.format(totalValue)}",
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
    );
  }

  Widget _buildBankTransfer(context, state, pseValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.of(context).investTextField,
          style: AppTextStyles.normal1
              .copyWith(color: AppColors.g75Color, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerXXs,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: investmentController,
          onChanged: (value) {
            setState(() {});
          },
          keyboardType:
              TextInputType.numberWithOptions(decimal: false, signed: false),
          validator: (value) {
            var value2 = value.replaceAll(" ", "").replaceAll("\$", "");
            if (value2 != "" &&
                pseValue < Values.minInvestment &&
                pseValue != 0) {
              return S.of(context).errorFeeLowerThanMin;
            } else if (pseValue > goal.goalAmt) {
              return S.of(context).errorFeeGreaterThanTotal;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget _buildDomiciliacion(BuildContext context, state) {
    return Column(
      children: <Widget>[
        _debitDisclamer(context),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        _cuoteTextField(context),
        _createSelectPeriodicity2(context, state),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        _datePicker(context, state),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        Text(S.of(context).selectDebit, style: AppTextStyles.normal4),
        SizedBox(height: AppDimens.layoutSpacerL),
        _buttonNext(context, state),
      ],
    );
  }

  Widget _buildDebitoMultiple(BuildContext context, state, periodicity, goals) {
    return Column(
      children: <Widget>[
        _multipleDebitDisclaimer(context),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        _createSelectPeriodicityMultiple(context, state, periodicity),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        _datePicker(context, state),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        SizedBox(
          height: goals.length > 1
              ? AppDimens.layoutSpacerL * 1.5
              : AppDimens.layoutSpacerL * 4,
        ),
        _buttonNext(context, state),
      ],
    );
  }

  Widget _buildGoalHeader(context) {
    var parser = EmojiParser();
    var setEmoji = parser.info('${goal.emoji}');
    var nameEmoji = setEmoji.full;
    return Container(
        padding: EdgeInsets.all(AppDimens.layoutMargin),
        // height: 80.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius)),
        ),
        child: Row(
          children: <Widget>[
            Text(EmojiParser().emojify(nameEmoji),
                style: TextStyle(fontSize: AppDimens.emojiFontSizeS)),
            SizedBox(
              width: AppDimens.layoutHSpacerS,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                goal.name,
                style:
                    AppTextStyles.subtitle2.copyWith(color: AppColors.g25Color),
              ),
            )
          ],
        ));
  }

  Widget _headerInvestIntro(context) {
    return Text(
      S.of(context).investTitle,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Widget _selectInvestingOptionHeader(context) {
    return Text(
      S.of(context).selectInvestingOptionMX,
      style: AppTextStyles.normal4,
    );
  }

  Widget _selectInvestingOptionButtons(context) {
    return InvestingTabBarMX(
      onClickLeft: () {
        //Firebase 21
        // getIt<IFirebaseEventLoggerMX>().domiciliacionInvest();
        if (widget.onlyPSE) {
          ToastHelper.createError(message: S.of(context).errorCantInvest)
              .show(context);
          return;
        }
        setState(() {
          leftSelected = true;
        });
      },
      onClickRight: () {
        //Firebase 26
        // getIt<IFirebaseEventLoggerMX>().speiInvestment();
        setState(() {
          leftSelected = false;
        });
      },
      leftActivated: leftSelected,
    );
  }

  Widget _debitDisclamer(context) {
    return Text(
      S.of(context).debitDisclamer,
      style: AppTextStyles.normal4,
    );
  }

  Widget _multipleDebitDisclaimer(context) {
    return Text(S.of(context).multipleDebitDisclaimer,
        style: AppTextStyles.normal4);
  }

  Widget _cuoteTextField(BuildContext context) {
    var textField = S.of(context).cuota;
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: CustomTextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            autovalidate: AutovalidateMode.always,
            controller: _feeController,
            keyboardType:
                TextInputType.numberWithOptions(decimal: false, signed: false),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              prefixStyle: TextStyle(
                  fontFamily: 'open-sans-semi-bold',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: AppColors.g90Color),
              contentPadding: EdgeInsets.only(left: 20),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.g90Color),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'open-sans-regular',
                  color: AppColors.g25Color),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.primarySoftColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
            ),
            onFieldSubmitted: (value) {
              double dValue =
                  double.parse(value.replaceAll(".", "").replaceAll("\$", ""));
              print("onFieldSubmitted: $value, dValue:$dValue");
              context
                  .bloc<InvestingMxMainBloc>()
                  .add(InvestingMxMainEvent.forceShowDialog());
            },
            onChanged: (value) {
              double dValue = _feeController.numberValue;
              print("onChange(): $value, dValue:$dValue");
              context
                  .bloc<InvestingMxMainBloc>()
                  .add(InvestingMxMainEvent.updateFee(dValue));
            },
            validator: (value) {
              double dValue = _feeController.numberValue;

              if (dValue < Values.minInvestment && dValue > 0) {
                return S.of(context).errorFeeLowerThanMin;
              } else if (dValue > goal.goalAmt) {
                return S.of(context).errorFeeGreaterThanTotal;
              } else
                return null;
            },
          ),
        ),
      ],
    );
  }

  //Periodicity Selector
  Widget _createSelectPeriodicity2(
      BuildContext context, InvestingMxMainState state) {
    //Crea los menuItems
    List<String> listPeriodicity = state.periodicityList;
    List<DropdownMenuItem<String>> items = [];
    for (String item in listPeriodicity) {
      if (item != "None") {
        items.add(DropdownMenuItem<String>(
          child: Text(item,
              style: AppTextStyles.normal1.copyWith(
                fontWeight: FontWeight.w400,
              )),
          value: item,
        ));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Label
        Text(S.of(context).investTextFieldPeriodicidad,
            style: AppTextStyles.normal4),
        SizedBox(
          height: AppDimens.layoutSpacerXXs,
        ),
        //Dropdown
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
          decoration: BoxDecoration(
              color: AppColors.inputColor,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: AppColors.g10Color,
              )),
          child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              icon: Icon(
                Icons.expand_more,
                color: AppColors.primaryColor,
                size: 20,
              ),
              value: listPeriodicity[state.goal.periodicity],
              items: items.toList(),
              onChanged: (value) {
                FocusScope.of(context).requestFocus(new FocusNode());
                context.bloc<InvestingMxMainBloc>().add(
                      InvestingMxMainEvent.updatePeriodicity(
                        listPeriodicity.indexOf(value),
                        false,
                      ),
                    );
              }),
        ),
      ],
    );
  }

  Widget _createSelectPeriodicityMultiple(
      BuildContext context, InvestingMxMainState state, int periodicity) {
    //Crea los menuItems
    List<String> listPeriodicity = state.periodicityList;
    List<DropdownMenuItem<String>> items = [];
    for (String item in listPeriodicity) {
      if (item != "None") {
        items.add(DropdownMenuItem<String>(
          child: Text(item,
              style: AppTextStyles.normal1.copyWith(
                fontWeight: FontWeight.w400,
              )),
          value: item,
        ));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Label
        Text(S.of(context).investTextFieldPeriodicidad,
            style: AppTextStyles.normal4),
        SizedBox(
          height: AppDimens.layoutSpacerXXs,
        ),
        //Dropdown
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
          decoration: BoxDecoration(
              color: AppColors.inputColor,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: AppColors.g10Color,
              )),
          child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              icon: Icon(
                Icons.expand_more,
                color: AppColors.primaryColor,
                size: 20,
              ),
              value: listPeriodicity[state.oldmultiplePeriodicity],
              items: items.toList(),
              onChanged: (value) {
                context.bloc<InvestingMxMainBloc>().add(
                      InvestingMxMainEvent.updatePeriodicity(
                        listPeriodicity.indexOf(value),
                        true,
                      ),
                    );
              }),
        ),
      ],
    );
  }

  Widget _buttonNext(BuildContext context, InvestingMxMainState state) {
    bool isActivated = context.bloc<InvestingMxMainBloc>().isButtonActivated();
    // isActivated = true;
    if (!widget.multiple) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerM,
        ),
        child: PrimaryButton(
          text: S.of(context).nextButton,
          action: isActivated
              ? () async {
                  GoalItem item = GoalItem(
                    id: state.goal.id,
                    createdDate: state.goal.created,
                    emoji: state.goal.emoji,
                    feeValue: state.goal.fee,
                    goalName: state.goal.name,
                    numMonths: state.goal.numMonths,
                    periodicity: state.goal.periodicity,
                    totalValue: state.goal.goalAmt,
                  );
                  //Firebase 22
                  // getIt<IFirebaseEventLoggerMX>().domiciliacionInvestContinue();

                  await getIt<IGoalsRepository>().editGoal(state.goal);
                  ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.investingOverviewPageMX,
                          arguments: InvestingOverviewPageMXArguments(
                            goal: state.goal,
                            bankTransfer: false,
                            investment: 0,
                            multiple: widget.multiple,
                            goals: [],
                            valuesChosen: state.valuesChosen,
                          ));
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //   Routes.investingChooseAccountMx,
                  //   arguments: InvestingChooseAccountMxArguments(
                  //     bankTransfer: false,
                  //     bankTransferValue: 0,
                  //     goal: state.goal,
                  //     goals: [],
                  //     multiple: widget.multiple,
                  //     valuesChosen: [],
                  //   ),
                  // );
                }
              : null,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerM,
        ),
        child: PrimaryButton(
          text: S.of(context).nextButton,
          action: isActivated
              ? () async {
                  context
                      .bloc<InvestingMxMainBloc>()
                      .add(InvestingMxMainEvent.nextPage(true));
                  GoalItem item;

                  for (int i = 0; i < state.oldGoals.length; i++) {
                    item = GoalItem(
                      id: state.oldGoals[i].id,
                      createdDate: state.oldGoals[i].created,
                      emoji: state.oldGoals[i].emoji,
                      feeValue: state.oldGoals[i].fee,
                      goalName: state.oldGoals[i].name,
                      numMonths: state.oldGoals[i].numMonths,
                      periodicity: state.oldGoals[i].periodicity,
                      totalValue: state.oldGoals[i].goalAmt,
                    );
                    //Firebase 22
                    // getIt<IFirebaseEventLoggerMX>()
                    //     .logEvent(FBEvents.INVERTIR_DOM_CONTINUAR, {});
                    await getIt<IGoalsRepository>().editGoal(state.oldGoals[i]);
                  }
                  context
                      .bloc<InvestingMxMainBloc>()
                      .add(InvestingMxMainEvent.nextPage(false));
                  ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.investingOverviewPageMX,
                          arguments: InvestingOverviewPageMXArguments(
                            bankTransfer: false,
                            investment: 0,
                            multiple: widget.multiple,
                            goal: state.goal,
                            goals: state.newGoals,
                            valuesChosen: state.valuesChosen,
                          ));
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //   Routes.investingChooseAccountMx,
                  //   arguments: InvestingChooseAccountMxArguments(
                  //     bankTransfer: false,
                  //     bankTransferValue: 0,
                  //     multiple: widget.multiple,
                  //     goal: state.goal,
                  //     // goals: state.oldGoals,
                  //     goals: state.newGoals,
                  //     valuesChosen: state.valuesChosen,
                  //   ),
                  // );
                }
              : null,
        ),
      );
    }
  }

  int validDayFirtsDate() {
    switch (DateTime.now().weekday) {
      case 1:
      case 2:
        return 3;
        break;
      case 3:
        return 5;
        break;
      case 4:
        return 5;
      case 5:
        return 3;
      case 6:
        return 3;
      case 7:
        return 3;
      default:
        return 0;
    }
  }

  Widget _datePicker(BuildContext context, InvestingMxMainState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomDatetimePicker(
            dateController: _dateController,
            initialValue: S.of(context).initialDate,
            initialDate:
                DateTime.now().add(Duration(days: validDayFirtsDate())),
            firstDate:
                DateTime.now().add(new Duration(days: validDayFirtsDate())),
            selectableDayPredicate: (date) {
              if (date.weekday == 6 || date.weekday == 7) {
                return false;
              }
              return true;
            },
            onChanged: (newDate) {
              context
                  .bloc<InvestingMxMainBloc>()
                  .add(InvestingMxMainEvent.updateInitialDate(newDate));
            }),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: state.isAvailableDate,
          child: Column(
            children: [
              SizedBox(
                height: AppDimens.layoutSpacerXXs,
              ),
              Text(
                S.of(context).errorHolidayAvailable,
                textAlign: TextAlign.left,
                style: AppTextStyles.caption2
                    .copyWith(color: AppColors.bgToastInvalid2),
              ),
            ],
          ),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: state.isAvailableDateValidation,
          child: Text(
            S.of(context).errorValidAvailableDate,
            textAlign: TextAlign.left,
            style: AppTextStyles.caption2
                .copyWith(color: AppColors.bgToastInvalid2),
          ),
        ),
      ],
    );
  }
}
