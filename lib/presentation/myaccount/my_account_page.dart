import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/myaccount/account_bloc.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';

import '../../injection.dart';

class MyAccountPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AccountBloc>()..add(AccountEvent.getUserInfo()),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Stack(
                    children: <Widget>[
                      Container(
                        color: AppColors.backgroundColor,
                      ),
                      LoadingInProgressOverlay(isLoading: true)
                    ],
                  ),
              loadSuccess: (state) {
                print("aqui estamos con el info del user ${state.info}");
                UserInfo info = state.info;
                return _accountBody(context, info);
              },
              loadFailure: (state) => Container());
        },
      ),
    );
  }

  Widget _accountBody(context, UserInfo info) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.layoutMarginM,
          right: AppDimens.layoutMarginM,
          bottom: AppDimens.layoutSpacerL,
        ),
        child: SecondaryButton(
            text: S.of(context).myAccountButton,
            action: () => ExtendedNavigator.rootNavigator
                .pushNamed(Routes.supportAccountPage)),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            primary: false,
            padding: EdgeInsets.only(
                left: AppDimens.layoutMargin,
                right: AppDimens.layoutMargin,
                top: AppDimens.layoutSpacerXs,
                bottom: AppDimens.layoutSpacerXs),
            children: <Widget>[
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                color: AppColors.primaryColor,
                alignment: Alignment.topLeft,
                tooltip: "Volver",
                onPressed: () => ExtendedNavigator.rootNavigator.pop(),
              ),
              _accountHeader(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              _accountDescription(context),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              _financialSection(context, info),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _nameSection(context, info),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _emailSection(context, info),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _hyperLinkButton(
                S.of(context).changeEmail,
                () => ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.changeEmailPage,
                  arguments: ChangeEmailPageArguments(
                      email: info.email, phoneNumber: info.phoneNumber),
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _phoneNumberSection(context, info),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _hyperLinkButton(
                S.of(context).changePhoneNumber,
                () => ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.changePhoneNumber,
                  arguments: ChangePhoneNumberArguments(
                      email: info.email, phoneNumber: info.phoneNumber),
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _passwordSection(context),
              SizedBox(
                height: AppDimens.layoutSpacerHeader,
              ),
              _hyperLinkButton(
                S.of(context).changePassword,
                () => ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.changePasswordPage,
                  arguments: ChangePasswordPageArguments(
                      email: info.email, phoneNumber: info.phoneNumber),
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountHeader(context) {
    return Text(
      S.of(context).myAccount,
      textAlign: TextAlign.left,
      style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
    );
  }

  Widget _accountDescription(context) {
    return Text(
      S.of(context).myAccountDescription,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal4.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _financialSection(context, UserInfo info) {
    if (!getIt<IEnv>().isColombia()) {
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.beneficiariesPage,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              S.of(context).myAccountBeneficiariesButton,
              textAlign: TextAlign.left,
              style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: AppDimens.layoutSpacerS,
              color: AppColors.g50Color,
            ),
          ],
        ),
      );
    }
    return info.hasSarlaft
        ? InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              ExtendedNavigator.rootNavigator.pushNamed(
                  Routes.investingGrandesMontos,
                  arguments: InvestingGrandesMontosMasterArguments(
                      cargarDocumentos: false,
                      isUpdate: true,
                      investment: info.balance,
                      sarlaftItem: info.sarlaftItem));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  S.of(context).myAccountFinancialInfo,
                  textAlign: TextAlign.left,
                  style:
                      AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppDimens.layoutSpacerS,
                  color: AppColors.g50Color,
                ),
              ],
            ),
          )
        : Container();
  }

  Widget _nameSection(context, info) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            S.of(context).myAccountName,
            style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: info.firstName,
                hintStyle:
                    AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMarginS,
                    vertical: AppDimens.layoutHSpacerS)),
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _emailSection(context, info) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            S.of(context).myAccountEmail,
            style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: info.email,
                hintStyle:
                    AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMarginS,
                    vertical: AppDimens.layoutHSpacerS)),
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _phoneNumberSection(context, info) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            S.of(context).myAccountPhoneNumber,
            style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: info.phoneNumber,
                hintStyle:
                    AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMarginS,
                    vertical: AppDimens.layoutHSpacerS)),
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _passwordSection(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            S.of(context).myAccountPassword,
            style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: S.of(context).myAccountPasswordObfuscated,
                hintStyle:
                    AppTextStyles.normal1.copyWith(fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMarginS,
                    vertical: AppDimens.layoutHSpacerS)),
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _hyperLinkButton(text, ontap) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: ontap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.normal1.copyWith(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
