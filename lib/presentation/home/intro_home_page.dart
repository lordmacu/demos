import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';

class IntroHomePage extends StatelessWidget {
  final bool isInvestment;
  final DashboardGoal goal;

  const IntroHomePage({Key key, this.isInvestment, this.goal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            if (isInvestment) {
              ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.investToGoalMx,
                      arguments: InvestingGoalPageMxArguments(
                        leftSelected: true,
                        goal: goal,
                        goals: [],
                        multiple: false,
                        values: [],
                        periodicity: goal.periodicity,
                        fromRegister: true,
                      ));
            } else {
              ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.homePage);
            }
          },
          child: Container(
            padding: EdgeInsets.all(AppDimens.layoutMarginM),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //TITLE
                Expanded(child: Column(
                  children: [
                    Text(
                      S.of(context).homeIntroTitle,
                      style: AppTextStyles.title3.copyWith(
                        color: AppColors.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    //FIRST SUB TITLE
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: AppTextStyles.normal4
                              .copyWith(color: AppColors.whiteColor),
                          text: S.of(context).homeIntroSubtitle1,
                          children: [
                            TextSpan(
                                style: AppTextStyles.normalUnder1
                                    .copyWith(color: AppColors.primaryColor),
                                text: "")
                          ]),
                    ),
                    SizedBox(height: AppDimens.layoutSpacerM),

                  ],
                )),
                //IMAGE
                Expanded(child: Image.asset(
                  "assets/images/home_intro.png",

                ),flex: 3,),
                Expanded(child: Column(
                  children: [
                    SizedBox(height: AppDimens.layoutSpacerM),
                    //SECOND SUBTITLE
                    Text(
                      S.of(context).homeIntroSubtitle2,
                      style: AppTextStyles.normal4
                          .copyWith(color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    //TAP TO NEXT
                    Text(
                      S.of(context).homeIntroBottom,
                      style: AppTextStyles.subtitle3
                          .copyWith(color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
