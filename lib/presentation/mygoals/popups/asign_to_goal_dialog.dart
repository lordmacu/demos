import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button_small.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/expanding_container.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../injection.dart';

class AsignToGoalDialog extends HookWidget {
  final List<DashboardGoal> goals;
  final DashboardGoal goalCheck;
  final double notAssignedBalance;
  final Function acceptCallBack;
  final Function undoCallBack;
  final BuildContext contextFather;
  final WithdrawalFormState state;

  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  AsignToGoalDialog({
    Key key,
    this.goals,
    this.goalCheck,
    this.notAssignedBalance,
    this.acceptCallBack,
    this.undoCallBack,
    this.contextFather,
    this.state,
  });

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

  @override
  Widget build(BuildContext context) {
    List areExpanded = [];
    List controllers = [];
    var isError = useState(false);
    var anyExpanded = useState(false);
    var buttonEnabled = useState(false);
    List<FocusNode> nodes = [];

    for (int i = 0; i < goals.length; i++) {
      var isExpanded = useState(false);
      var coCurrency = useTextEditingController();
      var node = useFocusNode();
      areExpanded.add(isExpanded);
      controllers.add(coCurrency);
      nodes.add(node);
    }

    return BlocProvider<WithdrawalFormBloc>(
        create: (contextBloc) => getIt<WithdrawalFormBloc>(),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppDimens.dialogBorderRadius,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              height: (goals.length == 6) ||
                      (goals.length == 5) ||
                      (goals.length == 4)
                  ? anyExpanded.value
                      ? 700
                      : 600
                  : (goals.length == 3)
                      ? anyExpanded.value
                          ? 600
                          : 500
                      : (goals.length == 2)
                          ? anyExpanded.value
                              ? 520
                              : 420
                          : (goals.length == 1)
                              ? anyExpanded.value
                                  ? 430
                                  : 330
                              : anyExpanded.value
                                  ? 700
                                  : 600,
              margin: EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).assignToGoal,
                          style: AppTextStyles.title2.copyWith(
                              color: AppColors.g50Color, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: AppDimens.layoutSpacerS,
                      ),
                      Icon(
                        Icons.attach_money,
                        size: 40,
                        color: AppColors.successColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  Text(
                    S.of(context).assignDialogSubtitle,
                    style: AppTextStyles.normal1.copyWith(
                      color: AppColors.g75Color,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  goalContainer(
                    context,
                    controllers,
                    nodes,
                    areExpanded,
                    anyExpanded,
                    buttonEnabled,
                    isError,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            action: undoCallBack,
                            text: S.of(context).goBack,
                          ),
                        ),
                        SizedBox(
                          width: AppDimens.layoutSpacerS,
                        ),
                        Expanded(
                          child: PrimaryButtonSmall(
                            text: S.of(context).continueButton,
                            action: acceptCallBack,
                            enabled: buttonEnabled.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container goalContainer(
      BuildContext context,
      List controllers,
      List<FocusNode> nodes,
      List areExpanded,
      ValueNotifier<bool> anyExpanded,
      ValueNotifier<bool> buttonEnabled,
      ValueNotifier<bool> isError) {
    return Container(
      height: (goals.length == 6) || (goals.length == 5) || (goals.length == 4)
          ? anyExpanded.value
              ? 500
              : 400
          : (goals.length == 3)
              ? anyExpanded.value
                  ? 400
                  : 300
              : (goals.length == 2)
                  ? anyExpanded.value
                      ? 300
                      : 200
                  : (goals.length == 1)
                      ? anyExpanded.value
                          ? 220
                          : 120
                      : anyExpanded.value
                          ? 500
                          : 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: goals.map((element) {
                var index = goals.indexOf(element);

                DashboardGoal goal = goals[index];
                var parser = EmojiParser();
                var setEmoji = parser.info(goal.emoji);
                var nameEmoji = setEmoji.full;
                var controller = controllers[index];
                var node = nodes[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutSpacerXXs,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          isError.value = false;
                          if (areExpanded[index].value == true) {
                            areExpanded[index].value =
                                !areExpanded[index].value;
                            anyExpanded.value = false;
                            controller.clear();
                          } else {
                            for (int i = 0; i < areExpanded.length; i++) {
                              if (i != index) {
                                areExpanded[i].value = false;
                                controllers[i].clear();
                              }
                            }
                            areExpanded[index].value =
                                !areExpanded[index].value;
                            anyExpanded.value = true;
                          }
                        },
                        child: ExpandingContainer(
                          size: 90,
                          expandedSize: isError.value ? 180 : 160,
                          animatedContainerHeight: isError.value ? 80.0 : 60.0,
                          expand: areExpanded[index].value,
                          permanent: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    goal.id != 0
                                        ? Text(
                                            parser.emojify(nameEmoji),
                                            style: TextStyle(fontSize: 35.0),
                                            textAlign: TextAlign.left,
                                          )
                                        : Image.asset(
                                            AppImages.appIcon,
                                            height: 40.0,
                                          ),
                                    SizedBox(
                                      width: AppDimens.layoutSpacerM,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "${goal.name}",
                                          style:
                                              AppTextStyles.caption1.copyWith(
                                            color: AppColors.g50Color,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "${formatedNumber(goal.currentAmt.floor())}",
                                          style: AppTextStyles.normal2.copyWith(
                                            color: AppColors.g50Color,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          child: TextFormField(
                            focusNode: node,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: InputDecoration(
                              hintText: S.of(context).withdrawalHint,
                              hintStyle: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g25Color),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              counterStyle: TextStyle(
                                color: Colors.transparent,
                              ),
                              errorStyle: AppTextStyles.menu1
                                  .copyWith(color: AppColors.dangerColor),
                              errorMaxLines: 2,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.layoutMarginS,
                                  vertical: AppDimens.layoutSpacerXXs * 2),
                            ),
                            autocorrect: false,
                            autofocus: false,
                            controller: controller,
                            autovalidateMode: AutovalidateMode.always,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              MoneyTextInputFormatter(),
                            ],
                            validator: (value) {
                              String stringValue = value
                                  .replaceAll("\$", "")
                                  .replaceAll(".", "");
                              double doubleValue = double.tryParse(stringValue);
                              if (doubleValue != null && doubleValue != 0) {
                                if (doubleValue <
                                    EnvironmentConfig.minGoalAssignValue) {
                                  return getIt<IEnv>().isColombia()
                                      ? S.of(context).assignErrorLow
                                      : S.of(context).assignErrorLowMx;
                                } else if (doubleValue > goal.currentAmt) {
                                  return S.of(context).assignErrorHigh;
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (areExpanded[index].value) {
                                String stringValue = value
                                    .replaceAll("\$", "")
                                    .replaceAll(".", "")
                                    .replaceAll(",", "");

                                double doubleValue =
                                    double.tryParse(stringValue);

                                if (!getIt<IEnv>().isColombia()) {
                                  doubleValue = doubleValue / 100;
                                }

                                if (doubleValue != 0 && doubleValue != null) {
                                  if (doubleValue <
                                      EnvironmentConfig.minGoalAssignValue) {
                                    print("aqioooo unooo ");
                                    buttonEnabled.value = false;
                                    isError.value = true;
                                  } else if (doubleValue > goal.currentAmt) {
                                    print("aqioooo dossss ");

                                    buttonEnabled.value = false;
                                    isError.value = true;
                                  } else {
                                    isError.value = false;
                                    buttonEnabled.value = true;
                                    contextFather
                                        .bloc<WithdrawalFormBloc>()
                                        .add(
                                          WithdrawalFormEvent.assignFrom(
                                            goal,
                                            doubleValue,
                                          ),
                                        );
                                  }
                                } else {
                                  print("aqioooo tressss ");

                                  buttonEnabled.value = false;
                                  isError.value = false;
                                }
                              }
                            },
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      goals.length > 1
                          ? SizedBox(
                              height: AppDimens.layoutSpacerS,
                            )
                          : Container(),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
