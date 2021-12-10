import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/goals/i_goals_repository.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/goal_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

NumberFormat formatCurrency = new NumberFormat.currency(
    customPattern: "\u00A4#,##0.00\u00A0",
    symbol: "\$",
    decimalDigits: 0,
    locale: "es");

NumberFormat formatCurrencyCol = new NumberFormat.currency(
    customPattern: "\u00A4#,##0.00\u00A0",
    symbol: "\$",
    decimalDigits: 0,
    locale: "es");

NumberFormat formatCurrencyMx =
    new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

double porcentaje = 0;

class ResumeGoalPage extends StatelessWidget {
  final GoalItem goalItem;
  final bool isFirstGoal;
  final bool isMigration;

  const ResumeGoalPage(
      {Key key,
      @required this.goalItem,
      @required this.isFirstGoal,
      this.isMigration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print(goalItem.totalValue);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            child: Column(
              children: <Widget>[
                _drawGoal(context, goalItem),
                _informationGoal(goalItem),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      _buttonInvest(
                          S.of(context).endProcess, context, goalItem),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _enviar(BuildContext context, GoalItem obj, bool invest) async {
    SharedPreferences _prefs = getIt<SharedPreferences>();
    _prefs.isMigrating = false;

    if (invest) {
      var response = await getIt<IGoalsRepository>().getGoals();
      var newGoal = response[0];

      if (isFirstGoal && !isMigration) {
        var updateCustomerLvl = await getIt<ICustomerLevelRepoMx>()
            .updateCustomerLevel(CustomerLevelRepository.HOME);
      }

      DashboardGoal investGoal = new DashboardGoal(
          migrate: false,
          created: obj.createdDate,
          name: obj.goalName,
          goalAmt: obj.totalValue,
          currentAmt: 0,
          emoji: obj.emoji,
          tieneDomiciliacionprogramada: false,
          fee: obj.feeValue,
          periodicity: obj.periodicity,
          numMonths: obj.numMonths,
          id: obj.id);
      ExtendedNavigator.rootNavigator.pushNamed(Routes.investToGoal,
          arguments: InvestingGoalPageArguments(
              leftSelected: true,
              goal: newGoal,
              goals: [],
              multiple: false,
              values: [],
              periodicity: investGoal.periodicity));
    } else {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
    }
  }

  Widget _drawGoal(BuildContext context, GoalItem obj) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  offset: Offset(0, 4),
                  spreadRadius: 0.5,
                  blurRadius: 8.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.dialogBorderRadius),
            ),
            color: AppColors.whiteColor),
        child: Column(
          children: <Widget>[
            _headerGoal(context, obj),
            SizedBox(height: 10.0),
            Divider(),
            _balanceGoal(),
          ],
        ));
  }

  Widget _headerGoal(context, GoalItem obj) {
    var parser = EmojiParser();
    var _media = MediaQuery.of(context).size;
    return Container(
      width: _media.width * 1.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              parser.emojify(parser.info(obj.emoji).full),
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            width: _media.width * 0.5,
            child: Text(
              "${obj.goalName}",
              style: TextStyle(
                  color: AppColors.g50Color,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0,
                  fontFamily: 'open-sans-semi-bold'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceGoal() {
    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;
    String totalValue = formatCurrency.format(goalItem.totalValue);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircularPercentIndicator(
            radius: 90.0,
            lineWidth: 9.0,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            percent: 0.0,
            center: Text(
              "${porcentaje.round()}%",
              style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontFamily: 'open-sans-semi-bold'),
            ),
            progressColor: AppColors.primaryColor,
            backgroundColor: AppColors.backgroundColor,
          ),
          SizedBox(
            width: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Saldo",
                    style: TextStyle(
                        color: AppColors.g75Color,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'open-sans-semi-bold',
                        fontSize: 12.0),
                  ),
                  Text(
                    "\$ 0",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'open-sans-semi-bold',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Meta",
                    style: TextStyle(
                        color: AppColors.g75Color,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'open-sans-semi-bold',
                        fontSize: 12.0),
                  ),
                  Text(
                    "$totalValue",
                    style: TextStyle(
                        color: AppColors.g50Color,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'open-sans-semi-bold'),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _informationGoal(GoalItem obj) {
    formatCurrency =
        getIt<IEnv>().isColombia() ? formatCurrencyCol : formatCurrencyMx;
    String feeValue = formatCurrency.format(goalItem.feeValue);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                offset: Offset(0, 4),
                spreadRadius: 0.5,
                blurRadius: 8.0),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.dialogBorderRadius),
          ),
          color: AppColors.whiteColor),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Inversión",
                style: TextStyle(
                    color: AppColors.g75Color,
                    fontFamily: 'open-sans-semi-bold',
                    fontSize: 14.0),
              ),
              Text(
                "\$0",
                style: TextStyle(
                    color: AppColors.g75Color,
                    fontFamily: 'open-sans-semi-bold',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Ahorro mensual",
                style: TextStyle(
                    color: AppColors.g75Color,
                    fontFamily: 'open-sans-semi-bold',
                    fontSize: 14.0),
              ),
              Text(
                "$feeValue",
                style: TextStyle(
                    color: AppColors.g75Color,
                    fontFamily: 'open-sans-semi-bold',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transcurrido",
                    style: TextStyle(
                        color: AppColors.g75Color,
                        fontFamily: 'open-sans-semi-bold',
                        fontSize: 14.0),
                  ),
                  Text(
                    "Tiempo",
                    style: TextStyle(
                        color: AppColors.g50Color,
                        fontFamily: 'open-sans-semi-bold',
                        fontSize: 12.0),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "0 meses",
                    style: TextStyle(
                        color: AppColors.g75Color,
                        fontFamily: 'open-sans-semi-bold',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                  ),
                  Text(
                    "${obj.numMonths.toString()} meses",
                    style: TextStyle(
                        color: AppColors.g50Color,
                        fontFamily: 'open-sans-semi-bold',
                        fontSize: 12.0),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buttonInvest(String nameButton, BuildContext context, GoalItem obj) {
    return Container(
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
        child: RaisedButton(
            child: Container(
              height: 20,
              child: Text(nameButton,
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 14.0)),
              alignment: Alignment.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 0.0,
            color: AppColors.primaryColor,
            disabledColor: AppColors.bgButtonDisabled,
            textColor: AppColors.whiteColor,
            onPressed: () {
              //AppsFlyer 20
              getIt<IAppsFlyerEventLogger>()
                  .logEvent(AFEvents.META_NO_INVERTIR, {});
              _enviar(context, obj, false);
            }));
  }

  Widget _buttonNoInvest(
      String nameButton, BuildContext context, GoalItem obj) {
    return RaisedButton(
        child: Container(
          width: 287,
          height: 43,
          child: Text(nameButton,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 14.0)),
          alignment: Alignment.center,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(30.0)),
        elevation: 0.0,
        color: Colors.transparent,
        disabledColor: AppColors.bgButtonDisabled,
        textColor: AppColors.primaryColor,
        onPressed: () {
          //AppsFlyer 20
          getIt<IAppsFlyerEventLogger>()
              .logEvent(AFEvents.META_NO_INVERTIR, {});
          _enviar(context, obj, false);
        });
  }
}
