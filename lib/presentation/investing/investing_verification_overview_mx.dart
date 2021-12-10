import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
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

class InvestingVerificationOverviewMx extends StatelessWidget {
  // Check de la identidad
  final bool check1;

  // Check del domicilio
  final bool check2;

  // Check Entrevista
  //final bool check3;

  final bool checkForm1;
  final bool checkForm2;
  final bool checkForm3;
  final bool checkForm4;

  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool finishedVerification;

  const InvestingVerificationOverviewMx({
    Key key,
    this.check1 = false,
    this.check2 = false,
    // this.check3 = false,
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.bankAccountItem,
    this.multiple,
    this.goals,
    this.valuesChosen,
    this.checkForm1,
    this.checkForm2,
    this.checkForm3,
    this.checkForm4,
    this.finishedVerification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppDimens.layoutMarginM,
              right: AppDimens.layoutMarginM,
              bottom: AppDimens.layoutSpacerM,
            ),
            child: _buttonNext(context)),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMargin,
                    vertical: AppDimens.layoutMarginXS),
                child: Column(
                  children: <Widget>[
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
                    _card1(context),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    _card2(context),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    // _card3(context),
                    // SizedBox(
                    //   height: AppDimens.layoutSpacerM,
                    // ),
                    //_buttonNext(context)
                  ],
                )),
          ),
        ));
  }

  Widget _card1(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                    BorderRadius.circular(AppDimens.dialogBorderRadius),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      offset: Offset(0, 4),
                      spreadRadius: 0.5,
                      blurRadius: 8.0)
                ],
              ),
              padding: EdgeInsets.all(AppDimens.layoutMargin),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(S.of(context).ineOrIfeVerification,
                          style: AppTextStyles.normal2
                              .copyWith(color: AppColors.g75Color)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(
                          image:
                              AssetImage("assets/images/how_to_reg_24px.png"),
                          height: 60,
                        ),
                        Image(
                          image: AssetImage("assets/images/3lines.png"),
                          height: 27,
                        ),
                      ],
                    ),
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
                shape: BoxShape.circle,
                color: check1 ? AppColors.successColor : AppColors.g25Color,
              ),
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

  Widget _card2(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                    BorderRadius.circular(AppDimens.dialogBorderRadius),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      offset: Offset(0, 4),
                      spreadRadius: 0.5,
                      blurRadius: 8.0)
                ],
              ),
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
                        height: 60,
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
                shape: BoxShape.circle,
                color: check2 ? AppColors.successColor : AppColors.g25Color,
              ),
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

  Widget _card3(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppDimens.dialogBorderRadius),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        offset: Offset(0, 4),
                        spreadRadius: 0.5,
                        blurRadius: 8.0)
                  ],
                ),
                padding: EdgeInsets.all(AppDimens.layoutMargin),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: AppDimens.layoutSpacerS,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(S.of(context).entrevistaVerification,
                            style: AppTextStyles.normal2
                                .copyWith(color: AppColors.g75Color)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              "assets/images/perm_contact_calendar_24px.png"),
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
          ],
        ),
        //botonsito de arriba
        Positioned(
          left: 20,
          child: Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.successColor,
            ),
            child: Center(
              child: Text("3",
                  style: AppTextStyles.subtitle2
                      .copyWith(color: AppColors.whiteColor)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _verificacionTitle(BuildContext context) {
    return Text(S.of(context).verification,
        style: AppTextStyles.title2.copyWith(color: AppColors.successColor));
  }

  Widget _verificationSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        S.of(context).verificationSubTitle,
        style: AppTextStyles.normal4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
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

  _navToEntrevista() async {
    ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.entrevistaPage);
  }

  _navToSuccessPage() {
    if (bankTransfer) {
      ExtendedNavigator.rootNavigator.pushNamed(Routes.bankTransferAlmostPage,
          arguments: BankTransferAlmostPageArguments(
            goal: goal,
            bankTransfer: bankTransfer,
            bankTransferValue: bankTransferValue,
            goals: goals,
            multiple: multiple,
            valuesChosen: valuesChosen,
            finishedVinculation: finishedVerification,
          ));
    } else {
      ExtendedNavigator.rootNavigator.pushNamed(
        Routes.investingChooseAccountMx,
        arguments: InvestingChooseAccountMxArguments(
          bankTransfer: false,
          bankTransferValue: bankTransferValue,
          goal: goal,
          goals: goals,
          multiple: multiple,
          valuesChosen: valuesChosen,
          finishedVinculation: finishedVerification,
        ),
      );
    }
  }
}
