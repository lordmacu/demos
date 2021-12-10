import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/investing/widgets/add_account_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/investingMX/investingMxDom/investing_mx_dom_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_menu.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/clabe_textInputFormatter.dart';
import 'package:ualet/to_be_refactor/utils/upper_case_formatter.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class InvestingAddAccountPageMX extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final bankTransferValue;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool isWithdrawal;
  final bool isWallet;
  final ChooseAccountPageArguments accArgs;
  final WithdrawalInfo info;
  final bool finishedVinculation;

  const InvestingAddAccountPageMX({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.multiple = false,
    this.goals,
    this.valuesChosen,
    this.isWithdrawal = false,
    this.isWallet = false,
    this.accArgs,
    this.info,
    this.finishedVinculation,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InvestingAddAccountPageStateMX();
}

class _InvestingAddAccountPageStateMX extends State<InvestingAddAccountPageMX> {
  final TextEditingController _numCuentaController = TextEditingController();
  final TextEditingController _rfcController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InvestingMxDomBloc>(
            create: (context) => getIt<InvestingMxDomBloc>()
              ..add(InvestingMxDomEvent.getBanksList()),
          )
        ],
        child: BlocListener<InvestingMxDomBloc, InvestingMxDomState>(
          listener: (context, state) {
            setState(() {
              isLoading = false;
            });
            if (state.error != '') {
              ToastHelper.createError(
                      message: state.error, duration: Duration(seconds: 5))
                  .show(context);
            }
            if (state.posted) {
              if (widget.isWithdrawal) {
                var oldArgs = widget.accArgs;
                var accInfo = BankInfo(
                  accountNumber: state.accountItem.number,
                  accountTypeId: state.accountItem.typeId,
                  accountTypeName: state.accountItem.accountType,
                  bankAccountId: state.accountItem.id,
                  bankId: state.accountItem.bankId,
                  bankLogo: state.accountItem.accountImg,
                  bankName: state.accountItem.accountBank,
                  rfc: _rfcController.value.text,
                  stateName: '',
                );
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.withdrawalSummaryPageMX,
                  arguments: WithdrawalSummaryPageArguments(
                      chosenGoals: oldArgs.chosenGoals,
                      chosenAmmount: oldArgs.chosenAmmount,
                      withdrawalAll: oldArgs.withdrawalAll,
                      withdrawalInfo: oldArgs.editGoal
                          ? widget.info
                          : oldArgs.withdrawalInfo,
                      chosenAccount: accInfo,
                      valuesChosen: oldArgs.chosenValues,
                      deleteGoal: oldArgs.deleteGoal,
                      deleteDebit: oldArgs.deleteDebit),
                );
              } else if (widget.isWallet) {
                ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                    Routes.myWalletPageMX,
                    ModalRoute.withName(Routes.homePage));
              } else {
                if (!widget.bankTransfer) {
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //     Routes.investingOverviewPageMX,
                  //     arguments: InvestingOverviewPageMXArguments(
                  //         goal: widget.goal,
                  //         bankAccountItem: state.accountItem,
                  //         bankTransfer: widget.bankTransfer,
                  //         goals: widget.goals,
                  //         investment: widget.bankTransferValue,
                  //         multiple: widget.multiple,
                  //         valuesChosen: widget.valuesChosen));
                  ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.investingSuccessPageMX,
                          arguments: InvestingSuccessPageMXArguments(
                            goal: widget.goal,
                            bankAccountItem: state.accountItem,
                            goals: widget.goals,
                            multiple: widget.multiple,
                            valuesChosen: widget.valuesChosen,
                            bankTransferValue: widget.bankTransferValue,
                            finishedVinculation: widget.finishedVinculation,
                          ));
                } else {
                  print("TO: BankTransferSummary");
                  print(widget.multiple);
                  ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.bankTransferSummaryPageMX,
                    arguments: BankTransferSummaryPageMXArguments(
                        accountItem: state.accountItem,
                        goal: widget.goal,
                        bankTransfer: widget.bankTransfer,
                        bankTransferValue: widget.bankTransferValue,
                        goals: widget.goals,
                        multiple: widget.multiple,
                        valuesChosen: widget.valuesChosen),
                  );
                }
              }
            }
            // context.bloc<InvestingMxDomBloc>().add(InvestingMxDomEvent.)
          },
          child: BlocBuilder<InvestingMxDomBloc, InvestingMxDomState>(
              builder: (context, state) => _buildRoot(context, state)),
        ));
  }

  Widget _buildRoot(BuildContext context, InvestingMxDomState state) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ModalProgressHUD(
          child: SafeArea(
            child: Container(
                child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
              primary: true,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        ExtendedNavigator.rootNavigator.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                _header(context),
                SizedBox(
                  height: AppDimens.layoutSpacerL,
                ),
                _subTitle(context),
                _subTitle2(context),
                SizedBox(
                  height: AppDimens.layoutSpacerM,
                ),
                _entidadBancariaDropdown(context),
                SizedBox(
                  height: AppDimens.layoutSpacerS,
                ),
                _tipoCuentaDropdown(context),
                SizedBox(
                  height: AppDimens.layoutSpacerS,
                ),
                _numCuentaClabeTextField(context),
                // SizedBox(
                //   height: AppDimens.layoutSpacerS,
                // ),
                _rfcTextField(context),
                SizedBox(
                  height: AppDimens.layoutSpacerS,
                ),
                _checkbox(context, state),
                SizedBox(
                  height: AppDimens.layoutSpacerL,
                ),
                _buttonNext(context),
              ],
            )),
          ),
          inAsyncCall: isLoading,
        ));
  }

  Widget _header(BuildContext context) {
    return Text(
      S.of(context).registerBankAccount,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      textAlign: TextAlign.left,
    );
  }

  Widget _subTitle(BuildContext context) {
    return Text(
      widget.bankTransfer
          ? S.of(context).registerBankAccountBankTransfer
          : S.of(context).registerBankAccountSubtitle,
      style: AppTextStyles.normal4,
    );
  }

  Widget _subTitle2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        Text(
          S.of(context).accountRegistrationDebitSubtitle1,
          style: AppTextStyles.normal4,
        ),
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        Text(
          S.of(context).accountRegistrationDebitSubtitle2Mx,
          style: AppTextStyles.normal4,
        ),
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
        Text(
          S.of(context).accountRegistrationDebitSubtitle3Mx,
          style: AppTextStyles.normal4,
        ),
      ],
    );
  }

  Widget _entidadBancariaDropdown(BuildContext context) {
    List<String> a = context.bloc<InvestingMxDomBloc>().state.banksList;
    return CustomDropdownMenu(
      itemsList: a,
      label: S.of(context).bankingEntity,
      onChanged: (value) {
        context
            .bloc<InvestingMxDomBloc>()
            .add(InvestingMxDomEvent.updateBank(value));
      },
    );
  }

  Widget _tipoCuentaDropdown(BuildContext context) {
    List<String> a = context.bloc<InvestingMxDomBloc>().state.accountTypes;
    return CustomDropdownMenu(
      itemsList: a,
      label: S.of(context).accountType,
      onChanged: (value) {
        context
            .bloc<InvestingMxDomBloc>()
            .add(InvestingMxDomEvent.updateAccountType(value));
      },
    );
  }

  Widget _numCuentaClabeTextField(BuildContext context) {
    var textField = S.of(context).clabeAccountNumber;
    return Column(
      children: <Widget>[
        Container(
          height: 106,
          child: CustomTextFormField(
            inputFormatters: [
              ClabeTextInputFormatter(),
            ],
            controller: _numCuentaController,
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
            onFieldSubmitted: (value) {},
            onChanged: (value) {
              context
                  .bloc<InvestingMxDomBloc>()
                  .add(InvestingMxDomEvent.updateClabe(value));
            },
            autovalidate: AutovalidateMode.always,
            validator: (String value) {
              bool valid = context.bloc<InvestingMxDomBloc>().validateClabe();
              if (!valid && value != "") {
                return "CLABE inválido.";
              } else
                return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _rfcTextField(BuildContext context) {
    var textField = S.of(context).rfc;
    return Column(
      children: <Widget>[
        Container(
          height: 105,
          child: CustomTextFormField(
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            controller: _rfcController,
            textAlign: TextAlign.start,
            maxLength: 13,
            maxLengthEnforced: true,
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
            onFieldSubmitted: (value) {},
            onChanged: (value) {
              context
                  .bloc<InvestingMxDomBloc>()
                  .add(InvestingMxDomEvent.updateRFC(value));
            },
            autovalidate: AutovalidateMode.always,
            validator: (String value) {
              bool valid = context.bloc<InvestingMxDomBloc>().validateRFC();
              print("VALIDATE RFC: $valid");
              if (!valid && value != "") {
                return "RFC inválido.";
              } else
                return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _checkbox(BuildContext context, InvestingMxDomState state) {
    var otherStyle =
        AppTextStyles.normal4.copyWith(color: AppColors.primaryColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: state.checkedBox,
          activeColor: AppColors.primaryColor,
          onChanged: (checked) {
            context
                .bloc<InvestingMxDomBloc>()
                .add(InvestingMxDomEvent.checkBox());
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(style: AppTextStyles.normal4, children: <TextSpan>[
              TextSpan(text: S.of(context).investingConfirmation1),
              TextSpan(
                  text: S.of(context).investingConfirmation2,
                  style: otherStyle),
              TextSpan(text: S.of(context).investingConfirmation3),
              TextSpan(
                  text: S.of(context).investingConfirmation4,
                  style: otherStyle),
              TextSpan(text: S.of(context).investingConfirmation5),
              TextSpan(
                  text: S.of(context).investingConfirmation6,
                  style: otherStyle),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buttonNext(BuildContext context) {
    // bool isActivated = context.bloc<InvestingMxMainBloc>().isButtonActivated();
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).continueButton,
        action: context.bloc<InvestingMxDomBloc>().isButtonActivated()
            ? () {
                SharedPreferences _prefs = getIt<SharedPreferences>();
                _prefs.setCheckCreationAccount = true;

                _showPopUp(context);
              }
            : null,
      ),
    );
  }

  _showPopUp(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AddAccountDialog(
            acceptCallBack: () {
              ExtendedNavigator.rootNavigator.pop();
              setState(() {
                isLoading = true;
              });
              //if (!widget.bankTransfer) {
              context
                  .bloc<InvestingMxDomBloc>()
                  .add(InvestingMxDomEvent.createAccount(false));
              //}
            },
            undoCallback: () => ExtendedNavigator.rootNavigator.pop(),
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
}
