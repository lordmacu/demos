import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';

class InvestingVerificationOverview extends StatelessWidget {
  /// Check de la identidad
  final bool check1;

  /// Check del domicilio
  final bool check2;

  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingVerificationOverview(
      {Key key,
      this.check1,
      this.check2,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.layoutMarginM,
            right: AppDimens.layoutMarginM,
            bottom: AppDimens.layoutSpacerL,
          ),
          child: PrimaryButton(
              text: S.of(context).identityVerificationButton,
              action: () {

                getIt<IFireBaseEventLogger>().verification();

                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.introVerificationForm,
                        arguments: IntroVerificationFormArguments(
                          bankAccountItem: bankAccountItem,
                          bankTransfer: bankTransfer,
                          bankTransferValue: bankTransferValue,
                          goal: goal,
                          goals: goals,
                          multiple: multiple,
                          valuesChosen: valuesChosen,
                        ));
              }),
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppDimens.layoutSpacerX,
                  ),
                  _card1(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _verificacionTitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _verificationSubtitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                ],
              )),
        ));
  }

  //card 1
  Widget _card1(BuildContext context) {
    return Container(
      height: 167,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.dialogBorderRadius))),
              padding: EdgeInsets.all(AppDimens.layoutMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(S.of(context).identityVerificationCardTitle,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.g75Color)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/how_to_reg_24px.png"),
                        height: 80,
                      ),
                      Image(
                        image: AssetImage("assets/images/3lines.png"),
                        height: 27,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          //botonsito de arriba
          Positioned(
            left: 20,
            child: Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.g25Color),
              child: Center(
                child: Text("1",
                    style: AppTextStyles.subtitle2
                        .copyWith(color: AppColors.whiteColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //card 2
  Widget _card2(BuildContext context) {
    return Container(
      height: 167,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.dialogBorderRadius))),
              padding: EdgeInsets.all(AppDimens.layoutMargin),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(S.of(context).domicilioVerification,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.g75Color)),
                    ],
                  ),
                  //iconos
                  SizedBox(
                    height: AppDimens.layoutSpacerS,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/map_24px.png"),
                        height: 73,
                      ),
                      Image(
                        image: AssetImage("assets/images/3lines.png"),
                        height: 27,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          //botonsito de arriba
          Positioned(
            left: 20,
            child: Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.successColor),
              child: Center(
                child: Text("2",
                    style: AppTextStyles.subtitle2
                        .copyWith(color: AppColors.whiteColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verificacionTitle(BuildContext context) {
    return Text(S.of(context).greatInvestment,
        style: AppTextStyles.title2.copyWith(color: AppColors.successColor));
  }

  Widget _verificationSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        S.of(context).verificationDescription,
        style: AppTextStyles.normal4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
    print("INVESTING VERIFICATIONS OVERVIEW COL:::::${bankAccountItem}");
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).nextButton,
        action: () {
          if (!check1 && !check2) _navToIdentitiyConfirmation();
          if (check1 && !check2) _navToDomicilioConfirmation();
          if (check1 && check2) _navToSuccessPage();
        },
      ),
    );
  }

  _navToIdentitiyConfirmation() async {
    //Firebase 35
    // await getIt<IFirebaseEventLogger>()
    //     .logEvent(FBEvents.VERIFICAR_IDENTIDAD, {});
    ExtendedNavigator.rootNavigator
        .pushNamed(Routes.investingIdentityConfirmationPageMX,
            arguments: InvestingIdentityConfirmationPageMXArguments(
              bankAccountItem: bankAccountItem,
              goal: goal,
              bankTransfer: bankTransfer,
              bankTransferValue: bankTransferValue,
              goals: goals,
              multiple: multiple,
              valuesChosen: valuesChosen,
            ));
  }

  _navToDomicilioConfirmation() async {
    //Firebase 39
    // await getIt<IFirebaseEventLogger>()
    //     .logEvent(FBEvents.VERIFICAR_DOMICILIO, {});
    ExtendedNavigator.rootNavigator
        .pushNamed(Routes.investingDomicilioConfirmationPage,
            arguments: InvestingDomicilioConfirmationPageArguments(
              bankAccountItem: bankAccountItem,
              goal: goal,
              bankTransfer: bankTransfer,
              bankTransferValue: bankTransferValue,
              goals: goals,
              multiple: multiple,
              valuesChosen: valuesChosen,
            ));
  }

  _navToSuccessPage() {
    if (bankTransfer) {
      print("TO: BankTransferAlmost");
      print(multiple);
      ExtendedNavigator.rootNavigator.pushNamed(Routes.bankTransferAlmostPage,
          arguments: BankTransferAlmostPageArguments(
            goal: goal,
            bankTransfer: bankTransfer,
            bankTransferValue: bankTransferValue,
            goals: goals,
            multiple: multiple,
            valuesChosen: valuesChosen,
          ));
    } else {
      ExtendedNavigator.rootNavigator.pushNamed(Routes.investingSuccessPageMX,
          arguments: InvestingSuccessPageMXArguments(
              goal: goal,
              bankAccountItem: bankAccountItem,
              goals: goals,
              multiple: multiple,
              valuesChosen: valuesChosen,
              bankTransferValue: bankTransferValue));
    }
  }
}
