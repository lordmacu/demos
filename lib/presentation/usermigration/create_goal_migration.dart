import 'dart:math';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';

import 'package:ualet/application/goals/edit_goal/edit_goals_bloc.dart';
import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/to_be_refactor/widgets/chart_widget.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/to_be_refactor/widgets/emoji_picker_widget.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:intl/intl.dart';
import 'package:ualet/to_be_refactor/widgets/slider_widget_onSaved.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:kt_dart/kt.dart';

class CreateGoalMigration extends StatefulWidget {
  final KtList<UserMigrationItem> debits;
  final int periodicity;
  final UserMigrationInfo userMigrationInfo;
  final BalanceItem balance;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  final UserMigrationBloc blocc;
  CreateGoalMigration({
    Key key,
    @required this.debits,
    @required this.goalQuincenal,
    @required this.goalMensual,
    @required this.goalTrimestral,
    @required this.goalPse,
    @required this.userMigrationInfo,
    @required this.balance,
    this.quincenalDone = false,
    this.mensualDone = false,
    this.trimestralDone = false,
    this.pseDone = false,
    this.periodicity = 1,
    @required this.blocc,
  }) : super(key: key);

  @override
  _CreateGoalMigration createState() => _CreateGoalMigration();
}

class _CreateGoalMigration extends State<CreateGoalMigration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sliderController = MoneyMaskedTextController(
      precision: 0,
      decimalSeparator: '',
      thousandSeparator: '.',
      initialValue: 10000.0);
  final _emojiController = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerValue = MoneyMaskedTextController(
      precision: 0, decimalSeparator: '', thousandSeparator: '.');

  final focusInput = FocusNode();

  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  // String name = '';
  // Map<double, String> lx = {};
  // Map<double, String> ly = {};
  // int monthBank = 0;
  // String _valueMonth = '';
  // String valueGoal = '';
  // String _emoji = '';
  // double _maxX = 0;
  // double _maxY = 0;
  int selectedPeriodicity = 1;
  final listPeriodicity = ['None', 'Quincenal', 'Mensual', 'Trimestral'];

  String isNameValid(String s) {
    return getIt<EditGoalsBloc>().state.nameError ? "Nel" : null;
  }

  double amt = 0;
  var parser = EmojiParser();
  @override
  void dispose() {
    _sliderController?.dispose();
    _emojiController?.dispose();
    _controllerName?.dispose();
    _controllerValue?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.debits.forEach((item) {
      amt += item.value;
    });
    selectedPeriodicity = widget.periodicity < 4 ? widget.periodicity : 1;
    _sliderController.text = amt.toStringAsFixed(2);
    // _sliderController.addListener(_printChart);
    // _emojiController.addListener(_printEmoji);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditGoalsBloc>(
      create: widget.periodicity < 4
          ? (context) => getIt<EditGoalsBloc>()
            ..add(EditGoalsEvent.updatePeriodicity(
                widget.debits.get(0).periodicity))
            ..add(EditGoalsEvent.updateSavings(amt))
            ..add(EditGoalsEvent.forceShowChart())
            ..add(EditGoalsEvent.flagMigration(true))
          : (context) =>
              getIt<EditGoalsBloc>()..add(EditGoalsEvent.flagMigration(true)),
      child: BlocListener<EditGoalsBloc, EditGoalsState>(
        listener: (context, state) {
          state.createFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
              (failure) => ToastHelper.createError(
                  message: failure.map(
                      unexpected: (_) => 'Unexpected',
                      fromServer: (failure) => failure.message)).show(context),
              (result) {
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.goalCreationSummary,
                  arguments: GoalCreationSummaryArguments(
                    mensualDone: isPeriodicity(2) ? true : widget.mensualDone,
                    quincenalDone:
                        isPeriodicity(1) ? true : widget.quincenalDone,
                    trimestralDone:
                        isPeriodicity(3) ? true : widget.trimestralDone,
                    pseDone: isPeriodicity(4) ? true : widget.pseDone,
                    goalMensual:
                        isPeriodicity(2) ? state.goalData : widget.goalMensual,
                    goalQuincenal: isPeriodicity(1)
                        ? state.goalData
                        : widget.goalQuincenal,
                    goalTrimestral: isPeriodicity(3)
                        ? state.goalData
                        : widget.goalTrimestral,
                    goalPse: isPeriodicity(4) ? state.goalData : widget.goalPse,
                    userMigrationInfo: widget.userMigrationInfo,
                    debits: widget.debits.asList(),
                    goalCreated: state.goalData,
                    periodicity: widget.periodicity,
                    balance: widget.balance,
                  ),
                );
              },
            ),
          );
        },
        child: BlocBuilder<EditGoalsBloc, EditGoalsState>(
          builder: (context, state) {
            _emojiController.addListener(() {
              context
                  .bloc<EditGoalsBloc>()
                  .add(EditGoalsEvent.updateEmoji(_emojiController.text));
            });
            _sliderController.addListener(() {
              // context.bloc<EditGoalsBloc>().add(EditGoalsEvent.updateSavings(
              //     double.tryParse(_sliderController.text.replaceAll(",", ""))));
              context.bloc<EditGoalsBloc>().add(
                  EditGoalsEvent.updateSavings(_sliderController.numberValue));
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
              child: Container(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 1.0),
                    child: IntrinsicHeight(child: _contentPage(context, state)),
                  ),
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
            left: AppDimens.layoutMargin,
            right: AppDimens.layoutMargin,
            top: AppDimens.layoutSpacerXs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
            ],
          ),
        ),
        //content
        Expanded(
          flex: 5,
          child: Column(
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
                      height: AppDimens.layoutSpacerS,
                    ),
                    widget.periodicity < 4
                        ? _createSubTitle(selectedPeriodicity)
                        : Container(),
                    widget.periodicity < 4
                        ? SizedBox(
                            height: 40,
                          )
                        : Container(),
                    _formData(context, state),
                  ],
                ),
              ),
            ],
          ),
        ),
        //Button
        Expanded(
          flex: 1,
          child: Padding(
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
          ),
        )
      ],
    );
  }

  Widget _createTitle() {
    return Container(
      // padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.periodicity < 4
                      ? S.of(context).migrationDetailTitle
                      : S.of(context).createFirstGoal,
                  style: AppTextStyles.subtitle2.copyWith(
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

  Widget _createSubTitle(periodicity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTitle(periodicity, context),
          style: AppTextStyles.subtitle2.copyWith(
            color: AppColors.g75Color,
          ),
        ),
        Text(
          "${widget.debits.size}/${widget.debits.size}",
          style: AppTextStyles.subtitle2.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
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
          SizedBox(height: 15.0),
          _createNameField(context, state),
          SizedBox(height: 5),
          _createValueField(context, state),
          SizedBox(
            height: 26,
          ),
          _createChart(state),
          _buttonShowChart(S.of(context).buttonShowChart, state, context),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          _createSelectPeriodicity2(context),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          widget.periodicity < 4
              ? _createFeeField(context)
              : _createFieldSlider(),
        ],
      ),
    ));
  }

  Widget _buttonShowChart(
      String nameButton, EditGoalsState state, BuildContext context) {
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
      onPressed: state.buttonActivated
          ? () {
              context
                  .bloc<EditGoalsBloc>()
                  .add(EditGoalsEvent.validShowChart(0, 0));
            }
          : null,
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
              disabledHint: Text(listPeriodicity[selectedPeriodicity]),
              underline: Container(),
              icon: Icon(
                Icons.expand_more,
                color: AppColors.primaryColor,
                size: 20,
              ),
              value: listPeriodicity[selectedPeriodicity],
              items: items.toList(),
              onChanged: widget.periodicity < 4
                  ? null
                  : (value) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      print("Algo: ${listPeriodicity.indexOf(value)}");
                      context.bloc<EditGoalsBloc>().add(
                          EditGoalsEvent.updatePeriodicity(
                              listPeriodicity.indexOf(value)));
                      setState(() {
                        selectedPeriodicity = listPeriodicity.indexOf(value);
                      });
                    }),
        ),
      ],
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
          Container(
            width: MediaQuery.of(context).size.width -
                AppDimens.layoutMargin -
                AppDimens.layoutSpacerM -
                AppDimens.layoutMargin -
                AppDimens.layoutMargin -
                20,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FlatButton(
                child: Text(
                  S.of(context).whichEmojiSuitsYourGoal,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.g50Color,
                      fontSize: 14.0,
                      fontFamily: 'open-sans-light',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                      new EmojiPickerWidget(controller: _emojiController));
                },
              ),
            ),
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
          height: 110,
          child: CustomTextFormField(
            maxLength: 30,
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                  RegExp("[0-9!/\\\\().,;:_*´{}<>&%#\"\'¡?¿|!=+@`]"))
            ],
            controller: _controllerName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              contentPadding: EdgeInsets.only(left: 20),
              //TODO: Que hace esto?
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
              counterStyle: TextStyle(color: Colors.transparent),
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

  /**
   * Crea el field del valor de la meta
   */
  Widget _createValueField(BuildContext context, EditGoalsState state) {
    var textField = S.of(context).howMuchIsYourGoal;
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: KeyboardActions(
            config: KeyboardActionsConfig(
              keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
              keyboardBarColor: Colors.grey[200],
              nextFocus: true,
              actions: [
                KeyboardActionsItem(
                  displayDoneButton: true,
                  focusNode: focusInput,
                ),
              ],
            ),
            child: CustomTextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _controllerValue,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.start,
              focusNode: focusInput,
              decoration: InputDecoration(
                hoverColor: AppColors.g25Color,
                fillColor: AppColors.inputColor,
                filled: true,
                hintText: textField,
                prefixText: r'$ ',
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
                // double dValue = double.tryParse(
                //         value.replaceAll(",", "").replaceAll(".", "")) /
                //     100;
                double dValue = _controllerValue.numberValue;

                print("DValue: $dValue");
                context
                    .bloc<EditGoalsBloc>()
                    .add(EditGoalsEvent.updateAmount(dValue));
                // _controllerValue.text = dValue.toStringAsFixed(2);
              },
              validator: (String value) {
                return state.amountError ? S.of(context).goalAmountError : null;
              },
            ),
          ),
        ),
      ],
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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.dialogBorderRadius),
          ),
          color: AppColors.whiteColor), //Fondo
      child: Column(
        children: <Widget>[
          state.showChart && state.buttonActivated
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
                    "${formatCurrency.format(state.goalData.fee)}",
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
                          "${state.goalData.numMonths} " + S.of(context).months,
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
                          "${state.monthsOthers} " + S.of(context).months,
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

  Widget _button(
      String nameButton, EditGoalsState state, BuildContext context) {
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
      onPressed: state.buttonActivated &&
              _controllerValue.numberValue >= Values.minGoalAmount &&
              state.goalData.name != ''
          ? ()  async{
              // context
              //     .bloc<EditGoalsBloc>()
              //     .add(EditGoalsEvent.postGoal(state.goalData));
              widget.blocc.add(UserMigrationEvent.saveGoal(
                  state.goalData, isPeriodicity(4)));
              await getIt<IAppsFlyerEventLogger>().logEvent(AFEvents.META_CREADA, {});


              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.goalCreationSummary,
                arguments: GoalCreationSummaryArguments(
                  mensualDone: isPeriodicity(2) ? true : widget.mensualDone,
                  quincenalDone: isPeriodicity(1) ? true : widget.quincenalDone,
                  trimestralDone:
                      isPeriodicity(3) ? true : widget.trimestralDone,
                  pseDone: isPeriodicity(4) ? true : widget.pseDone,
                  goalMensual:
                      isPeriodicity(2) ? state.goalData : widget.goalMensual,
                  goalQuincenal:
                      isPeriodicity(1) ? state.goalData : widget.goalQuincenal,
                  goalTrimestral:
                      isPeriodicity(3) ? state.goalData : widget.goalTrimestral,
                  goalPse: isPeriodicity(4) ? state.goalData : widget.goalPse,
                  userMigrationInfo: widget.userMigrationInfo,
                  debits: widget.debits.asList(),
                  goalCreated: state.goalData,
                  periodicity: widget.periodicity,
                  balance: widget.balance,
                ),
              );
            }
          : null,
    );
  }

  /**
   * Crea el field del valor de la meta
   */
  Widget _createFeeField(BuildContext context) {
    var textField = S.of(context).cuota;
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: CustomTextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            enabled: false,
            readOnly: true,
            initialValue: "${formatCurrency.format(amt)}",
            keyboardType: TextInputType.number,
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
          ),
        ),
      ],
    );
  }

  Widget _createFieldSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // _labelTextField(S.of(context).youCuote),
        SliderWidgetOnSaved(
          initialValue: 0.0,
          controller: _sliderController,
          min: 10000.0,
          max: 1200000.0,
          labels: ['0', '100,000', '400,000', '1,000,000'],
        ),
      ],
    );
  }

  String getTitle(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).quincenalDebits;
        break;
      case 2:
        return S.of(context).monthlyDebits;
        break;
      case 3:
        return S.of(context).trimestralDebits;
      default:
        return "";
    }
  }

  bool isPeriodicity(int periodicity) {
    return periodicity == widget.periodicity;
  }
}
