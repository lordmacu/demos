import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/to_be_refactor/pages/goals/widgets/missing_emoji_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/application/goals/goals_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/validators_util.dart' as utils;
import 'package:ualet/to_be_refactor/widgets/chart_widget.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/to_be_refactor/widgets/emoji_picker_widget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter_mx.dart';

class GoalsPages extends StatefulWidget {
  final bool isFirstGoal;
  final bool isMigration;
  final bool validNewGoal;
  GoalsPages(
      {Key key,
      this.isFirstGoal,
      this.isMigration = false,
      this.validNewGoal = false})
      : super(key: key);

  @override
  _GoalsPagesState createState() => _GoalsPagesState(isFirstGoal);
}

class _GoalsPagesState extends State<GoalsPages> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emojiController = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerValue = TextEditingController();
  double dValue = 0;
  bool validLabelName = false;
  bool validLabelValue = true;
  bool validChart = true;
  Map<double, double> data = {};
  Map<double, double> data2 = {};
  PageController _pageController;
  int selectedPeriodicity = 0;

  bool isChangedPeiodicity = false;
  final bool isFirstGoal;
  SharedPreferences _prefs = getIt<SharedPreferences>();
  double minMoneyValue = 0;
  double minGoalFeeValue = 0;

  NumberFormat formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  NumberFormat formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  NumberFormat formatCurrencyMx =
      new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

  final listPeriodicity = [
    'Periodicidad',
    'Quincenal',
    'Mensual',
    'Trimestral'
  ];

  final FocusNode focusInput = FocusNode();

  _GoalsPagesState(this.isFirstGoal);

  String isNameValid(String s) {
    return getIt<GoalsBloc>().state.nameError ? "Nel" : null;
  }

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

  var parser = EmojiParser();
  @override
  void dispose() {
    _pageController?.dispose();
    _emojiController?.dispose();
    _controllerName?.dispose();
    _controllerValue?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;

    minMoneyValue = EnvironmentConfig.minGoalMoneyValue;
    minGoalFeeValue = EnvironmentConfig.minGoalFeeValue;

    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoalsBloc>(
      create: (context) => getIt<GoalsBloc>(),
      child: BlocListener<GoalsBloc, GoalsState>(
        listener: (context, state) {
          state.postFailureOrSuccess.fold(
              () {},
              (either) => either.fold(
                      (failure) => ToastHelper.createError(
                              message: failure.map(
                                  unexpected: (_) => 'Unexpected',
                                  fromServer: (failure) => failure.message))
                          .show(context), (result) async {
                    // var updateCustomerLvl2 =
                    //     await getIt<ICustomerLevelRepoCol>().setAfterMeta();

                    _prefs.isMigrating = false;
                    return ExtendedNavigator.rootNavigator.pushReplacementNamed(
                        Routes.resumeGoalPage,
                        arguments: ResumeGoalPageArguments(
                            goalItem: state.goalData,
                            isFirstGoal: true,
                            isMigration: widget.isMigration));
                  }));
        },
        child: BlocBuilder<GoalsBloc, GoalsState>(
          builder: (context, state) {
            _emojiController.addListener(() {
              context
                  .bloc<GoalsBloc>()
                  .add(GoalsEvent.updateEmoji(_emojiController.text));
            });
            return _buildRoot(context, state);
          },
        ),
      ),
    );
  }

  Scaffold _buildRoot(BuildContext context, GoalsState state) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: _contentPage(
                  context,
                  state,
                ),
              ),
            ),
            LoadingInProgressOverlay(
              isLoading: state.isPosting,
            ),
          ],
        ));
  }

  Widget _contentPage(BuildContext context, GoalsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: AppDimens.layoutMargin,
                  right: AppDimens.layoutMargin,
                  top: 10),
              child: Column(
                children: <Widget>[
                  _createTitle(),
                  SizedBox(
                    height: 40,
                  ),
                  _formData(context, state),
                ],
              ),
            ),
          ],
        ),
        //Button
        Padding(
          padding:
              const EdgeInsets.only(left: 44, bottom: 40, right: 44, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 45.0,
                child: _button(S.of(context).createGoal, state, context),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _createTitle() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                      size: 25.0,
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                ),
                Text(
                  isFirstGoal
                      ? S.of(context).createYourFirstGoal
                      : S.of(context).createAnotherGoal,
                  style: AppTextStyles.title2
                      .copyWith(color: AppColors.g25Color, fontSize: 25),
                ),
                Text(
                  S.of(context).ofSavings,
                  style: AppTextStyles.title2.copyWith(
                    color: AppColors.g25Color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createSubTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).achieveYourDreams,
                  style: AppTextStyles.normal4.copyWith(
                    color: AppColors.g50Color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formData(BuildContext context, GoalsState state) {
    return Container(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _selectEmoji(context, state),
            SizedBox(height: 35.0),
            state.goalData.goalName.length > 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 10, left: 5),
                    child: Row(
                      children: [
                        Text(S.of(context).whatIsYourGoal,
                            style: AppTextStyles.normal4
                                .copyWith(color: AppColors.g75Color))
                      ],
                    ),
                  )
                : Container(),
            _createNameField(context, state),
            SizedBox(
              height: 5,
            ),
            state.goalData.totalValue > 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 10, left: 5),
                    child: Row(
                      children: [
                        Text(S.of(context).howMuchIsYourGoal,
                            style: AppTextStyles.normal4
                                .copyWith(color: AppColors.g75Color))
                      ],
                    ),
                  )
                : Container(),
            _createValueField(context, state),
            SizedBox(
              height: 30,
            ),
            _createSelectPeriodicity2(context),
            SizedBox(
              height: 25,
            ),
            (state.goalData.feeValue > 0 && state.goalData.feeValue != null)
                ? Container(
                    margin: EdgeInsets.only(bottom: 5, left: 5),
                    child: Row(
                      children: [
                        Text(S.of(context).feeTextHint,
                            style: AppTextStyles.normal4
                                .copyWith(color: AppColors.g75Color))
                      ],
                    ),
                  )
                : Container(),
            _createFieldSlider(context, state),
            SizedBox(
              height: 15,
            ),
            Container(
                width: double.infinity,
                child: _buttonShowChart(
                    S.of(context).buttonShowChart, state, context)),
            SizedBox(
              height: 70,
            ),
            _createChart(state),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSelectPeriodicity2(BuildContext context) {
    //Crea los menuItems
    List<DropdownMenuItem<String>> items = [];
    for (String item in listPeriodicity) {
      items.add(DropdownMenuItem<String>(
        child: Text(item,
            style: AppTextStyles.normal1.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.g25Color)),
        value: item,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Label

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
              value: listPeriodicity[selectedPeriodicity],
              items: items.toList(),
              onChanged: (value) {
                FocusScope.of(context).requestFocus(new FocusNode());
                print("Algo: ${listPeriodicity.indexOf(value)}");
                context.bloc<GoalsBloc>().add(GoalsEvent.updatePeriodicity(
                    listPeriodicity.indexOf(value)));
                setState(() {
                  selectedPeriodicity = listPeriodicity.indexOf(value);
                });
              }),
        ),
      ],
    );
  }

  Widget _selectEmoji(BuildContext context, GoalsState state) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 50,
            height: 50,
            child: state.goalData.emoji.isEmpty
                ? FlatButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/noImage.png"),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context)=>EmojiPickerWidget(
                              controller: _emojiController));
                    },
                  )
                : Text(
                    parser.emojify(state.goalData.emoji),
                    style: TextStyle(fontSize: 33),
                  ),
          ),
          //Cual emoji se parece....
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FlatButton(
                child: Text(
                  state.goalData.emoji.isEmpty
                      ? S.of(context).selectEmoji
                      : S.of(context).changeEmoji,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.g50Color,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context)=> EmojiPickerWidget(controller: _emojiController))
                       ;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createNameField(BuildContext context, GoalsState state) {
    var textField = S.of(context).whatIsYourGoal;
    return Column(
      children: <Widget>[
        Container(
          child: TextFormField(
            maxLengthEnforced: true,
            maxLength: 30,
            autocorrect: false,
            inputFormatters: [
              new FilteringTextInputFormatter.allow(
                  RegExp("[a-zA-ZÁÉÍÓÚáéíóúñÑ ]"))
            ],
            controller: _controllerName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              contentPadding: EdgeInsets.only(left: 20),
              counterStyle: TextStyle(color: Colors.transparent),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.successColor),
              hintStyle: AppTextStyles.normal4.copyWith(
                color: AppColors.g25Color,
              ),
              // hintStyle: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.normal,
              //     fontFamily: 'open-sans-regular',
              //     color: AppColors.g25Color),
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
            onChanged: (value) {
              context.bloc<GoalsBloc>().add(GoalsEvent.updateName(value));
            },
            validator: (String value) {
              return state.nameError ? S.of(context).goalNameError : null;
            },
          ),
        ),
      ],
    );
  }

  bool isNumber(String value) {
    if (value == null) {
      return true;
    }
    final n = num.tryParse(value);
    return n != null;
  }

  Widget _createValueField(BuildContext context, GoalsState state) {
    var textField = S.of(context).howMuchIsYourGoal;
    return Column(
      children: <Widget>[
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            getIt<IEnv>().isColombia()
                ? MoneyTextInputFormatter()
                : MoneyTextInputFormatterMx()
          ],
          controller: _controllerValue,
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          textAlign: TextAlign.start,
          focusNode: focusInput,
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
          // onSaved: (value) => valueGoal = value,
          onChanged: (value) {
            print("Value: $value");
            dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));

            if (isNumber("${dValue}")) {
              if (!getIt<IEnv>().isColombia()) {
                dValue = dValue / 100;
              }
              context.bloc<GoalsBloc>().add(GoalsEvent.updateAmount(dValue));
            }
            context.bloc<GoalsBloc>().add(GoalsEvent.updateAmount(dValue));
          },
          validator: (String value) {
            dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));

            if (dValue == null) {
              dValue = 0;
            }
            return dValue == null || (dValue < minMoneyValue && dValue > 0)
                ? getIt<IEnv>().isColombia()
                    ? S.of(context).goalAmountError
                    : S.of(context).goalAmountErrorMx
                : null;
          },
        ),
      ],
    );
  }

  Widget _createChart(GoalsState state) {
    List<Map<double, double>> lst = List<Map<double, double>>();

    List<Color> lineColors = List<Color>();
    lineColors.add(AppColors.dangerColor);
    lineColors.add(AppColors.primaryColor);
    lst.add(state.dataOtros);
    lst.add(state.dataUalet);
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
          state.showChart &&
                  dValue >= minMoneyValue &&
                  state.goalData.feeValue >= minGoalFeeValue &&
                  state.goalData.feeValue <= state.goalData.totalValue
              ? ChartWidget(
                  //Chart
                  titleX: state.lx,
                  titleY: state.ly,
                  data: lst,
                  lineColors: lineColors,
                  numberDataX: state.maxX,
                  numberDataY: state.maxY)
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
          state.showChart
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
                  Text(S.of(context).cuotes, style: AppTextStyles.normal4),
                  Expanded(child: SizedBox()),
                  Text(
                    "${getIt<IEnv>().isColombia() ? formatedNumber(state.goalData.feeValue) : formatedNumber(state.goalData.feeValue)} ",
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
                  state.showChart //Si muestra la grafica, muestra el numero de meses calculado, de lo contrario -
                      ? Text(
                          state.goalData.numMonths == 1
                              ? "${state.goalData.numMonths} " +
                                  S.of(context).month
                              : "${state.goalData.numMonths} " +
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
                  state.showChart //Si muestra la grafica, muestra el numero de meses calculado, de lo contrario -
                      ? Text(
                          state.monthsOthers == 1
                              ? "${state.monthsOthers} " + S.of(context).month
                              : "${state.monthsOthers} " + S.of(context).months,
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

  Widget _createFieldSlider(BuildContext context, GoalsState state) {
    var textField = S.of(context).feeTextHint;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            MoneyTextInputFormatter()
          ],

          keyboardType: TextInputType.number,
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
          // onSaved: (value) => valueGoal = value,
          onChanged: (value) {
            print("Value: $value");
            dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));

            if (!getIt<IEnv>().isColombia()) {
              dValue = dValue / 100;
            }

            context.bloc<GoalsBloc>().add(GoalsEvent.updateSavings(dValue));
          },
          validator: (String value) {
            var error = null;
            dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));

            if (dValue == null) {
              dValue = 0;
            }

            if (isNumber("${dValue}")) {
              if (!getIt<IEnv>().isColombia()) {
                dValue = dValue / 100;
              }
            }

            if (dValue == null || (dValue < minMoneyValue && dValue > 0)) {
              error = getIt<IEnv>().isColombia()
                  ? S.of(context).goalAmountErrorAmount
                  : S.of(context).goalAmountErrorMx;
            }

            if (dValue == null || (dValue > state.goalData.totalValue)) {
              error = S.of(context).goalvalueGreater;
            }
            return error;
          },
        ),
      ],
    );
  }

  Widget _button(String nameButton, GoalsState state, BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(nameButton,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 14.0)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      color: AppColors.backgroundSplashTopColor,
      disabledColor: AppColors.bgButtonDisabled,
      textColor: AppColors.whiteColor,
      // onPressed: state.buttonActivated ? () => _enviar(state) : null,
      onPressed: dValue >= minMoneyValue &&
              state.goalData.feeValue >= minGoalFeeValue &&
              state.goalData.feeValue <= state.goalData.totalValue &&
              selectedPeriodicity > 0
          ? () async {
              if (widget.validNewGoal) {
                getIt<IFireBaseEventLogger>().goalNew({
                  "Price": state.goalData.totalValue.toString(),
                  "Currency": "COP",
                  "nombre_Meta": state.goalData.goalName
                });

                //AppsFlyer 02
                getIt<IAppsFlyerEventLogger>()
                    .logEvent(AFEvents.CREAR_META_NEW, {
                  "price": state.goalData.totalValue.toString(),
                  "af_currency": 'COP',
                  "nombre_Meta": state.goalData.goalName
                });
              } else {
                getIt<IFireBaseEventLogger>().goalCreate({
                  "Price": state.goalData.totalValue.toString(),
                  "Currency": "COP",
                  "nombre_Meta": state.goalData.goalName
                });

                //AppsFlyer 18
                getIt<IAppsFlyerEventLogger>().logEvent(AFEvents.META_CREADA, {
                  "price": state.goalData.totalValue.toString(),
                  "af_currency": 'COP',
                  "nombre_Meta": state.goalData.goalName
                });
              }

              if (state.goalData.emoji.length != 0) {
                if (!widget.isMigration) {
                  context
                      .bloc<GoalsBloc>()
                      .add(GoalsEvent.postGoal(state.goalData));
                } else {
                  context
                      .bloc<GoalsBloc>()
                      .add(GoalsEvent.postGoalMigration(state.goalData));
                }
              } else {
                GoalItem sentGoal =
                    state.goalData.copyWith(emoji: ":moneybag:");
                if (!widget.isMigration) {
                  context.bloc<GoalsBloc>().add(GoalsEvent.postGoal(sentGoal));
                } else {
                  context
                      .bloc<GoalsBloc>()
                      .add(GoalsEvent.postGoalMigration(sentGoal));
                }
              }
            }
          : null,
    );
  }

  Widget _buttonShowChart(
      String nameButton, GoalsState state, BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.only(bottom: 5, top: 5),
        child: Text(nameButton,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 16.0)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      color: AppColors.backgroundSplashTopColor,
      disabledColor: AppColors.bgButtonDisabled,
      textColor: AppColors.whiteColor,
      onPressed: dValue >= minMoneyValue &&
              state.goalData.feeValue >= minGoalFeeValue &&
              state.goalData.feeValue <= state.goalData.totalValue
          ? () {
              context.bloc<GoalsBloc>().add(GoalsEvent.validShowChart());
            }
          : null,
    );
  }
}
