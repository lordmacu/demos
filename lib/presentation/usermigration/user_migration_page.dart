import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/investing/widgets/investing_selector_tabbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';

class UserMigrationPage extends HookWidget {
  final UserMigrationInfo userMigrationInfo;
  final BalanceItem balance;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;

  UserMigrationPage({
    @required this.userMigrationInfo,
    @required this.balance,
    @required this.goalQuincenal,
    @required this.goalMensual,
    @required this.goalTrimestral,
    @required this.goalPse,
    this.quincenalDone = false,
    this.mensualDone = false,
    this.trimestralDone = false,
    this.pseDone = false,
  });

  final formater = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  @override
  Widget build(BuildContext context) {
    var leftSelected = pseDone ? useState(true) : useState(false);
    var saveMensualDone = useState(false);
    var saveQuincenalDone = useState(false);
    var saveTrimestraDone = useState(false);
    var savePseDone = useState(false);
    return BlocProvider<UserMigrationBloc>(
      create: (context) => getIt<UserMigrationBloc>()
        ..add(UserMigrationEvent.loadData(userMigrationInfo)),
      child: BlocListener<UserMigrationBloc, UserMigrationState>(
        listener: (context, state) {
          state.fOrSuccess.fold(() => null, (a) {
            a.fold(
                (l) => ToastHelper.createError(
                    message: l.map(
                        unexpected: (a) => "Error inesperado",
                        fromServer: (a) => a.message)).show(context), (r) {
              SharedPreferences _prefs = getIt<SharedPreferences>();
              _prefs.isMigrating = false;
              return ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.finishedSummaryPage,
                arguments: FinishedSummaryPageArguments(
                    goalQuincenal: goalQuincenal,
                    goalMensual: goalMensual,
                    goalTrimestral: goalTrimestral,
                    goalPse: goalPse),
              );
            });
          });
          if (!state.isPosted) {
            //guardar metas en el bloc cuando acaben.
            if (mensualDone && quincenalDone && trimestralDone && pseDone) {
              if (goalMensual != null &&
                  goalMensual.fee != 0 &&
                  !saveMensualDone.value) {
                saveMensualDone.value = true;
                context
                    .bloc<UserMigrationBloc>()
                    .add(UserMigrationEvent.saveGoal(goalMensual, false));
              } else {
                saveMensualDone.value = true;
              }

              if (goalTrimestral != null &&
                  goalTrimestral.fee != 0 &&
                  !saveTrimestraDone.value) {
                saveTrimestraDone.value = true;
                context
                    .bloc<UserMigrationBloc>()
                    .add(UserMigrationEvent.saveGoal(goalTrimestral, false));
              } else {
                saveTrimestraDone.value = true;
              }

              if (goalQuincenal != null &&
                  goalQuincenal.fee != 0 &&
                  !saveQuincenalDone.value) {
                saveQuincenalDone.value = true;
                context
                    .bloc<UserMigrationBloc>()
                    .add(UserMigrationEvent.saveGoal(goalQuincenal, false));
              } else {
                saveQuincenalDone.value = true;
              }

              if (goalPse != null && goalPse.fee != 0 && !savePseDone.value) {
                savePseDone.value = true;
                context
                    .bloc<UserMigrationBloc>()
                    .add(UserMigrationEvent.saveGoal(goalPse, true));
              } else {
                savePseDone.value = true;
              }

              //IF DONE
              if (context.bloc<UserMigrationBloc>().nextActivated() &&
                  !state.isLoading &&
                  saveMensualDone.value &&
                  saveQuincenalDone.value &&
                  saveTrimestraDone.value &&
                  savePseDone.value) {
                context
                    .bloc<UserMigrationBloc>()
                    .add(UserMigrationEvent.postGoals());
              }
            }
          }
        },
        child: BlocBuilder<UserMigrationBloc, UserMigrationState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Stack(
                children: <Widget>[
                  Container(
                    color: AppColors.backgroundColor,
                  ),
                  LoadingInProgressOverlay(isLoading: true),
                ],
              );
            } else {
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
                      SizedBox(
                        height: AppDimens.layoutMargin,
                      ),
                      Text(
                        S.of(context).migrationDescriptionChoose,
                        style: AppTextStyles.normal1.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.g75Color),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      InvestingTabBar(
                        onClickLeft:
                            !quincenalDone || !mensualDone || !trimestralDone
                                ? () {
                                    leftSelected.value = true;
                                  }
                                : () {},
                        onClickRight: !pseDone
                            ? () {
                                leftSelected.value = false;
                              }
                            : () {},
                        leftActivated: leftSelected.value,
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerL,
                      ),
                      leftSelected.value
                          ? _buildDebit(context, state)
                          : _buildPSE(context, state),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  _buildDebit(BuildContext context, UserMigrationState state) {
    return Container(
      height: 200,
      child: ListView(
        primary: false,
        children: [
          !quincenalDone
              ? ListTile(
                  onTap: () {
                    ExtendedNavigator.rootNavigator.pushNamed(
                      Routes.detailDebitsPage,
                      arguments: DetailDebitsPageArguments(
                        bloc: context.bloc<UserMigrationBloc>(),
                        mensualDone: mensualDone,
                        quincenalDone: quincenalDone,
                        trimestralDone: trimestralDone,
                        pseDone: pseDone,
                        goalMensual: goalMensual,
                        goalQuincenal: goalQuincenal,
                        goalTrimestral: goalTrimestral,
                        goalPse: goalPse,
                        userMigrationInfo: userMigrationInfo,
                        debits: state.quincenales.asList(),
                        periodicity: 1,
                        balance: balance,
                      ),
                    );
                  },
                  title: Text(
                    S.of(context).quincenalDebits,
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.g75Color,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    size: 24,
                    color: AppColors.primaryColor,
                  ),
                )
              : Container(),
          !mensualDone
              ? ListTile(
                  onTap: () {
                    ExtendedNavigator.rootNavigator.pushNamed(
                      Routes.detailDebitsPage,
                      arguments: DetailDebitsPageArguments(
                        bloc: context.bloc<UserMigrationBloc>(),
                        debits: state.mensuales.asList(),
                        mensualDone: mensualDone,
                        quincenalDone: quincenalDone,
                        trimestralDone: trimestralDone,
                        goalPse: goalPse,
                        pseDone: pseDone,
                        goalMensual: goalMensual,
                        goalQuincenal: goalQuincenal,
                        goalTrimestral: goalTrimestral,
                        userMigrationInfo: userMigrationInfo,
                        periodicity: 2,
                        balance: balance,
                      ),
                    );
                  },
                  title: Text(
                    S.of(context).monthlyDebits,
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.g75Color,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    size: 24,
                    color: AppColors.primaryColor,
                  ),
                )
              : Container(),
          !trimestralDone
              ? ListTile(
                  onTap: () {
                    ExtendedNavigator.rootNavigator.pushNamed(
                      Routes.detailDebitsPage,
                      arguments: DetailDebitsPageArguments(
                          bloc: context.bloc<UserMigrationBloc>(),
                          debits: state.trimestrales.asList(),
                          mensualDone: mensualDone,
                          quincenalDone: quincenalDone,
                          trimestralDone: trimestralDone,
                          pseDone: pseDone,
                          goalPse: goalPse,
                          goalMensual: goalMensual,
                          goalQuincenal: goalQuincenal,
                          goalTrimestral: goalTrimestral,
                          userMigrationInfo: userMigrationInfo,
                          periodicity: 3,
                          balance: balance),
                    );
                  },
                  title: Text(
                    S.of(context).trimestralDebits,
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.g75Color,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    size: 24,
                    color: AppColors.primaryColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  _buildPSE(BuildContext context, UserMigrationState state) {
    var _media = MediaQuery.of(context).size;
    return Container(
      height: 600,
      child: ListView(
        primary: false,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: _media.width * 1.0,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: Text(
                        "${S.of(context).youAre}\n${balance.profileName}",
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).yourBalance,
                            style: AppTextStyles.normal2.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            "${formater.format(balance.balance)}",
                            style: AppTextStyles.title2.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: _media.width * 1.0,
                child: Container(
                  width: 170.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                      image: NetworkImage(
                          "https://cdn.banlinea.com/banlinea-products/UALET/V2.0/home/img-balance.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.layoutSpacerL,
          ),
          Text(
            S.of(context).yourGoals,
            style: AppTextStyles.subtitle2.copyWith(
              color: AppColors.g75Color,
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          GestureDetector(
            onTap: () {
              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.createGoalMigration,
                arguments: CreateGoalMigrationArguments(
                  mensualDone: mensualDone,
                  quincenalDone: quincenalDone,
                  trimestralDone: trimestralDone,
                  pseDone: pseDone,
                  goalMensual: goalMensual,
                  goalQuincenal: goalQuincenal,
                  goalTrimestral: goalTrimestral,
                  goalPse: goalPse,
                  userMigrationInfo: userMigrationInfo,
                  periodicity: 4,
                  balance: balance,
                  blocc: context.bloc<UserMigrationBloc>(),
                  debits: KtList.empty(),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DottedBorder(
                  dashPattern: [8],
                  strokeWidth: 2.0,
                  radius: Radius.circular(20.0),
                  borderType: BorderType.RRect,
                  color: AppColors.primaryColor.withOpacity(0.5),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      width: 158.0,
                      height: 202.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add_circle_outline,
                              size: 24.0,
                              color: AppColors.primaryColor.withOpacity(0.5)),
                          Text(
                            S.of(context).createNewGoal,
                            style: AppTextStyles.normal2.copyWith(
                              color: AppColors.g10Color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
