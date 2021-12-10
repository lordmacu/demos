import 'package:ualet/domain/core/values.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter_mx.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/popups/valid_transaction_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/expanding_container.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class ChooseGoalPage extends HookWidget {
  final formatCurrencyMx =
      new NumberFormat.simpleCurrency(decimalDigits: 2, locale: "es_Mx");
  final formatCurrencyCol = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  final WithdrawalInfo withdrawalInfo;

  ChooseGoalPage({@required this.withdrawalInfo});

  // List controllers = List.generate(
  //     5,
  //     (i) => MoneyMaskedTextController(
  //           decimalSeparator: ".",
  //           initialValue: 0.0,
  //           leftSymbol: "\$",
  //           precision: 2,
  //           thousandSeparator: ".",
  //         ));

  double _parseMX(String value) {
    if (value == '') return 0;
    value = value.replaceAll(",", "");
    value = value.replaceAll("\$", "");
    return double.tryParse(value) ?? 0;
  }

  double _parseCOL(String value) {
    if (value == '') return 0;
    value = value.replaceAll(".", "");
    value = value.replaceAll("\$", "");
    return double.tryParse(value) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    bool isColombia = getIt<IEnv>().isColombia();
    var formatCurrency;
    if (isColombia) {
      formatCurrency = formatCurrency;
    } else {
      formatCurrency = formatCurrencyMx;
    }
    Function(String) dParser = isColombia ? _parseCOL : _parseMX;
    // var node = useFocusNode();

    List areExpanded = [];
    List controllers = [];
    List<FocusNode> nodes = [];
    bool isBelow = false;

    for (int i = 0; i < withdrawalInfo.goals.length; i++) {
      var isExpanded = useState(false);
      var coCurrency = useTextEditingController();
      var node = useFocusNode();
      areExpanded.add(isExpanded);
      controllers.add(coCurrency);
      nodes.add(node);
    }
    return BlocProvider<WithdrawalFormBloc>(
      create: (context) => getIt<WithdrawalFormBloc>(),
      child: BlocConsumer<WithdrawalFormBloc, WithdrawalFormState>(
        builder: (context, state) {
          /*
          for (int i = 0; i < withdrawalInfo.goals.length; i++) {
            // if (withdrawalInfo.goals[i].currentAmt < 10) { 
            if (withdrawalInfo.goals[i].currentAmt < 10000) {
              isBelow = true;
              break;
            }
          }
          */
          context
              .bloc<WithdrawalFormBloc>()
              .add(WithdrawalFormEvent.showDialog(isBelow));

          print(state.totalwithdrawal);
          return Scaffold(
            resizeToAvoidBottomInset: false,
             backgroundColor: AppColors.backgroundColor,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: AppDimens.layoutMarginM,
                right: AppDimens.layoutMarginM,
                bottom: AppDimens.layoutSpacerS,
              ),
              child: PrimaryButton(
                text: S.of(context).nextButton,
                //TODO: Check Country
                // action: () => ExtendedNavigator.rootNavigator.pushNamed(
                //   Routes.chooseAccountPageMX,
                //   arguments: ChooseAccountPageArguments(
                //     withdrawalInfo: withdrawalInfo,
                //     withdrawalAll: false,
                //     chosenAmmount: state.totalwithdrawal,
                //     chosenValues: state.ammountChosen,
                //     chosenGoal: DashboardGoal.empty(),
                //     chosenGoals: state.goalsChosen,
                //   ),
                // ),
                action: () {
                  //Validar que no tenga un retiro en estado pendiente.
                  if (withdrawalInfo.validateTransactionMsg != null) {
                    if (withdrawalInfo.validateTransactionMsg != ''
                        && withdrawalInfo.validateTransactionMsg != 'No puedes realizar esta transacción por que tienes programado un retiro pendiente') {
                      //PopUp
                      _showPopupValidTransaction(
                          context,
                          S.of(context).validateTransactionPopUpTitle,
                          withdrawalInfo.validateTransactionMsg,
                          S.of(context).validateTransactionPopUpButton);
                    } else {
                      List<DashboardGoal> goals = [];
                      state.goalsChosen.forEach((e) {
                        if (e.id != 0) goals.add(e);
                      });
                      return ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.chooseAccountPageMX,
                        arguments: ChooseAccountPageArguments(
                            withdrawalInfo: withdrawalInfo,
                            withdrawalAll: false,
                            chosenAmmount: state.totalwithdrawal,
                            chosenValues: state.ammountChosen,
                            chosenGoal: DashboardGoal.empty(),
                            chosenGoals: goals,
                            withdrawalType: false,
                            goalDebits: [],
                            banksInfoDebits: []),
                      );
                    }
                  }
                },
                enabled: buttonActive(state.ammountChosen, state.goalsChosen),
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
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
                        onPressed: () => ExtendedNavigator.rootNavigator.pop(),
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
                        S.of(context).withdrawalChooseGoalDescription,
                        style: AppTextStyles.normal1.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.g75Color),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      Container(
                        height: 330,
                        child: ListView.builder(
                          itemCount: withdrawalInfo.goals.length,
                          primary: false,
                          itemBuilder: (context, index) {
                            DashboardGoal goal = withdrawalInfo.goals[index];
                            bool isTapable = goal.currentAmt > 0;
                            var controller = controllers[index];
                            var parser = EmojiParser();
                            var node = nodes[index];
                            var setEmoji = parser.info('${goal.emoji}');
                            var nameEmoji = setEmoji.full;
                            return Opacity(
                              opacity: isTapable ? 1.0 : 0.6,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      if (goal.currentAmt > 0) {
                                        if (areExpanded[index].value == true) {
                                          areExpanded[index].value =
                                              !areExpanded[index].value;
                                          context
                                              .bloc<WithdrawalFormBloc>()
                                              .add(
                                                WithdrawalFormEvent
                                                    .unChooseGoal(goal),
                                              );
                                          controller.clear();
                                        } else {
                                          areExpanded[index].value =
                                              !areExpanded[index].value;
                                        }
                                      } else {
                                        context.bloc<WithdrawalFormBloc>().add(
                                            WithdrawalFormEvent.showDialog(
                                                true));
                                      }
                                    },
                                    child: ExpandingContainer(
                                      expand: areExpanded[index].value,
                                      permanent: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  EmojiParser()
                                                      .emojify(nameEmoji),
                                                  style:
                                                      TextStyle(fontSize: 38),
                                                ),
                                                SizedBox(
                                                  width:
                                                      AppDimens.layoutSpacerM,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "${goal.name}",
                                                      style: AppTextStyles
                                                          .caption1
                                                          .copyWith(
                                                        color:
                                                            AppColors.g50Color,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${formatCurrency.format(goal.currentAmt.floor())}",
                                                      style: AppTextStyles
                                                          .normal2
                                                          .copyWith(
                                                        color:
                                                            AppColors.g50Color,
                                                      ),
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
                                      ),
                                      child: TextFormField(
                                        focusNode: node,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true, signed: false),
                                        decoration: InputDecoration(
                                          hintText:
                                              S.of(context).withdrawalHint,
                                          hintStyle: AppTextStyles.normal1
                                              .copyWith(
                                                  color: AppColors.g25Color),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          counterStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                          errorStyle: AppTextStyles.menu1
                                              .copyWith(
                                                  color: AppColors.dangerColor),
                                          errorMaxLines: 2,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppDimens.layoutMarginS,
                                              vertical:
                                                  AppDimens.layoutSpacerXXs *
                                                      2),
                                        ),
                                        autocorrect: false,
                                        autofocus: false,
                                        controller: controller,
                                        autovalidateMode: AutovalidateMode.always,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          getIt<IEnv>().isColombia()
                                              ? MoneyTextInputFormatter()
                                              : MoneyTextInputFormatterMx(),
                                        ],
                                        validator: (value) {
                                          // String stringValue = value
                                          //     .replaceAll("\$", "")
                                          //     .replaceAll(".", "");
                                          // double doubleValue =
                                          //     double.tryParse(stringValue);
                                          double doubleValue = dParser(value);
                                          if (doubleValue != null &&
                                              doubleValue != 0) {
                                            return validateWithdrawal(
                                                doubleValue,
                                                goal.currentAmt,
                                                isColombia
                                                    ? 10000
                                                    : Values.withdrawalCost,
                                                context);
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          if (areExpanded[index].value) {
                                            double doubleValue = dParser(value);
                                            if (doubleValue != 0 &&
                                                doubleValue != null) {
                                              context
                                                  .bloc<WithdrawalFormBloc>()
                                                  .add(
                                                    WithdrawalFormEvent
                                                        .chooseGoal(
                                                      goal,
                                                      doubleValue,
                                                    ),
                                                  );
                                            } else {
                                              context
                                                  .bloc<WithdrawalFormBloc>()
                                                  .add(
                                                    WithdrawalFormEvent
                                                        .unChooseGoal(
                                                      goal,
                                                    ),
                                                  );
                                            }
                                          }
                                        },
                                        style: AppTextStyles.normal1.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
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
                    ],
                  ),
                  Positioned(
                    bottom: AppDimens.layoutSpacerS,
                    left: AppDimens.layoutMargin,
                    right: AppDimens.layoutMargin,
                    child: Container(
                      height: 135,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.circular(AppDimens.dialogBorderRadius),
                      ),
                      padding: EdgeInsets.all(AppDimens.layoutMarginS),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                               getIt<IEnv>().isColombia()
                                  ? S.of(context).withdrawal
                                  : S.of(context).withdrawalMx,
                                style: AppTextStyles.normal1
                                    .copyWith(color: AppColors.g75Color),
                              ),
                              Text(
                                "${formatCurrency.format(state.totalwithdrawal)}",
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
                                S.of(context).withdrawalFee,
                                style: AppTextStyles.normal1
                                    .copyWith(color: AppColors.g75Color),
                              ),
                              Text(
                                isColombia
                                    ? "${formatCurrency.format(1600)}"
                                    : "${formatCurrency.format(10)}",
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
                                isColombia
                                    ? "${formatCurrency.format(state.totalwithdrawal + 1600)}"
                                    : "${formatCurrency.format(state.totalwithdrawal + 10)}",
                                style: AppTextStyles.normal2
                                    .copyWith(color: AppColors.g75Color),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.isBelow && !state.alreadyShown) {
            context
                .bloc<WithdrawalFormBloc>()
                .add(WithdrawalFormEvent.alreadyShown(true));
            showGeneralDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: true,
                barrierLabel: "Label",
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (ctx, anim1, anim2) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomDialog(
                      buttonText: S.of(context).continueButton,
                      icon: Icons.info_outline,
                      iconColor: AppColors.infoColor,
                      title: S.of(context).withdrawalDialogMinTitle,
                      description: S.of(context).withdrawalDialogMinTitle,
                      buttonAction: () => ExtendedNavigator.rootNavigator.pop(),
                    ),
                  );
                },
                transitionBuilder: (ctx, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0.32))
                        .animate(anim1),
                    child: child,
                  );
                });
          }
        },
      ),
    );
  }

  String validateWithdrawal(
      double input, double goalValue, double min, context) {
    if (goalValue - input < min) {
      return S.of(context).withdrawalErrorCO;
    } else if (input < min) {
      return S.of(context).withdrawalErrorMin;
    } else {
      return null;
    }
  }

  bool buttonActive(List<double> values, List<DashboardGoal> goals) {
    print(values);
    double min = getIt<IEnv>().isColombia() ? 10000 : 10;
    bool noneChosen = true;
    for (int i = 0; i < goals.length; i++) {
      if (goals[i].id != 0) {
        noneChosen = false;
        if (goals[i].currentAmt - values[i] < min) {
          return false;
        } else if (values[i] < min) {
          return false;
        }
      }
    }
    return !noneChosen;
  }

  _showPopupValidTransaction(
      context, String titlePopUp, String bodyPopUp, String buttonText) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: ValidTransactionPopUp(
              title: titlePopUp,
              body: bodyPopUp,
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
