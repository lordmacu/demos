import 'package:ualet/application/investingMX/investingMainPage/investing_mx_main_bloc.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/my_wallet/i_my_wallet_repository.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_datetime_picker.dart';
import 'package:ualet/presentation/investing/widgets/add_money_dialog.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditDebitPage extends HookWidget {
  final _dateController = TextEditingController();

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

  final DebitInfo debit;

  EditDebitPage({
    @required this.debit,
  });
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      formatter =
          getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;

      return null;
    }, const []);

    var hasAccounts = useState(true);
    var isLoading = useState(false);
    var checkedAccounts = useState(false);
    var changedValue = useState(false);
    var changedPeriodicity = useState(false);
    var changedDate = useState(false);
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
    var focusedInvestment = useState(false);
    if (!changedValue.value) {
      focusedInvestment.value = true;
    }
    var focusInvestment = useFocusNode();
    var investmentController = useTextEditingController();
    if (!changedValue.value) {
      investmentController.text = formatter.format(debit.value);
    }
    focusInvestment.addListener(() {
      if (focusInvestment.hasFocus != focusedInvestment.value) {
        focusedInvestment.value = focusInvestment.hasFocus;
      }
    });
    var investmentValue = useState(0.0);

    if (!changedValue.value) {
      investmentValue.value = debit.value;
    }
    var periodicity = useState(0);
    if (!changedPeriodicity.value) {
      periodicity.value = debit.periodicity;
    }
    if (!changedDate.value) {
      _dateController.text =
          DateFormat.yMd().format(debit.firstDateApplication);
    }

    return ModalProgressHUD(
      child: BlocProvider<InvestingMxMainBloc>(
        create: (context) => getIt<InvestingMxMainBloc>()
          ..add(InvestingMxMainEvent.updateInitialDate(
              debit.firstDateApplication)),
        child: BlocBuilder<InvestingMxMainBloc, InvestingMxMainState>(
          builder: (context, state) => _buildRoot(
              context,
              state,
              focusedInvestment,
              focusInvestment,
              investmentController,
              periodicity,
              investmentValue,
              hasAccounts,
              changedValue,
              changedPeriodicity,
              changedDate,
              isLoading),
        ),
      ),
      inAsyncCall: isLoading.value,
    );
  }

  Scaffold _buildRoot(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> hasAccounts,
    ValueNotifier<bool> valueChanged,
    ValueNotifier<bool> periodicityChanged,
    ValueNotifier<bool> dateChanged,
    ValueNotifier<bool> isLoading,
  ) {
    String accNumText = debit.bankAccountNumber.length >= 4
        ? debit.bankAccountNumber.substring(
            debit.bankAccountNumber.length - 4, debit.bankAccountNumber.length)
        : debit.bankAccountNumber;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: _footer(
          context, state, periodicity, investmentValue, hasAccounts, isLoading),
      body: SafeArea(
        child: Container(
          height:
              periodicity.value != 0 && periodicityChanged.value ? 700 : 650,
          child: ListView(
            primary: false,
            children: <Widget>[
              _iconReturn(),
              Container(
                height: periodicity.value != 0 && periodicityChanged.value
                    ? 650
                    : 610,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMargin,
                  ),
                  primary: false,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _headerInvestIntro(context),
                        SizedBox(
                          height: AppDimens.layoutSpacerL,
                        ),
                        bankContainer(accNumText),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        _buildTextFields(
                          context,
                          state,
                          focusedInvestment,
                          focusInvestment,
                          investmentController,
                          periodicity,
                          investmentValue,
                          valueChanged,
                          periodicityChanged,
                          dateChanged,
                        )
                      ],
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

  Container bankContainer(String accNumText) {
    String bankAccountType = "";
    if (debit.bankAccountTypeId == 1) {
      bankAccountType = "Cuenta de ahorros";
    } else if (debit.bankAccountId == 2) {
      bankAccountType = "Cuenta corriente";
    } else {
      bankAccountType = "Cuenta bancaria";
    }
    return Container(
      height: 80,
      padding: EdgeInsets.all(
        AppDimens.layoutMarginS,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          AppDimens.dialogBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: debit.bankUrl.trim().trimRight(),
                width: 70,
              ),
              SizedBox(
                width: AppDimens.layoutSpacerS,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bankAccountType,
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.g75Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "**** $accNumText",
                    style: AppTextStyles.caption2.copyWith(
                      color: AppColors.g75Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconReturn() {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.layoutSpacerS, top: AppDimens.layoutSpacerS),
      child: IconButton(
        icon: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: AppDimens.buttonBack.height,
            )
          ],
        ),
        onPressed: () {
          ExtendedNavigator.rootNavigator.pop();
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
    ValueNotifier<bool> focusedInvestment,
    FocusNode focusInvestment,
    TextEditingController investmentController,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> valueChanged,
    ValueNotifier<bool> periodicityChanged,
    ValueNotifier<bool> dateChanged,
  ) {
    return _buildDebito(
      context,
      state,
      focusedInvestment,
      focusInvestment,
      investmentController,
      periodicity,
      investmentValue,
      valueChanged,
      periodicityChanged,
      dateChanged,
    );
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
    ValueNotifier<bool> periodicityChanged,
    ValueNotifier<bool> dateChanged,
  ) {
    List listPeriodicity = ['None', 'Quincenal', 'Mensual', 'Trimestral'];
    return Container(
      height: 400,
      child: ListView(
        primary: false,
        children: [
          _textFieldLabel(
              focusedInvestment,
              investmentController,
              context,
              getIt<IEnv>().isColombia()
                  ? S.of(context).debitValue
                  : S.of(context).debitValueMx),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          investmentValueField(context, investmentController, focusInvestment,
              valueChanged, investmentValue),
          SizedBox(
            height: AppDimens.layoutSpacerM * 1.5,
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
          SizedBox(
            height: AppDimens.layoutSpacerXs,
          ),
          //Dropdown
          periodicityDropDown(
              listPeriodicity, periodicity, context, periodicityChanged),
          Visibility(
              maintainInteractivity: false,
              maintainSize: false,
              maintainState: true,
              visible: periodicity.value != 0 && periodicityChanged.value,
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
            height: AppDimens.layoutSpacerM * 1.5,
          ),

          datePicker(context, dateChanged),

          // Visibility(
          //   maintainSize: false,
          //   maintainAnimation: true,
          //   maintainState: true,
          //   visible: state.isAvailableDate,
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: AppDimens.layoutSpacerXXs,
          //       ),
          //       Text(
          //         S.of(context).errorHolidayAvailable,
          //         textAlign: TextAlign.left,
          //         style: AppTextStyles.caption2
          //             .copyWith(color: AppColors.bgToastInvalid2),
          //       ),
          //     ],
          //   ),
          // ),
          // Visibility(
          //   maintainSize: false,
          //   maintainAnimation: true,
          //   maintainState: true,
          //   visible: state.isAvailableDateValidation,
          //   child: Text(
          //     S.of(context).errorValidAvailableDate,
          //     textAlign: TextAlign.left,
          //     style: AppTextStyles.caption2
          //         .copyWith(color: AppColors.bgToastInvalid2),
          //   ),
          // ),

          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          Text(
            S.of(context).dateInversionDisclaimer,
            style: AppTextStyles.normal1.copyWith(
              color: AppColors.g75Color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  TextFormField investmentValueField(
      BuildContext context,
      TextEditingController investmentController,
      FocusNode focusInvestment,
      ValueNotifier<bool> valueChanged,
      ValueNotifier<double> investmentValue) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: S.of(context).debitValue,
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
        valueChanged.value = true;
        investmentValue.value = getDoubleValue(value);
      },
      validator: (String value) {
        double doubleValue = getDoubleValue(value);

        if (value == "") {
          return null;
        }
        if (getIt<IEnv>().isColombia()) {
          if (doubleValue < 10000) {
            return S.of(context).lowInvestmentError;
            // } else if (doubleValue > 10000000) {
            //   return S.of(context).highInvestmentError;
          } else {
            return null;
          }
        } else {
          if (doubleValue < 100) {
            return S.of(context).lowInvestmentErrorMexico;
            // } else if (doubleValue > 10000000) {
            //   return S.of(context).highInvestmentError;
          } else {
            return null;
          }
        }
      },
    );
  }

  CustomDatetimePicker datePicker(
    BuildContext context,
    ValueNotifier<bool> dateChanged,
  ) {
    return CustomDatetimePicker(
        showLabelEdit: true,
        dateController: _dateController,
        initialValue: S.of(context).nextDebit,
        initialDate: DateTime.now().add(Duration(days: validDayFirtsDate())),
        activeField: false,
        //firstDate: DateTime.now().add(new Duration(days: validDayFirtsDate())),
        selectableDayPredicate: (date) {
          if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }
          return true;
        },
        onChanged: (newDate) {
          dateChanged.value = true;
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

  Container periodicityDropDown(
    List listPeriodicity,
    ValueNotifier<int> periodicity,
    BuildContext context,
    ValueNotifier<bool> periodicityChanged,
  ) {
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
          periodicityChanged.value = true;
          FocusScope.of(context).requestFocus(new FocusNode());
          periodicity.value = getPeriodicity(value, listPeriodicity);
        },
      ),
    );
  }

  Padding _footer(
    BuildContext context,
    InvestingMxMainState state,
    ValueNotifier<int> periodicity,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> hasAccounts,
    ValueNotifier<bool> isLoading,
  ) {
    bool isActive = false;

    DateTime valid = DateTime.utc(2000);

    if (getIt<IEnv>().isColombia()) {
      if (investmentValue.value >= 10000  &&
              periodicity.value != 0 &&
              state.initialDate.isAfter(valid)
          //&&
          //  !state.isAvailableDate
          //  && !state.isAvailableDateValidation
          ) {
        isActive = true;
      }
    } else {
      if (investmentValue.value >= 100 &&
              investmentValue.value <= 10000000 &&
              periodicity.value != 0 &&
              state.initialDate.isAfter(valid)
          //&&
          //  !state.isAvailableDate
          //  && !state.isAvailableDateValidation
          ) {
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
        text: S.of(context).saveChanges,
        action: isActive
            ? () {
                getIt<IFireBaseEventLogger>().myDebitsEditSave();

                _showPopUp(context, investmentValue, hasAccounts,
                    periodicity.value, state.initialDate, isLoading);
              }
            : null,
      ),
    );
  }

  _showPopUp(
    BuildContext context,
    ValueNotifier<double> investmentValue,
    ValueNotifier<bool> hasAccounts,
    int periodicity,
    DateTime date,
    ValueNotifier<bool> isLoading,
  ) {
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
            fromEditDebit: true,
            isLoading: isLoading.value,
            message: !hasAccounts.value
                ? S.of(context).addMoneyNoAccountsMessage
                : S.of(context).addMoneyAccountMessage,
            continueCallBack: () async {
              isLoading.value = true;
              ExtendedNavigator.rootNavigator.pop();
              var response = await getIt<IMyWalletRepository>().editDebit(
                debit.copyWith(
                  periodicity: periodicity,
                  value: investmentValue.value,
                  firstDateApplication: date,
                ),
              );

              response.fold(
                  (l) => ToastHelper.createError(
                      message: l.map(
                          unexpected: (e) => "Error inesperado",
                          fromServer: (e) => e.message)).show(context), (r) {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                  Routes.myWalletPageMX,
                  ModalRoute.withName(
                    Routes.homePage,
                  ),
                );
              });
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.2)).animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _headerInvestIntro(context) {
    return Text(
      getIt<IEnv>().isColombia()
          ? S.of(context).editDebitTitle
          : S.of(context).editDebitTitleMx,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Text getPeriodicityText(int periodicity, context) {
    String text = "";
    if (periodicity == 1) {
      text = S.of(context).periodicityMessageQuincenal;
    } else if (periodicity == 2) {
      text = S.of(context).periodicityMessageMensual;
    } else if (periodicity == 3) {
      text = S.of(context).periodicityMessageTrimestral;
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
        return 6;
      case 5:
        return 6;
      case 6:
        return 3;
      case 7:
        return 3;
      default:
        return 0;
    }
  }
}
