import 'package:ualet/application/goals/goals_bloc.dart';
import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/domain/my_wallet/edit_debit_chart_data.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/mygoals/popups/debit_recalculated_multiple_goals.dart';
import 'package:ualet/presentation/mygoals/popups/delete_debit_popup.dart';
import 'package:ualet/to_be_refactor/widgets/chart_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/application/edit_debit/edit_debit_bloc.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/goals/goal_item.dart';
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
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class EditGoalDebitPage extends StatefulWidget {
  final DashboardGoal goal;
  final DebitInfo debitItem;
  final List<DashboardGoal> goals;

  const EditGoalDebitPage(
      {Key key,
      @required this.goal,
      @required this.debitItem,
      @required this.goals})
      : super(key: key);

  @override
  _EditGoalDebitPageState createState() =>
      _EditGoalDebitPageState(goal, debitItem);
}

class _EditGoalDebitPageState extends State<EditGoalDebitPage> {
  final DashboardGoal goal;
  final DebitInfo debitItem;
  NumberFormat formater;
  bool isColombia;
  double minInvestment;
  bool leftSelected = true;

  final _dateController = TextEditingController();
  // final investm);

  _EditGoalDebitPageState(this.goal, this.debitItem);

  final FocusNode _focusValue = FocusNode();

  MoneyMaskedTextController _feeController;
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayDoneButton: true,
          focusNode: _focusValue,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    isColombia = getIt<IEnv>().isColombia();

    formater =
        isColombia ? NumberFormaters.copFormater : NumberFormaters.mxFormater;
    print(goal.fee.toStringAsFixed(0));

    minInvestment = isColombia ? 10000.0 : Values.minInvestment;

    _feeController = isColombia
        ? MoneyMaskedTextController(
            precision: 0,
            decimalSeparator: '',
            thousandSeparator: '.',
            initialValue: 100.0)
        : MoneyMaskedTextController(
            precision: 2,
            decimalSeparator: '.',
            thousandSeparator: ',',
            initialValue: 100.0);
    _feeController.text = widget.goal.fee.toStringAsFixed(isColombia ? 0 : 2);
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
        BlocProvider<EditDebitBloc>(
          create: (context) => getIt<EditDebitBloc>()
            ..add(EditDebitEvent.selectGoal(goal, 0))
            ..add(EditDebitEvent.selectDebitInfo(debitItem)),
        ),
      ],
      child: MultiBlocListener(
          listeners: [
            BlocListener<EditDebitBloc, EditDebitState>(
                listener: (context, state) {}),
          ],
          child: BlocBuilder<EditDebitBloc, EditDebitState>(
            builder: (context, state) => _buildRoot(context, state),
          )),
    );
  }

  Widget _buildRoot(BuildContext context, EditDebitState state) {
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
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
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
                              ExtendedNavigator.rootNavigator.pop();
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
                      _buildGoalHeader(),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      _buildAccountHeader(),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      _buildDomiciliacion(context, state)
                    ],
                  ),
                ),
              ],
            ),
          ));
    }
  }

  Widget _buildDomiciliacion(BuildContext context, EditDebitState state) {
    EditDebitChartData chartData = context.bloc<EditDebitBloc>().getChartData(
        fee: _feeController.numberValue,
        // fee: getDoubleFromFee(_feeController.value.text),
        periodicity: state.goal.periodicity,
        totalValue: goal.goalAmt);
    return Column(
      children: <Widget>[
        _debitDisclamer(context),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        _cuoteTextField(context),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        _createSelectPeriodicity2(context, state),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        _datePicker(context),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        _createChart(chartData),
        SizedBox(height: AppDimens.layoutSpacerL),
        _buttonNext(context, state),
        _buttonDelete(context),
      ],
    );
  }

  Widget _buildGoalHeader() {
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

  Widget _buildAccountHeader() {
    String number = debitItem.bankAccountNumber;
    if (number.length > 4) {
      number = "**** ${number.substring(number.length - 4)}";
    }
    return Container(
        padding: EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.dialogBorderRadius)),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: AppDimens.layoutHSpacerS,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    debitItem.bankAccountName,
                    style: AppTextStyles.caption1.copyWith(
                        color: AppColors.g50Color, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    number,
                    style: AppTextStyles.normal2
                        .copyWith(color: AppColors.g50Color),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _headerInvestIntro(context) {
    return Text(
      S.of(context).editDebitTitle,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Widget _debitDisclamer(context) {
    return Text(
      S.of(context).debitDisclamer,
      style: AppTextStyles.normal4,
    );
  }

  Widget _cuoteTextField(BuildContext context) {
    var textField = S.of(context).cuota;
    return Column(
      children: <Widget>[
        CustomTextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          autovalidate: AutovalidateMode.always,
          controller: _feeController,
          keyboardType: TextInputType.number,
          focusNode: _focusValue,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hoverColor: AppColors.g25Color,
            fillColor: AppColors.inputColor,
            filled: true,
            hintText: textField,
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
            double dValue = _feeController.numberValue;
            // double dValue = getDoubleFromFee(_feeController.value.text);
            print("onFieldSubmitted: $value, dValue:$dValue");
            context.bloc<EditDebitBloc>().add(EditDebitEvent.forceShowDialog());
          },
          onChanged: (value) {
            double dValue = _feeController.numberValue;
            // double dValue = getDoubleFromFee(_feeController.value.text);
            print("onChange(): $value, dValue:$dValue");
            context.bloc<EditDebitBloc>().add(EditDebitEvent.updateFee(dValue));
          },
          validator: (String value) {
            if (_feeController.numberValue < minInvestment) {
              return S.of(context).goalFeeError;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  //Periodicity Selector
  Widget _createSelectPeriodicity2(BuildContext context, EditDebitState state) {
    //Crea los menuItems
    List<String> listPeriodicity = state.periodicityList;
    List<DropdownMenuItem<String>> items = [];
    for (String item in listPeriodicity) {
      items.add(DropdownMenuItem<String>(
        child: Text(item,
            style: AppTextStyles.normal1.copyWith(
              fontWeight: FontWeight.w400,
            )),
        value: item,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Label
        Text(S.of(context).choosePeriodicity, style: AppTextStyles.normal4),
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
              value: listPeriodicity[state.goal.periodicity - 1],
              items: items.toList(),
              disabledHint: Text(listPeriodicity[state.goal.periodicity - 1]),
              onChanged: widget.goals.length == 0
                  ? (value) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      context.bloc<EditDebitBloc>().add(
                          EditDebitEvent.updatePeriodicity(
                              listPeriodicity.indexOf(value) + 1));
                    }
                  : null),
        ),
        SizedBox(height: AppDimens.layoutSpacerS),
        widget.goals.length != 0
            ? Text(
                S.of(context).periodicityDeactivatedSubtitle,
                style:
                    AppTextStyles.caption1.copyWith(color: AppColors.infoColor),
              )
            : Container(),
      ],
    );
  }

  Widget _buttonNext(BuildContext context, EditDebitState state) {
    bool isActivated = context.bloc<EditDebitBloc>().isButtonActivated();
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerS,
      ),
      child: PrimaryButton(
        text: S.of(context).nextButton,
        action: isActivated && _feeController.numberValue > minInvestment
            ? () {
                print(state.goal);
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>  Container(
                        child: InvestingPopupDialog(
                      state: InvestingMxMainState.initial().copyWith(
                        goal: state.goal,
                        oldMonths: state.oldMonths,
                        initialDate: state.initialDate,
                        oldFee: state.oldFee,
                        oldPeriodicity: state.oldPeriodicity,
                        periodicityList: state.periodicityList,
                      ),
                      acceptCallBack: () async {
                        print("accept()");
                        context.bloc<EditDebitBloc>()
                          ..add(EditDebitEvent.acceptChange());
                        ExtendedNavigator.rootNavigator.pop(state);
                        if (widget.goals.length > 0) {
                          showMultiGoalRecalculatedDialog(state, context);
                        } else {
                          // ExtendedNavigator.rootNavigator
                          //     .pushNamed(Routes.homePage);
                          context
                              .bloc<EditDebitBloc>()
                              .add(EditDebitEvent.isSubmitting(true));
                          var result = await getIt<IGoalsRepository>()
                              .editDebitWithGoals(
                                  widget.debitItem.id,
                                  state.goal.periodicity,
                                  state.goal.fee,
                                  [state.goal]);
                          result.fold((l) {
                            context
                                .bloc<EditDebitBloc>()
                                .add(EditDebitEvent.isSubmitting(false));
                            ExtendedNavigator.rootNavigator.pop();
                            return ToastHelper.createError(
                                    duration: Duration(seconds: 5),
                                    message: l.map(
                                        unexpected: (_) => "Error inesperado",
                                        fromServer: (e) => e.message))
                                .show(context);
                          }, (r) {
                            context
                                .bloc<EditDebitBloc>()
                                .add(EditDebitEvent.isSubmitting(false));
                            ToastHelper.createSuccess(
                                    message: "Débito Modificado!")
                                .show(context);
                            Future.delayed(Duration(seconds: 3), () {
                              ExtendedNavigator.rootNavigator
                                  .pushNamedAndRemoveUntil(
                                Routes.homePage,
                                (route) => route.isFirst,
                              );
                            });
                          });
                        }
                      },
                      undoCallback: () {
                        print("undo()");
                        context.bloc<EditDebitBloc>()
                          ..add(EditDebitEvent.undoChange());
                        ExtendedNavigator.rootNavigator.pop();
                        _feeController.text = formater.format(goal.fee);
                      },
                    )));
              }
            : null,
      ),
    );
  }

  _buttonDelete(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerM,
      ),
      child: FlatButton(
        child: Text("Eliminar débito",
            style:
                AppTextStyles.normalUnder1.copyWith(color: AppColors.g75Color)),
        onPressed: () async {
          List<DashboardGoal> goals = List.from(widget.goals);
          goals.add(widget.goal);
          showDialog(
              context: context,
              builder: (BuildContext context) =>  DeleteDebitPopup(
                goals: goals,
                accept: () async {
                  ExtendedNavigator.rootNavigator.pop();
                  context
                      .bloc<EditDebitBloc>()
                      .add(EditDebitEvent.isSubmitting(true));
                  var response = await getIt<IWithdrawalRepository>()
                      .deleteDebit(widget.debitItem);
                  context
                      .bloc<EditDebitBloc>()
                      .add(EditDebitEvent.isSubmitting(false));
                  response.fold(
                      (l) => ToastHelper.createError(
                          duration: Duration(seconds: 5),
                          message: l.map(
                              unexpected: (_) => "Error inesperado",
                              fromServer: (e) => e.message)).show(context),
                      (r) {
                    ToastHelper.createSuccess(
                            message: "${S.of(context).debitDeleted}!")
                        .show(context);
                    context
                        .bloc<EditDebitBloc>()
                        .add(EditDebitEvent.isSubmitting(false));
                    Future.delayed(Duration(seconds: 3), () {
                      ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                        Routes.homePage,
                        (route) => route.isFirst,
                      );
                    });
                  });
                },
                reject: () => ExtendedNavigator.rootNavigator.pop(),
              ));
        },
      ),
    );
  }

  showMultiGoalRecalculatedDialog(EditDebitState state, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>  Container(
          child: DebitRecalculatedMultipleGoalsPopUp(
            goals: widget.goals,
            primaryGoal: state.goal,
            acceptCallBack: () async {
              context
                  .bloc<EditDebitBloc>()
                  .add(EditDebitEvent.isSubmitting(true));
              print("accept() DebitRecalculated");
              // context.bloc<EditDebitBloc>()
              //   ..add(EditDebitEvent.acceptChange());
              List<DashboardGoal> allGoals = [];
              allGoals.add(state.goal);
              allGoals.addAll(widget.goals);
              double total = state.goal.fee;
              widget.goals.forEach((e) => total += e.fee);
              var response = await getIt<IGoalsRepository>().editDebitWithGoals(
                  widget.debitItem.id, state.goal.periodicity, total, allGoals);
              ExtendedNavigator.rootNavigator.pop(state);
              response.fold((l) {
                context
                    .bloc<EditDebitBloc>()
                    .add(EditDebitEvent.isSubmitting(false));

                return ToastHelper.createError(
                    duration: Duration(seconds: 5),
                    message: l.map(
                        unexpected: (_) => "Error inesperado",
                        fromServer: (e) => e.message)).show(context);
              }, (r) {
                ToastHelper.createSuccess(
                        message: "${S.of(context).debitRecalculated}!")
                    .show(context);
                context
                    .bloc<EditDebitBloc>()
                    .add(EditDebitEvent.isSubmitting(false));
                Future.delayed(Duration(seconds: 3), () {
                  ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.homePage,
                    (route) => route.isFirst,
                  );
                });
              });
            },
            undoCallback: () {
              print("undo() DebitRecalculated");
              // context.bloc<EditDebitBloc>()
              //   ..add(EditDebitEvent.undoChange());
              ExtendedNavigator.rootNavigator.pop();
            },
          ),
        ));
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
        return 4;
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

  Widget _datePicker(BuildContext context) {
    return CustomDatetimePicker(
        dateController: _dateController,
        initialValue: S.of(context).nextDebit,
        initialDate: DateTime.now().add(Duration(days: validDayFirtsDate())),
        firstDate: DateTime.now().add(Duration(days: validDayFirtsDate())),
        selectableDayPredicate: (date) {
          if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }
          return true;
        },
        onChanged: (newDate) {
          context
              .bloc<EditDebitBloc>()
              .add(EditDebitEvent.updateInitialDate(newDate));
        });
  }

  Widget _createChart(EditDebitChartData chartData) {
    List<Map<double, double>> lst = List<Map<double, double>>();

    List<Color> lineColors = List<Color>();
    lineColors.add(AppColors.dangerColor);
    lineColors.add(AppColors.primaryColor);
    lst.add(chartData.dataOtros);
    lst.add(chartData.dataUalet);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.layoutSpacerM,
          vertical: AppDimens.layoutSpacerS),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.dialogBorderRadius),
          ),
          color: AppColors.whiteColor), //Fondo
      child: Column(
        children: <Widget>[
          chartData.showChart && _feeController.numberValue > minInvestment
              ? ChartWidget(
                  //Chart
                  titleX: chartData.lx,
                  titleY: chartData.ly,
                  data: lst,
                  lineColors: lineColors,
                  numberDataX: chartData.maxX,
                  numberDataY: chartData.maxY)
              : Column(
                  //Texto y emojis
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(S.of(context).thinkingEmoji,
                        style: TextStyle(
                          fontSize: 40,
                        )),
                    SizedBox(
                      height: AppDimens.layoutSpacerS,
                    ),
                    Container(
                      child: Text(
                        S.of(context).plotPlaceholder,
                        style: AppTextStyles.normal4,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
          chartData.showChart
              ? SizedBox(
                  height: AppDimens.layoutSpacerS,
                )
              : SizedBox(height: AppDimens.layoutSpacerL),
          Divider(),
          SizedBox(height: AppDimens.layoutSpacerS),
          //Cuota, meses ualet y meses otros
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(S.of(context).monthyCuote, style: AppTextStyles.normal4),
                  Expanded(child: SizedBox()),
                  Text(
                    "${formater.format(chartData.fee)}",
                    style: AppTextStyles.normal4,
                  ),
                ],
              ),
              SizedBox(height: AppDimens.layoutSpacerS),
              Divider(),
              SizedBox(height: AppDimens.layoutSpacerS),
              //Meses Ualet
              Row(
                children: <Widget>[
                  Text(
                    S.of(context).monthUalet,
                    style: AppTextStyles.normal4,
                  ),
                  Expanded(child: SizedBox()),
                  chartData
                          .showChart //Si muestra la grafica, muestra el numero de meses calculado, de lo contrario -
                      ? Text(
                          chartData.monthsUalet == 1
                              ? "${chartData.monthsUalet} " +
                                  S.of(context).month
                              : "${chartData.monthsUalet} " +
                                  S.of(context).months,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.primaryColor),
                        )
                      : Text(
                          '-',
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.primaryColor),
                        ),
                ],
              ),
              SizedBox(height: AppDimens.layoutSpacerS),
              Divider(),
              SizedBox(height: AppDimens.layoutSpacerS),
              //Meses Otros
              Row(
                children: <Widget>[
                  Text(S.of(context).monthOther, style: AppTextStyles.normal4),
                  Expanded(child: SizedBox()),
                  chartData
                          .showChart //Si muestra la grafica, muestra el numero de meses calculado, de lo contrario -
                      ? Text(
                          chartData.monthsOthers == 1
                              ? "${chartData.monthsOthers} " +
                                  S.of(context).month
                              : "${chartData.monthsOthers} " +
                                  S.of(context).months,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.dangerColor),
                        )
                      : Text(
                          "-",
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.dangerColor),
                        ),
                ],
              )
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
        ],
      ),
    );
  }

  // double getDoubleFromFee(String fee) {
  //   // if (fee != "" && fee != " " && fee != null) {
  //   //   double doubleFee = double.tryParse(
  //   //       fee.replaceAll(".", "").replaceAll("\$", "").replaceAll(" ", ""));
  //   //   if (doubleFee != null) {
  //   //     return doubleFee;
  //   //   } else {
  //   //     return 0.0;
  //   //   }
  //   // } else {
  //   //   return 0.0;
  //   // }
  //   return _feeController.numberValue;
  // }
}
