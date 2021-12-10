import 'package:ualet/domain/debits/debit_item.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/mygoals/popups/delete_goal_debit_multiple.dart';
import 'package:ualet/to_be_refactor/pages/home/floating_bottom.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/sign_out_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:kt_dart/collection.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_bloc.dart';
import 'package:ualet/application/withdrawalMX/withdrawal_form/withdrawal_form_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/withdrawal_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/mygoals/popups/delete_goal_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/text_formatters.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots.dart';
import 'popups/warning_forgot_debit_mx_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:ualet/presentation/core/widgets/ColumnBuilder.dart';
import 'package:ualet/presentation/core/widgets/WidgetSize.dart';
import 'package:after_layout/after_layout.dart';

class Goal extends StatefulWidget {
  final parser;
  final nameEmoji;
  final goal;
  final percent;
  final leftSymbol;
  final relGoals;
  final formater;
  final currentGoal;
  final debit2;
  final info;
  final monthsPassed;
  final debit;
  final goalTransactions;
  final goalDebits;
  final items;
  final prefs;
  final Function sizeW;
  final index;

  Goal(
      {this.index,
      this.sizeW,
      this.parser,
      this.nameEmoji,
      this.goal,
      this.percent,
      this.formater,
      this.leftSymbol,
      this.relGoals,
      this.currentGoal,
      this.debit2,
      this.info,
      this.monthsPassed,
      this.debit,
      this.goalTransactions,
      this.goalDebits,
      this.items,
      this.prefs});
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> with AfterLayoutMixin<Goal> {
  GlobalKey _keyRed = GlobalKey();
  SharedPreferences _prefs = getIt<SharedPreferences>();

  String feeText;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          key: _keyRed,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppDimens.dialogBorderRadius)),
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutMarginHorizontalScroll),
              padding: EdgeInsets.only(
                left: AppDimens.layoutMarginS,
                right: AppDimens.layoutMarginButton,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        widget.parser.emojify(widget.nameEmoji),
                        style: TextStyle(fontSize: 40.0),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: AppDimens.layoutHSpacerS,
                      ),
                      Flexible(
                        child: Text(
                          widget.goal.name,
                          style: AppTextStyles.subtitle2.copyWith(
                            color: AppColors.g50Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutHSpacerS,
                  ),
                  Divider(
                    color: AppColors.backgroundColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: AppDimens.layoutHSpacerS,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircularPercentIndicator(
                                radius: 85,
                                lineWidth: 9,
                                animateFromLastPercent: true,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: widget.percent / 100,
                                progressColor: AppColors.primaryColor,
                                backgroundColor: AppColors.backgroundColor,
                                startAngle: 0,
                                reverse: true,
                                center: Text(
                                  widget.percent == 0
                                      ? " ${widget.percent.toStringAsFixed(0)}%"
                                      : " ${widget.percent.toStringAsPrecision(2)}%",
                                  style: AppTextStyles.subtitle2.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.layoutMarginS,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    S.of(context).myGoalsBalance,
                                    style: AppTextStyles.menu1.copyWith(
                                        color: AppColors.g75Color,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "${widget.leftSymbol}${widget.formater.format(widget.goal.currentAmt)}",
                                    style: AppTextStyles.subtitle2.copyWith(
                                        color: AppColors.primaryColor),
                                  ),
                                  SizedBox(
                                    width: AppDimens.layoutSpacerXXs,
                                  ),
                                  Text(
                                    S.of(context).myGoalsGoal,
                                    style: AppTextStyles.menu1.copyWith(
                                        color: AppColors.g75Color,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "${widget.leftSymbol}${widget.formater.format(widget.goal.goalAmt)}",
                                    style: AppTextStyles.normal2
                                        .copyWith(color: AppColors.g50Color),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            ExtendedNavigator.rootNavigator.pushNamed(
                              Routes.editGoalPage,
                              arguments: EditGoalPageArguments(
                                relatedGoals: widget.relGoals, //TODO CAMBIAR
                                goal: widget.currentGoal,
                                relatedDebit: widget.debit2,
                                info: widget.info,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppDimens.dialogBorderRadius)),
              margin: EdgeInsets.only(
                left: AppDimens.layoutMarginHorizontalScroll,
                right: AppDimens.layoutMarginHorizontalScroll,
                top: 50,
              ),
              padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginS,
                  right: AppDimens.layoutMarginS,
                  top: AppDimens.layoutMargin,
                  bottom: AppDimens.layoutMarginS),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        S.of(context).myGoalsInvestment,
                        style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${widget.leftSymbol}${widget.formater.format(0)}",
                        style: AppTextStyles.normal2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerXs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        S.of(context).myGoalsMonthlySavings,
                        style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "$feeText",
                        style: AppTextStyles.normal2.copyWith(
                          color: AppColors.g75Color,
                        ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).myGoalsTimeElapsed,
                            style: AppTextStyles.normal1.copyWith(
                                color: AppColors.g75Color,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            S.of(context).myGoalsTotalTime,
                            style: AppTextStyles.caption1.copyWith(
                                color: AppColors.g50Color,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            widget.monthsPassed > 1
                                ? "${widget.monthsPassed} meses"
                                : "${widget.monthsPassed} mes",
                            style: AppTextStyles.normal2.copyWith(
                              color: AppColors.g75Color,
                            ),
                          ),
                          Text(
                            widget.goal.numMonths > 1
                                ? "${widget.goal.numMonths} meses"
                                : "${widget.goal.numMonths} mes",
                            style: AppTextStyles.caption1.copyWith(
                                color: AppColors.g50Color,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: AppDimens.layoutMarginHorizontalScroll,
                right: AppDimens.layoutMarginHorizontalScroll,
              ),
              padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginS,
                  right: AppDimens.layoutMarginS,
                  top: AppDimens.layoutMargin,
                  bottom: AppDimens.layoutMarginS),
              child: Text(
                S.of(context).automaticDebit,
                style:
                    AppTextStyles.subtitle2.copyWith(color: AppColors.g75Color),
              ),
            ),
            widget.debit != null
                ? _buildDebit(widget.goalDebits, widget.info)
                : Container(
                    margin: EdgeInsets.only(
                      left: AppDimens.layoutHSpacerS,
                      right: AppDimens.layoutHSpacerS,
                    ),
                    color: AppColors.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "⏰",
                          style: TextStyle(fontSize: 40.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).myGoalsNoDebits,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subtitle1.copyWith(
                              color: AppColors.g50Color,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(
                left: AppDimens.layoutMarginHorizontalScroll,
                right: AppDimens.layoutMarginHorizontalScroll,
              ),
              padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginS,
                  right: AppDimens.layoutMarginS,
                  top: AppDimens.layoutMargin,
                  bottom: AppDimens.layoutMarginS),
              child: Text(
                S.of(context).myGoalsMovements,
                style:
                    AppTextStyles.subtitle2.copyWith(color: AppColors.g75Color),
              ),
            ),
            widget.goal.goalTransactions.length == 0
                ? Container(
                    margin: EdgeInsets.only(
                      left: AppDimens.layoutHSpacerS,
                      right: AppDimens.layoutHSpacerS,
                    ), //TODO: sin transacciones

                    color: AppColors.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "😅",
                          style: TextStyle(fontSize: 40.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).myGoalsNoMovements,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subtitle1.copyWith(
                              color: AppColors.g50Color,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(S.of(context).myGoalsNoMovementsDescription,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.normal1.copyWith(
                                color: AppColors.g75Color,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  )
                : Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(
                            AppDimens.dialogBorderRadius)),
                    margin: EdgeInsets.only(
                      left: AppDimens.layoutMarginHorizontalScroll,
                      right: AppDimens.layoutMarginHorizontalScroll,
                    ),
                    padding: EdgeInsets.only(
                        left: AppDimens.layoutMarginS,
                        right: AppDimens.layoutMarginS,
                        top: AppDimens.layoutMargin,
                        bottom: AppDimens.layoutMarginS),
                    child: ListView.separated(
                      primary: false,
                      separatorBuilder: (context, index) => Divider(
                        color: AppColors.backgroundColor,
                        indent: 20.5,
                        endIndent: 20.5,
                        height: 0,
                        thickness: 1,
                      ),
                      itemCount: widget.goalTransactions.length,
                      itemBuilder: (context, ind) {
                        var createDate = DateTime.parse(
                            widget.goalTransactions[ind]["CreateDate"]);
                        var value = widget.goalTransactions[ind]["Value"];
                        var state = widget.goalTransactions[ind]["State"];
                        var type = widget.goalTransactions[ind]["Type"];

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: AppDimens.layoutSpacerS,
                              bottom: AppDimens.layoutSpacerS),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      type,
                                      style: AppTextStyles.normal1.copyWith(
                                          color: AppColors.g75Color,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${createDate.day}/${createDate.month}/${createDate.year}",
                                      style: AppTextStyles.caption1.copyWith(
                                          color: AppColors.g50Color,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: AppDimens.layoutSpacerXs),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  _transactionType(type, value),
                                  _transactionState(state)
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            widget.goal.goalTransactions.length == 0
                ? Container(
                    height: 50,
                    child: Visibility(
                      visible: !_prefs.validMigrateShowButtonDeleteGoal,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          _showPopupWithdrawal(
                            context,
                            widget.goal,
                            widget.info,
                            widget.goal.tieneDomiciliacionprogramada,
                            widget.goal.currentAmt > 0,
                          );
                        },
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              _showPopupWithdrawal(
                                context,
                                widget.goal,
                                widget.info,
                                widget.goal.tieneDomiciliacionprogramada,
                                widget.goal.currentAmt > 0,
                              );
                            },
                            child: Text(
                              S.of(context).deleteGoal,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      height: 50,
                      child: Visibility(
                        visible: !_prefs.validMigrateShowButtonDeleteGoal,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            _showPopupWithdrawal(
                              context,
                              widget.goal,
                              widget.info,
                              widget.goal.tieneDomiciliacionprogramada,
                              widget.goal.currentAmt > 0,
                            );
                          },
                          child: Center(
                            child: Text(
                              S.of(context).deleteGoal,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      feeText =
          "${widget.leftSymbol}${widget.formater.format(widget.currentGoal.fee)}";
    });
  }

  Widget _buildDebit(List<DebitInfo> debitItems, WithdrawalInfo info) {
    String periodicity = '';
    switch (debitItems.first.periodicity) {
      case DashboardGoal.MENSUAL:
        periodicity = 'Mensual';
        break;
      case DashboardGoal.QUINCENCAL:
        periodicity = 'Quincenal';
        break;
      case DashboardGoal.TRIMESTRAL:
        periodicity = 'Trimestral';
        break;
      default:
    }
    List<Widget> lst = [];
    for (var item in debitItems) {
      double debitsTotal = debitItems.fold(0, (a, b) => a += b.value);
      // String amountText = "\$${formater.format(item.value)}";
      String amountText =
          "${widget.leftSymbol}${widget.formater.format(debitsTotal)}";
      String feeText =
          "${widget.leftSymbol}${widget.formater.format(widget.currentGoal.fee)}";
      var w = Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMarginHorizontalScroll),
            height: 130,
            padding: EdgeInsets.all(
              AppDimens.layoutMarginS,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(
                AppDimens.dialogBorderRadius,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // CachedNetworkImage(
                    //   imageUrl: item.bankImageUrl,
                    //   width: 80,
                    // ),
                    SizedBox(
                      width: AppDimens.layoutMarginS,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.bankAccountName,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.g50Color,
                          ),
                        ),
                        Text(
                          "${S.of(context).thisGoal}:  $feeText",
                          style: AppTextStyles.caption2.copyWith(
                            color: AppColors.successColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${S.of(context).total}:           ",
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.g50Color,
                              ),
                            ),
                            Text(
                              "$amountText",
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.g50Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          periodicity,
                          style: AppTextStyles.normal2.copyWith(
                            color: AppColors.g50Color,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      // ExtendedNavigator.rootNavigator.pushNamed(
                      //     Routes.editDebitPage,
                      //     arguments: EditDebitPageArguments(
                      //         debitItem: item, goal: item.linkedGoal));
                      DebitInfo debit = DebitInfo.empty();
                      for (var d in info.debits) {
                        if (d.goalId.contains(widget.currentGoal.id)) {
                          debit = d;
                        }
                      }
                      List<DashboardGoal> relGoals = [];
                      for (var g in widget.items.asList()) {
                        if (debit.goalId.contains(g.id) &&
                            widget.currentGoal.id != g.id) {
                          relGoals.add(g);
                        }
                      }
                      if (widget.currentGoal.migrate) {
                        ToastHelper.createError(
                                message: S.of(context).cantEditDebit)
                            .show(context);
                        return;
                      }
                      ExtendedNavigator.rootNavigator.pushNamed(
                          Routes.editGoalDebitPage,
                          arguments: EditGoalDebitPageArguments(
                              debitItem: item,
                              goal: widget.currentGoal,
                              goals: relGoals));
                      ;
                    })
              ],
            ),
          ),
          SizedBox(height: AppDimens.layoutSpacerS),
        ],
      );
      lst.add(w);
    }

    return Column(
      children: lst,
    );
    // return Container();
  }

  Widget _transactionType(type, value) {
    if (type.contains("Inversión") || type.contains("Ahorro")) {
      return Text(
        "${widget.leftSymbol}${widget.formater.format(value)}",
        style: AppTextStyles.normal2.copyWith(
          color: AppColors.g75Color,
        ),
      );
    } else {
      return Text(
        "-${widget.leftSymbol}${widget.formater.format(value)}",
        style: AppTextStyles.normal2.copyWith(
          color: AppColors.g75Color,
        ),
      );
    }
  }

  Widget _transactionState(transactionState) {
    if (transactionState == 1) {
      return Text(
        S.of(context).myGoalMovementsSuccessful,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.successColor,
        ),
      );
    } else if (transactionState == 2) {
      return Text(
        S.of(context).myGoalMovementsFailure,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.dangerColor,
        ),
      );
    } else {
      return Text(
        S.of(context).myGoalMovementsAwaiting,
        style: AppTextStyles.caption2.copyWith(
          color: AppColors.infoColor,
        ),
      );
    }
  }

  _showPopupWithdrawal(BuildContext context, DashboardGoal goal,
      WithdrawalInfo info, bool hasDebits, bool hasBalance) {
    List<DashboardGoal> goalsWithDebits = [];
    DebitInfo debit;
    if (hasDebits) {
      for (int i = 0; i < info.debits.length; i++) {
        debit = info.debits[i];
        if (debit.goalId.contains(goal.id)) {
          for (int j = 0; j < debit.goalId.length; j++) {
            goalsWithDebits.addAll(info.goals
                .where((element) => element.id == debit.goalId[j])
                .toList());
            print(goalsWithDebits.length);
          }
          break;
        }
      }
    }

    if (hasBalance) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: DeleteGoalDialog(
              hasBalance: true,
              descriptionText: S.of(context).deleteGoalDialogDescriptionBalance,
              questionText: S.of(context).deleteGoalDialogQuestion,
              leftText: S.of(context).deleteGoalButtonBalance,
              righText: S.of(context).deleteGoalgoBackButton,
              leftAction: () {
                if (hasDebits) {
                  if (goalsWithDebits.length > 1) {
                    _showPopupDebitMultiple(
                        context, goalsWithDebits, info, hasBalance, goal);
                  } else {
                    _showPopupDebit(context, goal, info, hasBalance);
                  }
                } else {
                  ExtendedNavigator.rootNavigator
                      .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                  ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.chooseAccountPageMX,
                    arguments: ChooseAccountPageArguments(
                        withdrawalInfo: info,
                        withdrawalAll: false,
                        chosenAmmount: goal.currentAmt,
                        chosenGoal: goal,
                        deleteGoal: true,
                        editGoal: true,
                        chosenGoals: [],
                        chosenValues: [],
                        withdrawalType: false,
                        goalDebits: []),
                  );
                }
              },
              rightAction: () => ExtendedNavigator.rootNavigator.pop(),
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.1)).animate(anim1),
            child: child,
          );
        },
      );
    } else {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: DeleteGoalDialog(
              hasBalance: false,
              descriptionText:
                  S.of(context).deleteGoalDialogDescriptionNoBalance,
              leftText: S.of(context).deleteGoalButtonNoBalance,
              righText: S.of(context).deleteGoalgoBackButton,
              leftAction: () {
                if (hasDebits) {
                  if (goalsWithDebits.length > 1) {
                    _showPopupDebitMultiple(
                      context,
                      goalsWithDebits,
                      info,
                      hasBalance,
                      goal,
                    );
                  } else {
                    _showPopupDebit(context, goal, info, hasBalance);
                  }
                } else {
                  ExtendedNavigator.rootNavigator
                      .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                  context
                      .bloc<WithdrawalFormBloc>()
                      .add(WithdrawalFormEvent.deleteGoal(goal));
                }
              },
              rightAction: () => ExtendedNavigator.rootNavigator.pop(),
            ),
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0.1)).animate(anim1),
            child: child,
          );
        },
      );
    }
  }

  _showPopupDebitMultiple(
    BuildContext context,
    List<DashboardGoal> goals,
    WithdrawalInfo info,
    bool hasBalance,
    DashboardGoal goalToDelete,
  ) {
    print("SHOW DEBIT MULTIPLE");
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: DeleteGoalDebitMultiple(
            goalsWithDebit: goals,
            goalToDelete: goalToDelete,
            reject: () => ExtendedNavigator.rootNavigator
                .popUntil(ModalRoute.withName(Routes.myGoalsPage)),
            accept: () {
              if (!hasBalance) {
                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                context
                    .bloc<WithdrawalFormBloc>()
                    .add(WithdrawalFormEvent.deleteGoal(goalToDelete));
              } else {
                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.chooseAccountPageMX,
                  arguments: ChooseAccountPageArguments(
                      withdrawalInfo: info,
                      withdrawalAll: false,
                      chosenAmmount: goalToDelete.currentAmt,
                      chosenGoal: goalToDelete,
                      deleteGoal: true,
                      deleteDebit: false,
                      chosenGoals: [],
                      chosenValues: [],
                      withdrawalType: false,
                      goalDebits: []),
                );
              }
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.1)).animate(anim1),
          child: child,
        );
      },
    );
  }

  _showPopupDebit(
      BuildContext context, DashboardGoal goal, info, bool hasBalance) {
    print("SHOW DEBIT");
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: WarningForgotDebitDialogMX(
            goalNames: goal.name,
            buttonText: S.of(context).forgotDebitDialogButton,
            buttonAction: () {
              if (!hasBalance) {
                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                context
                    .bloc<WithdrawalFormBloc>()
                    .add(WithdrawalFormEvent.deleteGoal(goal));
              } else {
                ExtendedNavigator.rootNavigator
                    .popUntil(ModalRoute.withName(Routes.myGoalsPage));
                ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.chooseAccountPageMX,
                  arguments: ChooseAccountPageArguments(
                      withdrawalInfo: info,
                      withdrawalAll: false,
                      chosenAmmount: goal.currentAmt,
                      chosenGoal: goal,
                      deleteDebit: true,
                      deleteGoal: true,
                      chosenGoals: [],
                      chosenValues: [],
                      withdrawalType: false,
                      goalDebits: [],
                      isFormDeleteGoal: true),
                );
              }
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.1)).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
    print("este es el tamaño del size  ${sizeRed.height}");
    widget.sizeW(sizeRed.height, widget.index);
  }
}
