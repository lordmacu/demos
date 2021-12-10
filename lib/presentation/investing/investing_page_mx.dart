import 'package:ualet/application/investingMX/investing_choose_goal/investing_choose_goal_bloc.dart';
import 'package:ualet/domain/core/values.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/investing/widgets/expanding_container_investing.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar_mx.dart';
import 'package:ualet/presentation/investing/widgets/money_text_input_formatter_mx.dart';
import 'package:ualet/presentation/withdrawalMX/widgets/expanding_container.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/dashboard/dashboard_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar.dart';
import 'package:ualet/router/router.gr.dart';

import 'widgets/money_text_input_formatter.dart';

class InvestingIntroPageMx extends HookWidget {
  final formatCurrency = NumberFormaters.mxFormater;
  @override
  Widget build(BuildContext context) {
    final leftSelected = useState(true);
    final indexSelected = useState(-1);

    List<ValueNotifier<bool>> areExpanded = [];
    List controllers = [];
    List<FocusNode> nodes = [];

    for (int i = 0; i < 5; i++) {
      var coCurrency = useTextEditingController();
      var isExpanded = useState(false);
      var _node = useFocusNode();
      areExpanded.add(isExpanded);
      controllers.add(coCurrency);
      nodes.add(_node);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) =>
              getIt<DashboardBloc>()..add(DashboardEvent.getInformation()),
        ),
        BlocProvider<InvestingChooseGoalBloc>(
          create: (context) => getIt<InvestingChooseGoalBloc>(),
        ),
      ],
      child:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        return state.maybeMap(
          orElse: () => Container(),
          initial: (_) => Container(),
          //LOADING
          loading: (_) => Stack(
            children: <Widget>[
              Container(
                color: AppColors.primaryColor,
              ),
              LoadingInProgressOverlay(isLoading: true),
            ],
          ),
          //loadFail
          loadFail: (error) => Text("Error"),
          loadSuccess: (dashboardState) {
            return BlocBuilder<InvestingChooseGoalBloc,
                InvestingChooseGoalState>(
              builder: (context, state) {
                return _buildRoot(
                  context,
                  dashboardState.data,
                  state,
                  indexSelected,
                  leftSelected,
                  areExpanded,
                  controllers,
                  nodes,
                );
              },
            );
          },
        );
      }),
    );
  }

  Scaffold _buildRoot(
    BuildContext context,
    DashboardData dashboardData,
    InvestingChooseGoalState state,
    ValueNotifier<int> index,
    ValueNotifier<bool> leftSelected,
    List<ValueNotifier<bool>> areExpanded,
    List controllers,
    List<FocusNode> nodes,
  ) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.only(
              left: AppDimens.layoutMargin,
              right: AppDimens.layoutMargin,
              top: AppDimens.layoutSpacerXs,
              bottom: AppDimens.layoutSpacerXs),
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
            _headerInvestIntro(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _selectInvestingOptionHeader(context),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _selectInvestingOptionButtons(
                context, leftSelected, areExpanded, dashboardData, controllers),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _selectGoalDescription(context),
            SizedBox(
              height: AppDimens.layoutMarginM,
            ),
            _goalSelectionSection(
              context,
              dashboardData,
              state,
              index,
              areExpanded,
              controllers,
              leftSelected,
              nodes,
            ),
            SizedBox(
              height: AppDimens.layoutMarginM,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(
                      AppDimens.dialogBorderRadius,
                    )),
                padding: EdgeInsets.all(
                  AppDimens.layoutSpacerM,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).myGoalsInvestment,
                      style: AppTextStyles.normal1.copyWith(
                        color: AppColors.g75Color,
                      ),
                    ),
                    Text(
                      "${formatCurrency.format(state.total)}",
                      style: AppTextStyles.normal2.copyWith(
                        color: AppColors.g75Color,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            _footer(context, state, leftSelected),
          ],
        ),
      ),
    );
  }

  Padding _footer(BuildContext context, InvestingChooseGoalState state,
      ValueNotifier<bool> leftSelected) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).nextButton,
        action: state.isActive
            ? () {
                int periodicity = 1;
                for (int i = 0; i < state.goalsChosen.length; i++) {
                  if (state.goalsChosen[i].periodicity != 0) {
                    periodicity = state.goalsChosen[i].periodicity;
                    break;
                  }
                }
                ExtendedNavigator.rootNavigator.pushNamed(Routes.investToGoalMx,
                    arguments: InvestingGoalPageMxArguments(
                      goal: DashboardGoal.empty(),
                      leftSelected: leftSelected.value,
                      goals: state.goalsChosen,
                      values: state.valuesChosen,
                      multiple: true,
                      periodicity: periodicity,
                    ));
              }
            : null,
      ),
    );
  }

  Widget _headerInvestIntro(context) {
    return Text(
      S.of(context).investTitle,
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
    List<ValueNotifier<bool>> areExpanded,
    DashboardData dData,
    List controllers,
  ) {
    return InvestingTabBarMX(
        onClickLeft: () {
          //Firebase 21
          // getIt<IFirebaseEventLoggerMX>().domiciliacionInvest();
          for (int i = 0; i < dData.goals.size; i++) {
            context
                .bloc<InvestingChooseGoalBloc>()
                .add(InvestingChooseGoalEvent.deleteGoal(dData.goals[i]));
            controllers[i].clear();
            areExpanded[i].value = false;
          }
          leftSelected.value = true;
        },
        onClickRight: () {
          //Firebase 26
          // getIt<IFirebaseEventLoggerMX>().speiInvestment();
          for (int i = 0; i < dData.goals.size; i++) {
            context
                .bloc<InvestingChooseGoalBloc>()
                .add(InvestingChooseGoalEvent.deleteGoal(dData.goals[i]));
            controllers[i].clear();
            areExpanded[i].value = false;
          }
          leftSelected.value = false;
        },
        leftActivated: leftSelected.value);
  }

  Widget _selectGoalDescription(context) {
    return Text(
      S.of(context).investSelectGoal,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal4,
    );
  }

  Widget _goalSelectionSection(
    context,
    DashboardData dData,
    InvestingChooseGoalState state,
    ValueNotifier<int> index,
    List<ValueNotifier<bool>> areExpanded,
    List controllers,
    ValueNotifier<bool> leftSelected,
    List<FocusNode> nodes,
  ) {
    return Container(
      height: 260,
      child: ListView.builder(
        itemCount: dData.goals.size,
        primary: false,
        itemBuilder: (context, index) {
          DashboardGoal goal = dData.goals[index];
          bool isTapable = !goal.tieneDomiciliacionprogramada;
          var controller = controllers[index];
          var parser = EmojiParser();
          var setEmoji = parser.info('${goal.emoji}');
          var nameEmoji = setEmoji.full;

          return Container(
            child: Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (areExpanded[index].value == true) {
                      context
                          .bloc<InvestingChooseGoalBloc>()
                          .add(InvestingChooseGoalEvent.deleteGoal(goal));
                      controller.clear();
                    } else {
                      if (state.chosedPeriodicity != goal.periodicity &&
                          leftSelected.value) {
                        if (state.chosedPeriodicity != 0) {
                          ToastHelper.createInfo(
                                  message:
                                      S.of(context).multiGoalPeriodicityToast,
                                  duration: Duration(seconds: 5))
                              .show(context);
                        }
                        context.bloc<InvestingChooseGoalBloc>().add(
                            InvestingChooseGoalEvent.choosePeriodicity(
                                goal.periodicity));
                        for (int i = 0; i < areExpanded.length; i++) {
                          if (index != i) {
                            areExpanded[i].value = false;
                            controllers[i].clear();
                          }
                        }
                      }
                    }
                    areExpanded[index].value = !areExpanded[index].value;
                  },
                  child: isTapable || !leftSelected.value
                      ? ExpandingContainer(
                          expand: areExpanded[index].value,
                          permanent: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      EmojiParser().emojify(nameEmoji),
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimens.layoutSpacerM,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${goal.name}",
                                          style:
                                              AppTextStyles.caption1.copyWith(
                                            color: AppColors.g50Color,
                                          ),
                                        ),
                                        Text(
                                          "${formatCurrency.format(goal.currentAmt.floor())}",
                                          style: AppTextStyles.normal2.copyWith(
                                            color: AppColors.g50Color,
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
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: false,
                              signed: false,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              MoneyTextInputFormatterMx(), //TODO: Cambiar a mx
                            ],
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
                            focusNode: nodes[index],
                            validator: (value) {
                              String stringValue = value
                                  .replaceAll("\$", "")
                                  .replaceAll(",", "");
                              double doubleValue = double.tryParse(stringValue);
                              if (doubleValue != null && doubleValue != 0) {
                                if (doubleValue < Values.minInvestment) {
                                  return S.of(context).errorFeeLowerThanMin;
                                } else if (doubleValue > goal.goalAmt) {
                                  return S.of(context).errorFeeGreaterThanTotal;
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) async {
                              String stringValue = value
                                  .replaceAll("\$", "")
                                  .replaceAll(",", "");
                              double doubleValue = double.tryParse(stringValue);
                              print("DValue: $doubleValue");
                              if (doubleValue != 0 && doubleValue != null) {
                                context.bloc<InvestingChooseGoalBloc>().add(
                                    InvestingChooseGoalEvent.addGoal(
                                        goal, doubleValue));
                              } else {
                                context.bloc<InvestingChooseGoalBloc>().add(
                                    InvestingChooseGoalEvent.deleteGoal(goal));
                              }
                            },
                          ),
                        )
                      : ExpandingContainerInvesting(
                          expand: false,
                          child: Container(),
                          permanent: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      EmojiParser().emojify(nameEmoji),
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimens.layoutSpacerM,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${goal.name}",
                                            style:
                                                AppTextStyles.caption1.copyWith(
                                              color: AppColors.g50Color,
                                            ),
                                          ),
                                          Text(
                                            "${formatCurrency.format(goal.currentAmt.floor())}",
                                            style:
                                                AppTextStyles.normal2.copyWith(
                                              color: AppColors.g50Color,
                                            ),
                                          ),
                                          leftSelected.value
                                              ? Text(
                                                  S
                                                      .of(context)
                                                      .domiciliacionYaProgramada,
                                                  style: AppTextStyles.menu1
                                                      .copyWith(
                                                          color: AppColors
                                                              .dangerColor),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: AppDimens.layoutMarginS,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
