import 'dart:convert';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';

import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_datetime_picker.dart';
import 'package:ualet/presentation/home/widgets/verify_update_sarlaft_popup.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/valid_transaction_dialog.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar.dart';
import 'package:ualet/router/router.gr.dart';

import 'widgets/add_money_dialog.dart';
import 'widgets/money_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import "package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart";
import 'dart:async';




// ignore: must_be_immutable
class InvestingIntroPage extends HookWidget {
  final _dateController = TextEditingController();

  final bool fromRegister;
  final double valueFromRegister;

  InvestingIntroPage({
    this.fromRegister = false,
    this.valueFromRegister = 0,
  });

  void _listener(){
    if(_myNode.hasFocus){
      // keyboard appeared
    }else{
      // keyboard dismissed


    }
  }

  FocusNode _myNode;



  final formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(locale: 'es_MX', decimalDigits: 2);

  NumberFormat formatter = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  SharedPreferences _prefs = getIt<SharedPreferences>();
  dynamic decoreAppConfiguration;
  double minMoneyValue = 0;

  bool valueIsValidUsersarlaft = false;
  bool validIsProgressWithdrawal = false;


  checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun){
    if(!getIt<IEnv>().isColombia()){
      var repoDashboard = getIt<IDashboardRepository>();

      if(showDialogMaximun.value){

        String strippedValue = getIt<IEnv>().isColombia()
            ? investmentController.text.replaceAll(".", "").replaceAll("\$", "").replaceAll(" ", "")
            : investmentController.text.replaceAll(",", "").replaceAll("\$", "").replaceAll(" ", "");
        //maximunInversion.value=false;
        repoDashboard.VerifyTheInvestmentUser(strippedValue).then((value) {


          showDialogMaximun.value=false;


          if(value!=null){
            if(value.length>0){
              maximunInversion.value=false;
              messageErrorLImitMaximun.value=value;

            }else{
              maximunInversion.value=true;
              messageErrorLImitMaximun.value="";

            }
          }else{
            maximunInversion.value=true;
            messageErrorLImitMaximun.value="";
          }



        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var hasAccounts = useState(true);
    var checkedAccounts = useState(false);
    var changedValue = useState(false);
    var repoBanks = getIt<IInvestingRepository>();
    if (!checkedAccounts.value) {
      repoBanks.getBankAccounts().then((value) {
        checkedAccounts.value = true;
        if (value != null && value.length > 0) {
          hasAccounts.value = true;
        } else {
          hasAccounts.value = false;
        }
      });
    }
    final leftSelected = useState(true);
    var isRegister = useState(1);
    var focusedInvestment = useState(false);
    if (fromRegister && !changedValue.value) {
      focusedInvestment.value = true;
    }
    var focusInvestment = useFocusNode();
    var investmentController = useTextEditingController();
    if (fromRegister && !changedValue.value) {
      investmentController.text = formatter.format(valueFromRegister);
    }
    focusInvestment.addListener(() {
      if (focusInvestment.hasFocus != focusedInvestment.value) {
        focusedInvestment.value = focusInvestment.hasFocus;
      }
    });

    var investmentValue = useState(0.0);
    var periodicity = useState(0);
    var maximunInversion = useState(true);
    var showDialogMaximun = useState(false);
    var messageErrorLImitMaximun = useState("");
    var subTextPopUp = useState("");

    if (fromRegister && !changedValue.value) {
      if (valueFromRegister != 0) {
        investmentValue.value = valueFromRegister;
      } else {
        investmentValue.value = minMoneyValue;
      }
    }



    if(MediaQuery.of(context).viewInsets.bottom==0.0){
      if(investmentController.text.length>0){
        if(investmentController.text!="\$0.00"){
          checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun);
        }
      }

    }

    useEffect(() {

      var repoDashboard = getIt<IDashboardRepository>();

      repoDashboard.VerifyTheInvestmentUserFirst().then((value) {

        subTextPopUp.value=value;

      });

        formatter =
          getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;

      //Obtener los costos bancarios, inversión minima de la tabla "AppConfiguration"
      if (_prefs.appConfiguration != '') {
        decoreAppConfiguration = json.decode(_prefs.appConfiguration);
        minMoneyValue = decoreAppConfiguration["MinMoneyValue"] != null
            ? decoreAppConfiguration["MinMoneyValue"]
            : EnvironmentConfig.minMoneyValue;
      } else {
        minMoneyValue = EnvironmentConfig.minMoneyValue;
      }

      var isColombia = getIt<IEnv>().isColombia();
      if (isColombia) {
        //Consultar data de sarlaft, para el popup de actualización.
        valueIsValidUsersarlaft = _prefs.isValidUserUpdateSarlaft;
        if (_prefs.isValidUserUpdateSarlaft == null) {
          valueIsValidUsersarlaft = false;
        }

        print("aquiiii carga al principiooo asdfas df");



        repoDashboard.consultUserSarlaft().then((value) {
          if (valueIsValidUsersarlaft) {
            return _showPopupVerifyUserUpdateSarlaft(context, value);
          }
        });
      }

      //Validar si tiene pendiente un retiro total.
      var repoInvesting =
          getIt<IInvestingRepository>().validateTransactionPopUpType(2, 0);

      repoInvesting.then((value) => {
            value.fold(
                (l) => {},
                (r) => {
                      if (r.popUpType > 0)
                        {
                          validIsProgressWithdrawal = true,
                          _showPopupValidTransaction(
                              context,
                              'Retiro Total en \ncurso',
                              r.message,
                              S.of(context).validateTransactionPopUpButton,
                              '')
                        }
                    })
          });

      return null;
    }, const []);


    return BlocProvider<InvestingMxMainBloc>(
      create: (context) => getIt<InvestingMxMainBloc>(),
      child: BlocBuilder<InvestingMxMainBloc, InvestingMxMainState>(
        builder: (context, state) => _buildRoot(
          context,
          state,
          leftSelected,
          isRegister,
          focusedInvestment,
          focusInvestment,
          investmentController,
          periodicity,
          investmentValue,
          hasAccounts,
          changedValue,
            maximunInversion,
            showDialogMaximun,
            messageErrorLImitMaximun,
            subTextPopUp
        ),
      ),
    );
  }

  Scaffold _buildRoot(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<bool> leftSelected,
    ValueNotifier<int> isRegister,
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> hasAccounts,
    ValueNotifier<bool> valueChanged,maximunInversion,showDialogMaximun,messageErrorLImitMaximun,subTextPopUp

  ) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: _footer(context, state, leftSelected, periodicity,
          investmentValue, hasAccounts,maximunInversion,showDialogMaximun,),
      body: SafeArea(
        child: Container(
          height: periodicity.value != 0 ? 670 : 620,
          child: ListView(
            primary: false,
            children: [
              _iconReturn(isRegister),
              Container(
                height: periodicity.value != 0 ? 650 : 580,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMargin,
                  ),
                  primary: false,
                  children: <Widget>[
                    _headerInvestIntro(context),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    _selectInvestingOptionHeader(context),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    _selectInvestingOptionButtons(
                      context,
                      leftSelected,
                      focusInvestment,
                      investmentController,
                      focusedInvestment,
                      investmentValue,
                        showDialogMaximun,
                        maximunInversion
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    _buildTextFields(
                      context,
                      state,
                      leftSelected,
                      focusedInvestment,
                      focusInvestment,
                      investmentController,
                      periodicity,
                      investmentValue,
                      valueChanged,
                        maximunInversion,
                        showDialogMaximun,
                        messageErrorLImitMaximun,
                        subTextPopUp

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconReturn(ValueNotifier<int> isRegister) {
    getHOme().then((value) {
      isRegister.value = value;
    });

    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.layoutSpacerS, top: AppDimens.layoutSpacerS),
      child: IconButton(
        icon: Row(
          children: [
            isRegister.value != 0
                ? Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                    size: AppDimens.buttonBack.height,
                  )
                : Container(),
          ],
        ),
        onPressed: () {
          if (isRegister.value != 0) {
            ExtendedNavigator.rootNavigator.pop();
          }
        },
      ),
    );
  }

  Future getHOme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('isHome');
  }

  Widget _buildTextFields(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<bool> leftSelected,
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> valueChanged,
      maximunInversion,
      showDialogMaximun,
      messageErrorLImitMaximun,
      subTextPopUp
  ) {
    if (leftSelected.value) {
      return _buildDebito(
        context,
        state,
        focusedInvestment,
        focusInvestment,
        investmentController,
        periodicity,
        investmentValue,
        valueChanged,
          maximunInversion,
          showDialogMaximun,
          messageErrorLImitMaximun,
          subTextPopUp
      );
    } else {
      return _buildPSE(
        context,
        investmentValue,
        investmentController,
        focusedInvestment,
        focusInvestment,
        valueChanged,
          showDialogMaximun,
          maximunInversion,
          messageErrorLImitMaximun,
          subTextPopUp
      );
    }
  }

  Widget _buildDebito(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> valueChanged,
      maximunInversion,
      showDialogMaximun,
      messageErrorLImitMaximun,
      subTextPopUp
  ) {
    List listPeriodicity = ['None', 'Quincenal', 'Mensual', 'Trimestral'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textFieldLabel(
          focusedInvestment,
          investmentController,
          context,
          fromRegister
              ? getIt<IEnv>().isColombia()
                  ? S.of(context).hintValueDebit
                  : S.of(context).hintValueDebitMx
              : getIt<IEnv>().isColombia()
                  ? S.of(context).debitValue
                  : S.of(context).debitValueMx,
        ),
        SizedBox(
          height: AppDimens.layoutSpacerXXs,
        ),
        FocusScope(
          child: Focus(
            onFocusChange: (focus) {
              if(focus==false){


                checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun);

              }
            },

            child: TextFormField(
              onEditingComplete: (){
                print("aquii  en  onEditingComplete");
              },
              onSaved: (value){
                print("aquii  en  onSaved  ${value}");

              },
              onFieldSubmitted: (value){

                checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun);


              },
              decoration: InputDecoration(
                hintText: fromRegister
                    ? getIt<IEnv>().isColombia()
                    ? S.of(context).hintValueDebit
                    : S.of(context).hintValueDebitMx
                    : getIt<IEnv>().isColombia()
                    ? S.of(context).debitValue
                    : S.of(context).debitValueMx,
              ),
              controller: investmentController,
              focusNode: focusInvestment,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MoneyTextInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.always,

              onChanged: (value) {
                showDialogMaximun.value=true;

                valueChanged.value = true;
                investmentValue.value = getDoubleValue(value);
              },
              validator: (String value) {

                if(!maximunInversion.value){
                  return messageErrorLImitMaximun.value;
                }



                double doubleValue = getDoubleValue(value);
                if (value == "") {
                  return null;
                }
                if (doubleValue < minMoneyValue) {
                  var isColombia = getIt<IEnv>().isColombia();
                  if (isColombia) {
                    return S.of(context).lowInvestmentError;
                  } else {
                    return S.of(context).lowInvestmentErrorMx;
                  }
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        !maximunInversion.value ? GestureDetector(
          child: Container(
            margin:  EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Icon(Icons.help,color: AppColors.infoToastColor,),
                Text("${S.of(context).questionTextLink}",  style: AppTextStyles.normal1.copyWith(
                    color: AppColors.infoToastColor, fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          onTap: (){
            _showPopUpMaximunInvest(context,"${S.of(context).limitInvestionText}",S.of(context).limitInvestionTextDescription,subTextPopUp);
          },
        ): Container(),

        SizedBox(
          height: 10,
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: periodicity.value != 0,
          child: Text(
            S.of(context).investTextFieldPeriodicidad,
            style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color, fontWeight: FontWeight.w400),
          ),
        ),

        //Dropdown
        periodicityDropDown(listPeriodicity, periodicity, context),
        Visibility(
            maintainInteractivity: false,
            maintainSize: false,
            maintainState: true,
            visible: periodicity.value != 0,
            child: Column(
              children: [
                SizedBox(
                  height: AppDimens.layoutSpacerHeader,
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(AppDimens.textFieldBorderRadius),
                  decoration: BoxDecoration(
                    color: AppColors.infoColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      AppDimens.dialogBorderRadius,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.infoToastAccentColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: AppDimens.layoutSpacerXs,
                      ),
                      Expanded(
                        child: getPeriodicityText(
                          periodicity.value,
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(
          height:10 ,
        ),
        datePicker(context),
        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: state.isAvailableDate,
          child: Column(
            children: [
              SizedBox(
                height: AppDimens.layoutSpacerXXs,
              ),
              Text(
                getIt<IEnv>().isColombia()
                    ? S.of(context).errorHolidayAvailable
                    : S.of(context).errorHolidayAvailableMx,
                textAlign: TextAlign.left,
                style: AppTextStyles.caption2
                    .copyWith(color: AppColors.bgToastInvalid2),
              ),
            ],
          ),
        ),
        Visibility(
          maintainSize: false,
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
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        Text(
          getIt<IEnv>().isColombia()
              ? S.of(context).dateInversionDisclaimer
              : S.of(context).dateInversionDisclaimerMx,
          style: AppTextStyles.normal1.copyWith(
            color: AppColors.g75Color,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  CustomDatetimePicker datePicker(BuildContext context) {
    return CustomDatetimePicker(
        dateController: _dateController,
        initialValue: S.of(context).initialDate,
        initialDate: DateTime.now().add(Duration(days: validDayFirtsDate())),
        //firstDate: DateTime.now().add(new Duration(days: validDayFirtsDate())),
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
        });
  }

  Visibility _textFieldLabel(ValueNotifier<bool> focused,
      TextEditingController controller, BuildContext context, String label) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: focused.value || controller.value.text.length != 0,
      child: Text(
        label,
        style: AppTextStyles.normal1
            .copyWith(color: AppColors.g75Color, fontWeight: FontWeight.w400),
      ),
    );
  }

  Container periodicityDropDown(List listPeriodicity,
      ValueNotifier<int> periodicity, BuildContext context) {
    return Container(
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
        hint: Text(
          S.of(context).investTextFieldPeriodicidad,
          style: AppTextStyles.normal1
              .copyWith(color: AppColors.g25Color, fontWeight: FontWeight.w400),
        ),
        value:
            periodicity.value == 0 ? null : listPeriodicity[periodicity.value],
        items: getItems(listPeriodicity),
        onChanged: (value) {
          FocusScope.of(context).requestFocus(new FocusNode());
          periodicity.value = getPeriodicity(value, listPeriodicity);
        },
      ),
    );
  }

  Widget _buildPSE(
    BuildContext context,
    ValueNotifier<double> investmentValue,
    TextEditingController investmentController,
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    ValueNotifier<bool> valueChanged,
      showDialogMaximun,maximunInversion, messageErrorLImitMaximun,subTextPopUp
  ) {
    return Container(
      height: 300,
      child: ListView(
        primary: false,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              fromRegister
                  ? S.of(context).hintValuePSERegister
                  : S.of(context).hintValuePSE,
              style: AppTextStyles.normal1.copyWith(
                  color: AppColors.g75Color, fontWeight: FontWeight.w400),
            ),
          ),

          FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                if(focus==false){

                  checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun);



                }
              },

              child: TextFormField(
                onEditingComplete: (){
                  print("aquii  en  onEditingComplete");
                },
                onSaved: (value){
                  print("aquii  en  onSaved  ${value}");

                },
                onFieldSubmitted: (value){
                  checkMaximunServer(showDialogMaximun,investmentController,maximunInversion,messageErrorLImitMaximun);
                },
                decoration: InputDecoration(
                  hintText: fromRegister
                      ? S.of(context).hintValuePSE
                      : S.of(context).investTextField,
                ),
                controller: investmentController,
                focusNode: focusInvestment,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MoneyTextInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,

                onChanged: (value) {
                  showDialogMaximun.value=true;

                  valueChanged.value = true;
                  investmentValue.value = getDoubleValue(value);
                },
                validator: (String value) {

                  if(!maximunInversion.value){
                    return messageErrorLImitMaximun.value;
                  }



                  double doubleValue = getDoubleValue(value);
                  if (value == "") {
                    return null;
                  }
                  if (doubleValue < minMoneyValue) {
                    var isColombia = getIt<IEnv>().isColombia();
                    if (isColombia) {
                      return S.of(context).lowInvestmentError;
                    } else {
                      return S.of(context).lowInvestmentErrorMx;
                    }
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          !maximunInversion.value ? GestureDetector(
            child: Container(
              margin:  EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.help,color: AppColors.infoToastColor,),
                  Text("${S.of(context).questionTextLink}",  style: AppTextStyles.normal1.copyWith(
                      color: AppColors.infoToastColor, fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            onTap: (){
              _showPopUpMaximunInvest(context,"${S.of(context).limitInvestionText}",S.of(context).limitInvestionTextDescription,subTextPopUp);
            },
          ): Container(),

        ],
      ),
    );
  }

  goToInvesting(
      leftSelected, state, hasAccounts, periodicity, context, investmentValue) {
    if (leftSelected.value) {
      getIt<IFireBaseEventLogger>().investmentDebitNext();

      _showPopUp(context, state, leftSelected, investmentValue, hasAccounts,
          periodicity.value, state.initialDate);
    } else {
      getIt<IFireBaseEventLogger>().investmentPseNext();

      var isColombia = getIt<IEnv>().isColombia();
      if (isColombia) {
        ExtendedNavigator.rootNavigator.pushNamed(
          Routes.investingOverviewPage,
          arguments: InvestingOverviewPageArguments(
            bankTransfer: !leftSelected.value,
            investment: investmentValue.value,
          ),
        );
      } else {
        ExtendedNavigator.rootNavigator
            .pushNamed(Routes.investingOverviewPageMX,
                arguments: InvestingOverviewPageMXArguments(
                  goal: DashboardGoal.empty(),
                  bankTransfer: !leftSelected.value,
                  investment: investmentValue.value,
                  multiple: false,
                  goals: state.oldGoals,
                  valuesChosen: state.valuesChosen,
                ));
      }
    }
  }

  Padding _footer(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<bool> leftSelected,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> hasAccounts,
      maximunInversion,
      showDialogMaximun
  ) {
    bool isActive = false;
    if (leftSelected.value) {
      DateTime valid = DateTime.utc(2000);
      if (investmentValue.value >= minMoneyValue &&
          periodicity.value != 0 &&
          state.initialDate.isAfter(valid) &&
          !state.isAvailableDate &&
          !state.isAvailableDateValidation &&
          !valueIsValidUsersarlaft &&
          !validIsProgressWithdrawal && maximunInversion.value) {
        isActive = true;
      }
    } else {
      if (investmentValue.value > (minMoneyValue ) &&
          !valueIsValidUsersarlaft &&
          !validIsProgressWithdrawal  && maximunInversion.value)  {
        isActive = true;
      }

    }

    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerM,
      ),
      child: PrimaryButton(
        text: "${S.of(context).nextButton}",
        action: isActive
            ? () async {
                goToInvesting(leftSelected, state, hasAccounts, periodicity,
                    context, investmentValue);
              }
            : null,
      ),
    );
  }

  _showPopUpMaximunInvest(
      BuildContext context,title,message,subTextPopUp) {

    showDialog(
        context: context,
      builder: (BuildContext context)=>CustomDialog(
        icon: Icons.help,
        iconColor: AppColors.successColor,
        buttonAction: () {

          ExtendedNavigator.rootNavigator.pop();

        },
        buttonText: S.of(context).understand,
        title: title,
        description:"<p>${subTextPopUp.value} <br><br>${S.of(context).limitInvestionTextDescriptionTwo}</p>",
        subTitle:  "<p>Por normas regulatorias <b>no puedes invertir más de \$20,700.00 mensualmente</b></p>",
      )
        );
  }

  _showPopUp(
      BuildContext context,
      InvestingMxMainState state,
      ValueNotifier<bool> leftSelected,
      ValueNotifier<double> investmentValue,
      ValueNotifier<bool> hasAccounts,
      int periodicity,
      DateTime date) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AddMoneyDialog(
            message: !hasAccounts.value
                ? S.of(context).addMoneyNoAccountsMessage
                : getIt<IEnv>().isColombia()
                    ? S.of(context).addMoneyAccountMessage
                    : S.of(context).addMoneyAccountMessageMx,
            continueCallBack: () {
              ExtendedNavigator.rootNavigator.pop();

              var isColombia = getIt<IEnv>().isColombia();
              if (isColombia) {
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.investingOverviewPage,
                  arguments: InvestingOverviewPageArguments(
                      bankTransfer: !leftSelected.value,
                      investment: investmentValue.value,
                      goal: DashboardGoal(
                          name: "",
                          goalAmt: 0,
                          currentAmt: 0,
                          emoji: "",
                          tieneDomiciliacionprogramada: false,
                          fee: investmentValue.value,
                          periodicity: periodicity,
                          numMonths: 0,
                          migrate: true,
                          created: date,
                          id: 0)),
                );
              } else {
                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.investingOverviewPageMX,
                        arguments: InvestingOverviewPageMXArguments(
                          goal: DashboardGoal(
                              name: "",
                              goalAmt: 0,
                              currentAmt: 0,
                              emoji: "",
                              tieneDomiciliacionprogramada: false,
                              fee: investmentValue.value,
                              periodicity: periodicity,
                              numMonths: 0,
                              migrate: true,
                              created: date,
                              id: 0),
                          bankTransfer: !leftSelected.value,
                          investment: investmentValue.value,
                          multiple: false,
                          goals: state.oldGoals,
                          valuesChosen: state.valuesChosen,
                        ));
              }
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.28)).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _headerInvestIntro(context) {
    return Text(
      S.of(context).addMoney,
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

  Widget _selectInvestingOptionButtons(
    BuildContext context,
    ValueNotifier<bool> leftSelected,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<bool> focusedInvestment,
    ValueNotifier<double> investmentValue,
      showDialogMaximun,
      maximunInversion
  ) {
    return InvestingTabBar(
        onClickLeft: () {

         // showDialogMaximun.value=true;
          maximunInversion.value=true;

          if (!leftSelected.value && !fromRegister) {
            investmentValue.value = 0;
            investmentController.clear();
            focusedInvestment.value = false;
            focusInvestment.unfocus();
          } else if (!leftSelected.value && fromRegister) {
            investmentValue.value = valueFromRegister;
            investmentController.text = formatter.format(valueFromRegister);
            focusInvestment.unfocus();
          }
          leftSelected.value = true;
          getIt<IFireBaseEventLogger>().investmentDebit();
        },
        onClickRight: () {
          maximunInversion.value=true;

          showDialogMaximun.value=true;

          if (leftSelected.value && !fromRegister) {
            investmentValue.value = 0;
            investmentController.clear();
            focusedInvestment.value = false;
            focusInvestment.unfocus();
          } else if (leftSelected.value && fromRegister) {
            investmentValue.value = valueFromRegister;
            investmentController.text = formatter.format(valueFromRegister);
            focusInvestment.unfocus();
          }
          leftSelected.value = false;
          getIt<IFireBaseEventLogger>().investmentPse();
        },
        leftActivated: leftSelected.value);
  }

  Text getPeriodicityText(int periodicity, context) {
    String text = "";
    if (periodicity == 1) {
      text = getIt<IEnv>().isColombia()
          ? S.of(context).periodicityMessageQuincenal
          : S.of(context).periodicityMessageQuincenalMx;
    } else if (periodicity == 2) {
      text = getIt<IEnv>().isColombia()
          ? S.of(context).periodicityMessageMensual
          : S.of(context).periodicityMessageMensualMx;
    } else if (periodicity == 3) {
      text = getIt<IEnv>().isColombia()
          ? S.of(context).periodicityMessageTrimestral
          : S.of(context).periodicityMessageTrimestralMx;
    }
    return Text(
      text,
      style: AppTextStyles.normal1.copyWith(
        color: AppColors.infoToastAccentColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  double getDoubleValue(String value) {
    String strippedValue = getIt<IEnv>().isColombia()
        ? value.replaceAll(".", "").replaceAll("\$", "").replaceAll(" ", "")
        : value.replaceAll(",", "").replaceAll("\$", "").replaceAll(" ", "");

    //strippedValue=strippedValue.replaceAll(".", "");
    double doubleValue = double.tryParse(strippedValue);

    if (doubleValue == null) {
      return 0;
    } else {
      return doubleValue;
    }
  }

  List<DropdownMenuItem<String>> getItems(List listPeriodicity) {
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
    return items;
  }

  int getPeriodicity(String periodicity, List periodicityList) {
    int periodicityInt = 0;
    for (int i = 0; i < periodicityList.length; i++) {
      if (periodicityList[i] == periodicity) {
        periodicityInt = i;
        break;
      }
    }
    return periodicityInt;
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

  _showPopupVerifyUserUpdateSarlaft(context, UserInfo dataSarlaft) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: VerifyUpdateSarlaftDialog(
              typeDialog: 1,
              buttonActionPrimary: () {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.investingGrandesMontos, (route) => false,
                    arguments: InvestingGrandesMontosMasterArguments(
                        cargarDocumentos: false,
                        isUpdate: true,
                        sarlaftItem: dataSarlaft.sarlaftItem,
                        validButtonReturn: true));
              },
              buttonActionSecondary: () {
                ExtendedNavigator.rootNavigator.pop();
                _showPopupVerifyUserBlockUpdateSarlaft(context, dataSarlaft);
              },
              title: S.of(context).verifyUpdateSarlaftInfoTitle,
              subTitleOne: S.of(context).verifyUpdateSarlaftInfoSubTitleOne,
              subTitleOneBold:
                  S.of(context).verifyUpdateSarlaftInfoSubTitleOneBold,
              subTitleOneNext: '',
              subTitleTwo: S.of(context).verifyUpdateSarlaftInfoSubTitleTwo,
              buttonTextPrimary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextPrimary,
              buttonTextSecondary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextSecondary,
            ));
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  _showPopupVerifyUserBlockUpdateSarlaft(context, UserInfo dataSarlaft) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: VerifyUpdateSarlaftDialog(
              typeDialog: 2,
              buttonActionPrimary: () {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.investingGrandesMontos, (route) => false,
                    arguments: InvestingGrandesMontosMasterArguments(
                        cargarDocumentos: false,
                        isUpdate: true,
                        sarlaftItem: dataSarlaft.sarlaftItem,
                        validButtonReturn: true));
              },
              buttonActionSecondary: () {
                ExtendedNavigator.rootNavigator.pop();
              },
              title: S.of(context).verifyUpdateSarlaftInfoBlockTitle,
              subTitleOne:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOne,
              subTitleOneBold:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOneBold,
              subTitleOneNext:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleOneNext,
              subTitleTwo:
                  S.of(context).verifyUpdateSarlaftInfoBlockSubTitleTwo,
              buttonTextPrimary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextPrimary,
              buttonTextSecondary:
                  S.of(context).verifyUpdateSarlaftInfoButtonTextSecondary,
            ));
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
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
          position:
              Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
