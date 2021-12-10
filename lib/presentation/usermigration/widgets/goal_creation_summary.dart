import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';

class GoalCreationSummary extends StatelessWidget {
  List<UserMigrationItem> debits;
  DashboardGoal goalCreated;
  int periodicity;
  final UserMigrationInfo userMigrationInfo;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final BalanceItem balance;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;

  final formater = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  GoalCreationSummary({
    Key key,
    @required this.debits,
    @required this.goalCreated,
    @required this.goalQuincenal,
    @required this.goalMensual,
    @required this.goalTrimestral,
    @required this.goalPse,
    this.balance,
    this.quincenalDone = false,
    this.mensualDone = false,
    this.trimestralDone = false,
    this.pseDone = false,
    @required this.userMigrationInfo,
    this.periodicity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var setEmoji = parser.info(goalCreated.emoji);
    var nameEmoji = setEmoji.full;
    var percent = goalCreated.percentComplete.round();
    percent = ((goalCreated.currentAmt / goalCreated.goalAmt) * 100).round();
    return Scaffold(
      bottomNavigationBar: Visibility(
        maintainAnimation: false,
        maintainInteractivity: false,
        maintainSemantics: false,
        maintainSize: false,
        maintainState: false,
        visible: pseDone && quincenalDone && mensualDone && trimestralDone,
        child: Padding(
          padding: EdgeInsets.all(
            AppDimens.layoutMargin,
          ),
          child: PrimaryButton(
            text: S.of(context).continueButton,
            action: () {
              ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                Routes.userMigrationPage,
                ModalRoute.withName(
                  Routes.introUserMigrationPage,
                ),
                arguments: UserMigrationPageArguments(
                  userMigrationInfo: userMigrationInfo,
                  balance: balance,
                  goalQuincenal: goalQuincenal,
                  goalMensual: goalMensual,
                  goalTrimestral: goalTrimestral,
                  goalPse: goalPse,
                  mensualDone: mensualDone,
                  pseDone: pseDone,
                  quincenalDone: quincenalDone,
                  trimestralDone: trimestralDone,
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          primary: false,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.layoutMargin,
            vertical: AppDimens.layoutSpacerS,
          ),
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: AppColors.primaryColor,
                  onPressed: () {
                    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                      Routes.userMigrationPage,
                      ModalRoute.withName(
                        Routes.introUserMigrationPage,
                      ),
                      arguments: UserMigrationPageArguments(
                        userMigrationInfo: userMigrationInfo,
                        balance: balance,
                        goalQuincenal: goalQuincenal,
                        goalMensual: goalMensual,
                        goalTrimestral: goalTrimestral,
                        mensualDone: mensualDone,
                        pseDone: pseDone,
                        goalPse: goalPse,
                        quincenalDone: quincenalDone,
                        trimestralDone: trimestralDone,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.layoutSpacerXXs,
            ),
            Text(
              S.of(context).resumeTitle,
              style: AppTextStyles.subtitle2.copyWith(
                color: AppColors.g25Color,
              ),
            ),
            periodicity < 4
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTitle(periodicity, context),
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                      Text(
                        "${debits.length}/${debits.length}",
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutSpacerL,
            ),
            Container(
              height: 240,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppDimens.dialogBorderRadius)),
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutMarginHorizontalScroll),
              padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginS,
                  right: AppDimens.layoutMarginButton,
                  top: AppDimens.layoutMargin,
                  bottom: AppDimens.layoutMarginS),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        parser.emojify(nameEmoji),
                        style: TextStyle(fontSize: 40.0),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: AppDimens.layoutHSpacerS,
                      ),
                      Flexible(
                        child: Text(
                          goalCreated.name,
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
                                percent: percent / 100,
                                progressColor: AppColors.primaryColor,
                                backgroundColor: AppColors.backgroundColor,
                                startAngle: 0,
                                reverse: true,
                                center: Text(
                                  " $percent%",
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
                                    "${formater.format(goalCreated.currentAmt)}",
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
                                    "${formater.format(goalCreated.goalAmt)}",
                                    style: AppTextStyles.normal2
                                        .copyWith(color: AppColors.g50Color),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimens.layoutSpacerM,
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(
                  AppDimens.dialogBorderRadius,
                ),
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
                        "${formater.format(0)}",
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
                      Text(
                        getAhorro(goalCreated.periodicity, context),
                        style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${formater.format(goalCreated.fee)}",
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
                            "${0} meses",
                            style: AppTextStyles.normal2.copyWith(
                              color: AppColors.g75Color,
                            ),
                          ),
                          Text(
                            goalCreated.numMonths > 1
                                ? "${goalCreated.numMonths} meses"
                                : "${goalCreated.numMonths} mes",
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
            periodicity < 4
                ? SizedBox(
                    height: AppDimens.layoutSpacerL * 1.5,
                  )
                : Container(),
            periodicity < 4
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTitle(periodicity, context),
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                      Text(
                        "${debits.length}/${debits.length}",
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  )
                : Container(),
            periodicity < 4
                ? SizedBox(
                    height: AppDimens.layoutSpacerXXs,
                  )
                : Container(),
            periodicity < 4
                ? Text(
                    S.of(context).yourDebits,
                    style: AppTextStyles.caption2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  )
                : Container(),
            SizedBox(
              height: AppDimens.layoutHSpacerS,
            ),
            periodicity < 4
                ? Container(
                    padding: EdgeInsets.all(
                      AppDimens.layoutSpacerM,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(
                        AppDimens.dialogBorderRadius,
                      ),
                    ),
                    height: debits.length > 1 ? 180 : 102,
                    child: ListView.separated(
                      primary: false,
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: debits.length,
                      itemBuilder: (context, index) {
                        UserMigrationItem item = debits[index];
                        return Container(
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: item.imgUrl.trim().trimRight(),
                                height: 40,
                              ),
                              SizedBox(
                                width: AppDimens.layoutSpacerS,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    getAccountType(item),
                                    style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.g50Color,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "${formater.format(item.value)}",
                                    style: AppTextStyles.caption2.copyWith(
                                      color: AppColors.g50Color,
                                    ),
                                  ),
                                  Text(
                                    getPeriodicity(periodicity, context),
                                    style: AppTextStyles.normal2.copyWith(
                                      color: AppColors.g50Color,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            Visibility(
              visible: periodicity == 4,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: PrimaryButton(
                  text: S.of(context).continueButton,
                  action: () {
                    ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                      Routes.userMigrationPage,
                      ModalRoute.withName(
                        Routes.introUserMigrationPage,
                      ),
                      arguments: UserMigrationPageArguments(
                        userMigrationInfo: userMigrationInfo,
                        balance: balance,
                        goalQuincenal: goalQuincenal,
                        goalMensual: goalMensual,
                        goalTrimestral: goalTrimestral,
                        mensualDone: mensualDone,
                        pseDone: pseDone,
                        goalPse: goalPse,
                        quincenalDone: quincenalDone,
                        trimestralDone: trimestralDone,
                      ),
                    );
                  },
                  enabled: true,
                ),
              ),
            ),
          ],
        ),
      ),
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

  String getAccountType(UserMigrationItem item) {
    if (item.bankAccountTypeName == "Ahorros") {
      return "Cuenta de ${item.bankAccountTypeName}";
    } else if (item.bankAccountTypeName == "Corriente") {
      return "Cuenta ${item.bankAccountTypeName}";
    } else {
      return "Cuenta Bancaria";
    }
  }

  String getPeriodicity(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).quincenal;
        break;
      case 2:
        return S.of(context).mensual;
        break;
      case 3:
        return S.of(context).trimestral;
      default:
        return "";
    }
  }

  String getAhorro(int periodicity, BuildContext context) {
    switch (periodicity) {
      case 1:
        return S.of(context).myGoalsQuincenalSavings;
        break;
      case 2:
        return S.of(context).myGoalsMonthlySavings;
        break;
      case 3:
        return S.of(context).myGoalsTrimestralSavings;
        break;
      default:
        return "";
    }
  }
}
