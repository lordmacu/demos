import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/injection.dart';

class ConfirmationEvidentePage extends HookWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final bool isFirstInvestment;
  final formatCurrency = new NumberFormat.currency(
      customPattern: "\u00A4#,##0.00\u00A0",
      symbol: "\$",
      decimalDigits: 0,
      locale: "es");

  ConfirmationEvidentePage(
      {@required this.goal,
      @required this.bankTransfer,
      @required this.investment,
      this.isFirstInvestment = false});

  @override
  Widget build(BuildContext context) {
    double total = (investment + (bankTransfer ? 1600 : 950));

    return WillPopScope(
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppDimens.layoutMarginM,
              right: AppDimens.layoutMarginM,
              bottom: AppDimens.layoutSpacerL,
            ),
            child: PrimaryButton(
              text: S.of(context).inscribeAccount,
              action: () async {
                await getIt<IAppsFlyerEventLogger>()
                    .logEvent(AFEvents.COMPLETE_REGISTRATION, {});

                ExtendedNavigator.rootNavigator.pushReplacementNamed(
                  Routes.investingAddAccountPage,
                  arguments: InvestingAddAccountPageArguments(
                    bankTransfer: bankTransfer,
                    goal: goal,
                    investment: investment,
                  ),
                );
              },
              enabled: true,
            ),
          ),
          body: SafeArea(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImages.checkIconSuccess,
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.layoutMarginS,
                    ),
                    child: Text(
                      S.of(context).bankTransferAlmostTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.title2.copyWith(
                        color: AppColors.successColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.layoutMarginM,
                    ),
                    child: Text(
                      S.of(context).bankTransferAlmostDescription,
                      style: AppTextStyles.normal1.copyWith(
                        color: AppColors.g75Color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                S.of(context).yourInvestment,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${formatCurrency.format(investment)}",
                                style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                S.of(context).bankFee,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                bankTransfer ? "\$1.600 " : "\$950 ",
                                style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                S.of(context).withdrawTotal,
                                style: AppTextStyles.normal1.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${formatCurrency.format(total)}",
                                style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      onWillPop: () {},
    );
  }
}
