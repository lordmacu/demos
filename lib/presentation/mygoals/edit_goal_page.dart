import 'package:ualet/application/goals/edit_goal/edit_goals_bloc.dart';
import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/investing/widgets/investing_popup_dialog.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/mygoals/popups/debit_recalculated_multiple_goals.dart';
import 'package:ualet/presentation/mygoals/popups/debit_recalculated_popup.dart';
import 'package:ualet/presentation/mygoals/popups/goal_recalculated_popup.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/widgets/slider_widget_deactivated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/domain/goals/goal_item.dart';
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
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:intl/intl.dart';
import 'package:ualet/to_be_refactor/widgets/slider_widget_onSaved.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

import 'popups/delete_goal_dialog.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter_mx.dart';

class EditGoalPage extends StatefulWidget {
  final DashboardGoal goal;
  final List<DashboardGoal> relatedGoals;
  final DebitInfo relatedDebit;
  final WithdrawalInfo info;
  EditGoalPage({
    Key key,
    @required this.goal,
    this.relatedGoals,
    this.relatedDebit,
    this.info,
  }) : super(key: key);

  @override
  _EditGoalPage createState() => _EditGoalPage();
}

class _EditGoalPage extends State<EditGoalPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sliderController =  TextEditingController();
  final _emojiController = TextEditingController();
  final _controllerValue = TextEditingController();
  final _controllerName = TextEditingController();
  SharedPreferences _prefs = getIt<SharedPreferences>();

  NumberFormat formater = NumberFormaters.copFormater;

  final coFormatter = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  int selectedPeriodicity = 1;
  double dValue = 0;
  final listPeriodicity = [
    'Periodicidad',
    'Quincenal',
    'Mensual',
    'Trimestral'
  ];

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

  String isNameValid(String s) {
    return getIt<EditGoalsBloc>().state.nameError ? "Nel" : null;
  }

  var parser = EmojiParser();
  @override
  void dispose() {
    _sliderController?.dispose();
    _emojiController?.dispose();
    _controllerName?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controllerName.text = widget.goal.name; //Nombre
    selectedPeriodicity = widget.goal.periodicity; //Periodo
    _sliderController.text =
        formatedNumber(widget.goal.fee); //Valor de Cuota - Slider
    dValue = widget.goal.fee; //Valor de Cuota Campo
    _controllerValue.text =
        formatedNumber(widget.goal.goalAmt); // Total de meta.

    print("aqui el goadsfasdf asdfasdl ${formatedNumber(widget.goal.goalAmt)}  ${getIt<IEnv>().isColombia()}   ${widget.goal.goalAmt}");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditGoalsBloc>(
          create: (context) =>
              getIt<EditGoalsBloc>()..add(EditGoalsEvent.setGoal(widget.goal)),
        ),
      ],
      child: BlocListener<EditGoalsBloc, EditGoalsState>(
        listener: (context, state) {
          state.postFailureOrSuccess.fold(
              () {},
              (either) => either.fold(
                  (failure) => ToastHelper.createError(
                          message: failure.map(
                              unexpected: (_) => 'Unexpected',
                              fromServer: (failure) => failure.message))
                      .show(context),
                  (result) async {}));
          state.deleteGoalOrFailure.fold(() {}, (either) {
            either.fold((l) {
              ToastHelper.createError(
                  message: l.map(
                      unexpected: (_) => 'Unexpected',
                      fromServer: (failure) => failure.message)).show(context);
            }, (r) {
              ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                Routes.homePage,
                (route) => route.isFirst,
              );
            });
          });
        },
        child: BlocBuilder<EditGoalsBloc, EditGoalsState>(
          builder: (context, state) {
            _emojiController.addListener(() {
              context
                  .bloc<EditGoalsBloc>()
                  .add(EditGoalsEvent.updateEmoji(_emojiController.text));
            });
            return _buildRoot(context, state);
          },
        ),
      ),
    );
  }

  Scaffold _buildRoot(BuildContext context, EditGoalsState state) {
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

  Widget _contentPage(BuildContext context, EditGoalsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: AppDimens.layoutSpacerS,
            top: AppDimens.layoutSpacerM,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: AppColors.primaryColor,
            alignment: Alignment.topLeft,
            tooltip: "Volver",
            onPressed: () => ExtendedNavigator.rootNavigator.pop(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.layoutMargin, right: AppDimens.layoutMargin),
              child: Column(
                children: <Widget>[
                  _createTitle(),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  _formData(context, state),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 44, bottom: 40, right: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 45.0,
                child: _button(S.of(context).saveChanges, state, context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).editGoal,
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

  Widget _formData(BuildContext context, EditGoalsState state) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _selectEmoji(context, state),
            SizedBox(height: 10.0),
            _createNameField(context, state),
            _createValueField(context, state),
            SizedBox(
              height: 26,
            ),
            _createSelectPeriodicity2(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _createFeeField(context, state),
            SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            //_buttonShowChart(S.of(context).buttonShowChart, state, context),
            // SizedBox(
            //   height: AppDimens.layoutSpacerL,
            // ),
            _createChart(state),
            SizedBox(
              height: AppDimens.layoutSpacerX,
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectEmoji(BuildContext context, EditGoalsState state) {
    var emoji = state.goalData.emoji.contains(":")
        ? state.goalData.emoji
        : ":${state.goalData.emoji}:";

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 40,
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
                          builder: (BuildContext context) =>  new EmojiPickerWidget(
                              controller: _emojiController));
                    },
                  )
                : Text(
                    parser.emojify(emoji),
                    style: TextStyle(fontSize: 33),
                  ),
          ),
          //Cual emoji se parece....
          FlatButton(
            child: Text(
              S.of(context).changeEmoji,
              style: AppTextStyles.normalUnder1.copyWith(
                color: AppColors.g50Color,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>  new EmojiPickerWidget(controller: _emojiController));
            },
          ),
        ],
      ),
    );
  }

  Widget _createNameField(BuildContext context, EditGoalsState state) {
    var textField = S.of(context).whatIsYourGoal;
    return Column(
      children: <Widget>[
        Container(
          child: CustomTextFormField(
            maxLength: 30,
            inputFormatters: [
              new FilteringTextInputFormatter.allow(
                  RegExp("[a-zA-ZÁÉÍÓÚáéíóúñÑ ]"))
            ],
            controller: _controllerName,
            keyboardType: TextInputType.text,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              counterStyle: TextStyle(
                color: Colors.transparent,
              ),
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              contentPadding: EdgeInsets.only(left: 20),
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
              context
                  .bloc<EditGoalsBloc>()
                  .add(EditGoalsEvent.updateName(value));
            },

            // validator: utils.validateEmpty,
            validator: (String value) {
              return state.nameError ? S.of(context).goalNameError : null;
            },
          ),
        ),
      ],
    );
  }

  Widget _createValueField(BuildContext context, EditGoalsState state) {
    var textField = S.of(context).howMuchIsYourGoal;
    return Column(
      children: <Widget>[
        CustomTextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            getIt<IEnv>().isColombia()
                ? MoneyTextInputFormatter()
                : MoneyTextInputFormatterMx()
          ],
          controller: _controllerValue,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: textField,
          ),
          // onSaved: (value) => valueGoal = value,
          onChanged: (value) {
            print("Value: $value");
            double dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));
            print("DValue: $dValue");
            if (dValue != null) {

              if(!getIt<IEnv>().isColombia()){
                dValue=dValue/100;
              }
              context
                  .bloc<EditGoalsBloc>()
                  .add(EditGoalsEvent.updateAmount(dValue));
            }
          },
          validator: (String value) {
            print("Value: $value");
            double dValue = double.tryParse(value
                .replaceAll("\$", "")
                .replaceAll(".", "")
                .replaceAll(",", "")
                .replaceAll(" ", ""));

            if (dValue != null && dValue < 100000) {
              return state.amountError ? S.of(context).goalAmountError : null;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget _createSelectPeriodicity2(BuildContext context) {
    //Crea los menuItems
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
    String deactivatedText = S.of(context).periodicityDeactivatedSubtitle;
    if (widget.goal.migrate)
      deactivatedText = S.of(context).periodicityDeactivatedSubtitle2;
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
              disabledHint: Text(listPeriodicity[selectedPeriodicity]),
              underline: Container(),
              icon: Icon(
                Icons.expand_more,
                color: AppColors.primaryColor,
                size: 20,
              ),
              value: listPeriodicity[selectedPeriodicity],
              items: items.toList(),
              onChanged: widget.relatedGoals.length == 0 && !widget.goal.migrate
                  ? (value) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      context.bloc<EditGoalsBloc>().add(
                          EditGoalsEvent.updatePeriodicity(
                              listPeriodicity.indexOf(value)));
                      setState(() {
                        selectedPeriodicity = listPeriodicity.indexOf(value);
                      });
                    }
                  : null),
        ),
        SizedBox(height: AppDimens.layoutSpacerS),
        widget.relatedGoals.length != 0 || widget.goal.migrate
            ? Text(
                deactivatedText,
                style:
                    AppTextStyles.caption1.copyWith(color: AppColors.infoColor),
              )
            : Container(),
      ],
    );
  }

  Widget _createFeeField(BuildContext context, state) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        getIt<IEnv>().isColombia()
            ? MoneyTextInputFormatter()
            : MoneyTextInputFormatterMx()
      ],
      controller: _sliderController,
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      textAlign: TextAlign.start,
     // focusNode: focusInput,
      decoration: InputDecoration(
        hoverColor: AppColors.g25Color,
        fillColor: AppColors.inputColor,
        filled: true,
        hintText: S.of(context).feeTextHint,
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
      onChanged: (value)  {
        double dValue = double.tryParse(
            value.replaceAll("\$", "").replaceAll(".", "").replaceAll(",", "").replaceAll(" ", ""));
        if (dValue != null && value != "") {


          if(!getIt<IEnv>().isColombia()){
            dValue=dValue/100;
          }


          context
              .bloc<EditGoalsBloc>()
              .add(EditGoalsEvent.updateSavings(dValue));
        }
      },
      validator: (String value) {
        if (value == "") {
          return getIt<IEnv>().isColombia()
              ? S.of(context).editGoalMinFee
              : S.of(context).editGoalMinFeeMx;
      }
      }
    );
  }

  Widget _createChart(EditGoalsState state) {
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
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                offset: Offset(0, 4),
                spreadRadius: 0.5,
                blurRadius: 8.0),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.dialogBorderRadius),
          ),
          color: AppColors.whiteColor), //Fondo
      child: Column(
        children: <Widget>[
          state.showChart // && state.buttonActivated
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
                  Text(S.of(context).monthyCuote, style: AppTextStyles.normal4),
                  Expanded(child: SizedBox()),
                  Text(

                    "${getIt<IEnv>().isColombia() ? formatedNumber(state.goalData.fee) : formatedNumber(state.goalData.fee)} ",

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

  Widget _createFieldSlider() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // _labelTextField(S.of(context).youCuote),
          SliderWidgetOnSaved(
            initialValue: widget.goal.fee,
            controller: _sliderController,
            min: 10000.0,
            max: 1000000.0,
            labels: ['0', '200.000', '500.000', '1.000.000'],
          ),
        ],
      ),
    );
  }

  Widget _buttonShowChart(
      String nameButton, EditGoalsState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.layoutSpacerM,
        right: AppDimens.layoutSpacerM,
        top: AppDimens.layoutSpacerS,
      ),
      child: SecondaryButton(
          text: nameButton,
          action: state.showChart
              ? () {
                  context.bloc<EditGoalsBloc>().add(
                      EditGoalsEvent.validShowChart(
                          dValue, selectedPeriodicity));
                }
              : null),
    );
  }

  Widget _button(
      String nameButton, EditGoalsState state, BuildContext context) {
    double dValue = double.tryParse(_controllerValue.value.text
        .replaceAll("\$", "")
        .replaceAll(".", "")
        .replaceAll(",", "")
        .replaceAll(" ", ""));
    double goalValue = 0.0;
    if (dValue != null) {
      if(!getIt<IEnv>().isColombia()){
        dValue=dValue/100;
      }
      goalValue = dValue;
    }

    double validAmount = 0;
    if (getIt<IEnv>().isColombia()) {
      validAmount = 100000.00;
    } else {
      validAmount = 100.00;
    }

    return RaisedButton(
      child: Container(
        child: Text("${nameButton}",
            style: TextStyle(color: AppColors.whiteColor, fontSize: 14.0)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      color: AppColors.backgroundSplashTopColor,
      disabledColor: AppColors.bgButtonDisabled,
      textColor: AppColors.whiteColor,
      onPressed: (goalValue >= validAmount)
          ? () async {
              getIt<IFireBaseEventLogger>().debitEditValue();

              getIt<IFireBaseEventLogger>().goalEditAdd({
                "Price": state.goalData.goalAmt,
                "Currency": "COP",
                "Nombre Meta": state.goalData.name
              });

              await getIt<IAppsFlyerEventLogger>()
                  .logEvent(AFEvents.COMPLETE_REGISTRATION, {});

              print(state.goalData);
              print(state.oldGoal);
              bool reject = false;

              if (((state.oldGoal.fee != state.goalData.fee) ||
                  (state.oldGoal.goalAmt != state.goalData.goalAmt) ||
                  (state.oldGoal.periodicity != state.goalData.periodicity))) {
                //Muestra el popup de meta recalculada.
                bool feeChanged = widget.goal.fee != state.goalData.fee &&
                    (widget.relatedDebit == null ||
                        widget.relatedDebit.id == -1);
                bool periodicityChanged =
                    widget.goal.periodicity != state.goalData.periodicity;
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>  Container(
                        child: GoalRecalculatedPopup(
                      feeChanged: feeChanged,
                      periodicityChanged: periodicityChanged,
                      state: InvestingMxMainState.initial().copyWith(
                        goal: state.goalData,
                        oldMonths: state.oldGoal.numMonths,
                        initialDate: DateTime.now(),
                        oldFee: state.oldGoal.fee,
                        oldPeriodicity: state.oldGoal.periodicity,
                        periodicityList: [],
                      ),
                      acceptCallBack: () async {
                        getIt<IFireBaseEventLogger>().goalEditConfirm();

                        ExtendedNavigator.rootNavigator.pop();
                        GoalItem item = GoalItem(
                          createdDate: state.goalData.created,
                          emoji: state.goalData.emoji,
                          feeValue: state.goalData.fee,
                          goalName: state.goalData.name,
                          id: state.goalData.id,
                          numMonths: state.goalData.numMonths,
                          periodicity: state.goalData.periodicity,
                          totalValue: state.goalData.goalAmt,
                        );
                        var response = await getIt<IGoalsRepository>()
                            .editGoal(state.goalData);
                        response.fold(
                            (l) => ToastHelper.createError(
                                message: l.map(
                                    unexpected: (e) => "Error inesperado",
                                    fromServer: (e) =>
                                        "Error: ${e.message}")).show(context),
                            (r) {
                          ToastHelper.createSuccess(
                            message: S.of(context).toastEditGoalSuccess,
                          ).show(context);

                          Future.delayed(Duration(seconds: 3), () {
                            ExtendedNavigator.rootNavigator
                                .pushNamedAndRemoveUntil(
                              Routes.homePage,
                              (route) => route.isFirst,
                            );
                          });
                        });
                      },
                      undoCallback: () {
                        reject = true;

                        ExtendedNavigator.rootNavigator.pop();
                      },
                    )));
              } else {
                GoalItem item = GoalItem(
                  createdDate: state.goalData.created,
                  emoji: state.goalData.emoji,
                  feeValue: state.goalData.fee,
                  goalName: state.goalData.name,
                  id: state.goalData.id,
                  numMonths: state.goalData.numMonths,
                  periodicity: state.goalData.periodicity,
                  totalValue: state.goalData.goalAmt,
                );
                var response =
                    await getIt<IGoalsRepository>().editGoal(state.goalData);
                response.fold(
                    (l) => ToastHelper.createError(
                            message: l.map(
                                unexpected: (e) => "Error inesperado",
                                fromServer: (e) => "Error: ${e.message}"))
                        .show(context), (r) {
                  ToastHelper.createSuccess(
                    message: S.of(context).toastEditGoalSuccess,
                  ).show(context);

                  Future.delayed(Duration(seconds: 3), () {
                    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                      Routes.homePage,
                      (route) => route.isFirst,
                    );
                  });
                });
              }
            }
          : null,
    );
  }

  showDebitRecalculatedDialog(EditGoalsState state) {
    double now = state.goalData.fee;
    showDialog(
        context: context,
        builder: (BuildContext context) =>  Container(
          child: DebitRecalculatedPopUp(
            before: widget.relatedDebit.value,
            now: now,
            acceptCallBack: () async {
              print("accept() DebitRecalculated");
              // context.bloc<EditDebitBloc>()
              //   ..add(EditDebitEvent.acceptChange());

              var response = await getIt<IGoalsRepository>().editGoalWithDebit(
                  state.goalData,
                  widget.relatedDebit.copyWith(value: state.goalData.fee));
              ExtendedNavigator.rootNavigator.pop();
              bool error = false;
              response.fold((l) {
                error = true;
                ToastHelper.createError(
                        message: l.map(
                            unexpected: (e) => "Error inesperado",
                            fromServer: (e) => "Error: ${e.message}"))
                    .show(context);
                Future.delayed(Duration(seconds: 3), () {
                  ExtendedNavigator.rootNavigator.pop(state);
                });
              }, (r) {
                ToastHelper.createSuccess(message: "Meta Modificada!")
                    .show(context);
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

  showMultiGoalRecalculatedDialog(EditGoalsState state) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>  Container(
          child: DebitRecalculatedMultipleGoalsPopUp(
            goals: widget.relatedGoals,
            primaryGoal: state.goalData,
            acceptCallBack: () async {
              print("accept() DebitRecalculated");
              // context.bloc<EditDebitBloc>()
              //   ..add(EditDebitEvent.acceptChange());
              // var response = await getIt<IGoalsRepository>()
              //     .editGoalWithDebits(state.goalData, widget.relatedDebit);
              var allGoals = [state.goalData];
              allGoals.addAll(widget.relatedGoals);
              double total = state.goalData.fee;
              widget.relatedGoals.forEach((g) => total += g.fee);
              // var response = await getIt<IGoalsRepository>().editDebitWithGoals(
              //     widget.relatedDebit.id,
              //     state.goalData.periodicity,
              //     total,
              //     allGoals);
              var response = await getIt<IGoalsRepository>().editGoalWithDebit(
                  state.goalData,
                  widget.relatedDebit.copyWith(
                    value: total,
                  ));
              ExtendedNavigator.rootNavigator.pop();
              bool error = false;
              response.fold((l) {
                error = true;
                ToastHelper.createError(
                        message: l.map(
                            unexpected: (e) => "Error inesperado",
                            fromServer: (e) => "Error: ${e.message}"))
                    .show(context);
              }, (r) {
                ToastHelper.createSuccess(message: "Metas Modificadas!")
                    .show(context);
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

  bool areEqual(DashboardGoal old, DashboardGoal newGoal) {
    if (old.emoji == newGoal.emoji &&
        old.name == newGoal.name &&
        old.goalAmt == newGoal.goalAmt &&
        old.periodicity == newGoal.periodicity &&
        old.fee == newGoal.fee) {
      return true;
    } else {
      return false;
    }
  }
}
