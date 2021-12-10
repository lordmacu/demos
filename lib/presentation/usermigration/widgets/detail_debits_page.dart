import 'package:ualet/application/user_migration/user_migration_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/user_migration/balance_item.dart';
import 'package:ualet/domain/user_migration/user_migration_info.dart';
import 'package:ualet/domain/user_migration/user_migration_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';

class DetailDebitsPage extends HookWidget {
  final List<UserMigrationItem> debits;
  final int periodicity;
  final DashboardGoal goalQuincenal;
  final DashboardGoal goalMensual;
  final DashboardGoal goalTrimestral;
  final DashboardGoal goalPse;
  final BalanceItem balance;
  final bool quincenalDone;
  final bool mensualDone;
  final bool trimestralDone;
  final bool pseDone;
  final UserMigrationInfo userMigrationInfo;
  final UserMigrationBloc bloc;

  final formater = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  DetailDebitsPage({
    Key key,
    @required this.bloc,
    @required this.debits,
    @required this.userMigrationInfo,
    @required this.balance,
    this.periodicity = 1,
    @required this.goalQuincenal,
    @required this.goalMensual,
    @required this.goalTrimestral,
    @required this.goalPse,
    this.quincenalDone = false,
    this.mensualDone = false,
    this.trimestralDone = false,
    this.pseDone = false,
  });

  @override
  Widget build(BuildContext context) {
    var debitsChosen = useState(0);
    List groupValues = [];
    for (int i = 0; i < debits.length; i++) {
      var groupValue = useState(0);
      groupValues.add(groupValue);
    }
    return BlocProvider<UserMigrationBloc>(
      create: (context) => getIt<UserMigrationBloc>(),
      child: BlocBuilder<UserMigrationBloc, UserMigrationState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(
                AppDimens.layoutMargin,
              ),
              child: PrimaryButton(
                text: S.of(context).continueButton,
                enabled: debitsChosen.value == debits.length,
                action: () => ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.createGoalMigration,
                  arguments: CreateGoalMigrationArguments(
                    goalMensual: goalMensual,
                    goalQuincenal: goalQuincenal,
                    goalTrimestral: goalTrimestral,
                    goalPse: goalPse,
                    userMigrationInfo: userMigrationInfo,
                    mensualDone: mensualDone,
                    pseDone: pseDone,
                    quincenalDone: quincenalDone,
                    trimestralDone: trimestralDone,
                    debits: KtList.from(debits),
                    periodicity: periodicity,
                    balance: balance,
                    blocc: bloc,
                  ),
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
                        onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerXXs,
                  ),
                  Text(
                    S.of(context).migrationDetailTitle,
                    style: AppTextStyles.subtitle2.copyWith(
                      color: AppColors.g25Color,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutMarginM,
                  ),
                  Text(
                    S.of(context).migrationSubtitle,
                    style: AppTextStyles.normal1.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.g75Color,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerL * 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTitle(periodicity, context),
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.g75Color,
                        ),
                      ),
                      Text(
                        "${debitsChosen.value}/${debits.length}",
                        style: AppTextStyles.subtitle2.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      primary: false,
                      itemCount: debits.length,
                      itemBuilder: (context, index) {
                        UserMigrationItem item = debits[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (groupValues[index].value != item.id) {
                                  groupValues[index].value = item.id;
                                  debitsChosen.value = debitsChosen.value + 1;
                                } else {
                                  groupValues[index].value = 0;
                                  debitsChosen.value = debitsChosen.value - 1;
                                }
                              },
                              splashColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.dialogBorderRadius,
                                  ),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: groupValues[index].value != item.id
                                          ? AppColors.whiteColor
                                          : AppColors.successColor,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: AppDimens.layoutSpacerM,
                                  right: AppDimens.layoutSpacerM,
                                  bottom: AppDimens.layoutSpacerM,
                                  left: AppDimens.layoutSpacerXs,
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColors.successColor,
                                      value: item.id,
                                      groupValue: groupValues[index].value,
                                      toggleable: true,
                                      onChanged: (value) {
                                        if (groupValues[index].value !=
                                            item.id) {
                                          groupValues[index].value = item.id;
                                          debitsChosen.value =
                                              debitsChosen.value + 1;
                                        } else {
                                          groupValues[index].value = 0;
                                          debitsChosen.value =
                                              debitsChosen.value - 1;
                                        }
                                      },
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: item.imgUrl.trim().trimRight(),
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: AppDimens.layoutSpacerS,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          getAccountType(item),
                                          style:
                                              AppTextStyles.caption1.copyWith(
                                            color: AppColors.g50Color,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "${formater.format(item.value)}",
                                          style:
                                              AppTextStyles.caption2.copyWith(
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
                              ),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerM,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

  String getAccountType(UserMigrationItem item) {
    if (item.bankAccountTypeName == "Ahorros") {
      return "Cuenta de ${item.bankAccountTypeName}";
    } else if (item.bankAccountTypeName == "Corriente") {
      return "Cuenta ${item.bankAccountTypeName}";
    } else {
      return "Cuenta Bancaria";
    }
  }
}
