import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/value_objects.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_intro_page_col.dart';
import 'package:ualet/presentation/investing/widgets/account_number_text_input_formatter.dart';
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
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

class InvestingAddAccountPage extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isWithdrawal;
  final bool isWallet;
  final ChooseAccountPageArguments accArgs;
  final WithdrawalInfo info;

  const InvestingAddAccountPage({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.investment = 0,
    this.isWithdrawal = false,
    this.isWallet = false,
    this.accArgs,
    this.info,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InvestingAddAccountPageState();
}

class _InvestingAddAccountPageState extends State<InvestingAddAccountPage> {
  final FocusNode _fieldValue = FocusNode();
  TextEditingController accountNumber;
  BuildContext contextGeneral;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountNumber = TextEditingController();
  }

  GoToInvest(state) {
    ExtendedNavigator.rootNavigator.pop();
    ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.investingSuccessPage,
        arguments: InvestingSuccessPageArguments(
            goal: widget.goal,
            item: state.accountItem,
            investment: widget.investment,
            typePopUp:
                1, //Cuando la cuenta es nueva o esta en estado "pendiente"
            successData: {
              "type": 1,
              "data": accountNumber.text,
              "popupType": 1
            }));
  }

  @override
  Widget build(BuildContext context) {
    contextGeneral = context;
    return MultiBlocProvider(
        providers: [
          BlocProvider<InvestingMxDomBloc>(
            create: (context) => getIt<InvestingMxDomBloc>()
              ..add(InvestingMxDomEvent.getBanksList()),
          )
        ],
        child: BlocListener<InvestingMxDomBloc, InvestingMxDomState>(
          listener: (context, state) async {
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
                  rfc: state.accountItem.number,
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
                //TO SUCCESS

                GoToInvest(state);
              }
            }
          },
          child: BlocBuilder<InvestingMxDomBloc, InvestingMxDomState>(
              builder: (context, state) => _buildRoot(context, state)),
        ));
  }

  Widget _buildRoot(BuildContext context, InvestingMxDomState state) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
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
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              _header(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              _subTitle(context),
              widget.bankTransfer ? Container() : _subTitleDebit(context),
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
              _numCuentaTextField(context),
              _warning(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              _footer(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _warning(context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimens.layoutHSpacerS,
        ),
        Text(
          S.of(context).accountRegistrationDebitWarning,
          style: AppTextStyles.normal4,
        ),
      ],
    );
  }

  Padding _footer(BuildContext context) {
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
                _showPopUp(context);
              }
            : null,
      ),
    );
  }

  _showPopUp(BuildContext context) {
    getIt<IFireBaseEventLogger>().accountRegister();

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
            acceptCallBack: () async {
              ExtendedNavigator.rootNavigator.pop();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (getIt<IEnv>().isColombia()) {
                if (prefs.getBool("videoLoaded") == false ||
                    prefs.getBool("videoLoaded") == null) {
                  if (widget.goal.fee >= 300000) {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoSenderIntroPageCol()),
                    );

                    if (result) {
                      if (!widget.bankTransfer) {
                        context.bloc<InvestingMxDomBloc>().add(
                              InvestingMxDomEvent.createAccount(
                                widget.isWallet ? true : !widget.isWithdrawal,
                              ),
                            );
                      }
                    }
                  } else {
                    if (!widget.bankTransfer) {
                      context.bloc<InvestingMxDomBloc>().add(
                            InvestingMxDomEvent.createAccount(
                              widget.isWallet ? true : !widget.isWithdrawal,
                            ),
                          );
                    }
                  }
                } else {
                  if (!widget.bankTransfer) {
                    context.bloc<InvestingMxDomBloc>().add(
                          InvestingMxDomEvent.createAccount(
                            widget.isWallet ? true : !widget.isWithdrawal,
                          ),
                        );
                  }
                }
              } else {
                if (!widget.bankTransfer) {
                  context.bloc<InvestingMxDomBloc>().add(
                        InvestingMxDomEvent.createAccount(
                          widget.isWallet ? true : !widget.isWithdrawal,
                        ),
                      );
                }
              }
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

  createAccountCall(context) {
    print("aquiii estoy  en esto");
    if (!widget.bankTransfer) {
      context.bloc<InvestingMxDomBloc>().add(
            InvestingMxDomEvent.createAccount(
              widget.isWallet ? true : !widget.isWithdrawal,
            ),
          );
    }
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
          ? S.of(context).registerBankAccountBankTransferCO
          : ((widget.isWallet)
              ? S.of(context).registerBankAccountSubtitleGeneral
              : S.of(context).registerBankAccountSubtitleCO),
      style: AppTextStyles.normal4,
    );
  }

  Widget _subTitleDebit(BuildContext context) {
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
          S.of(context).accountRegistrationDebitSubtitle2,
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

  Widget _numCuentaTextField(BuildContext context) {
    var textField = S.of(context).accountNumber;
    return Column(
      children: <Widget>[
        CustomTextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,

            AccountNumberTextInputFormatter(),
          ],
          keyboardType: TextInputType.number,
          focusNode: _fieldValue,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hoverColor: AppColors.g25Color,
            fillColor: AppColors.inputColor,
            filled: true,
            counterStyle: TextStyle(color: Colors.transparent),
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
          maxLength: 19,
          maxLengthEnforced: true,
          controller: accountNumber,
          onChanged: (value) {
            context
                .bloc<InvestingMxDomBloc>()
                .add(InvestingMxDomEvent.updateAccountNumber(value));
          },
          validator: (String value) {
            return null;
          },
        ),
      ],
    );
  }
}
