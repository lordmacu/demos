import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/myaccount/changeinfo/change_info_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';

import '../../../injection.dart';
import 'widgets/send_otp_page.dart';

class ChangePasswordPage extends HookWidget {
  final String email;
  final String phoneNumber;

  ChangePasswordPage({@required this.email, @required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    var canSeePassword = useState(false);
    var canSeeNewPassword = useState(false);
    var canSeePasswordConfirm = useState(false);
    return BlocProvider<ChangeInfoBloc>(
      create: (context) => getIt<ChangeInfoBloc>(),
      child: BlocBuilder<ChangeInfoBloc, ChangeInfoState>(
        builder: (context, state) {
          if (state.isSubmitting) {
            return Stack(
              children: <Widget>[
                Container(
                  color: AppColors.backgroundColor,
                ),
                LoadingInProgressOverlay(isLoading: true)
              ],
            );
          } else {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: PrimaryButton(
                    text: S.of(context).continueButton,
                    enabled: state.arePasswordsSame &&
                        state.password.value.fold(
                            (f) => f.maybeMap(
                                invalidPassword: (_) => false,
                                orElse: () => true),
                            (r) => true) &&
                        state.newPassword.value.fold(
                            (f) => f.maybeMap(
                                invalidPassword: (_) => false,
                                orElse: () => true),
                            (r) => true) &&
                        state.newPasswordConfirm.value.fold(
                            (f) => f.maybeMap(
                                invalidPassword: (_) => false,
                                orElse: () => true),
                            (r) => true),
                    action: () {
                      context
                          .bloc<ChangeInfoBloc>()
                          .add(ChangeInfoEvent.sendOTP(phoneNumber));
                      ExtendedNavigator.rootNavigator.pushReplacementNamed(
                        Routes.sendOTPPage,
                        arguments: SendOTPPageArguments(
                          email: email,
                          phoneNumber: phoneNumber,
                          changetype: ChangeType.password,
                          oldPassword:
                              state.password.value.fold((l) => "", (r) => r),
                          newPassword:
                              state.newPassword.value.fold((l) => "", (r) => r),
                          confirmPassword: state.newPasswordConfirm.value
                              .fold((l) => "", (r) => r),
                        ),
                      );
                    }),
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
                      Text(
                        S.of(context).changePasswordTitle,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.title2
                            .copyWith(color: AppColors.g25Color),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerL,
                      ),
                      RichText(
                        text: TextSpan(
                          text: S.of(context).changePasswordDescription,
                          children: [
                            TextSpan(
                                style: AppTextStyles.normal4.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoColor),
                                text: S
                                    .of(context)
                                    .changePasswordDescriptionTrailing)
                          ],
                          style: AppTextStyles.normal4.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.layoutSpacerM,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              S.of(context).changePasswordLabelOld,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerXXs,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText:
                                    S.of(context).myAccountPasswordObfuscated,
                                labelStyle: AppTextStyles.normal1
                                    .copyWith(fontWeight: FontWeight.w400),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.layoutMarginS,
                                    vertical: AppDimens.layoutHSpacerS),
                                counterStyle:
                                    TextStyle(color: Colors.transparent),
                                errorMaxLines: 3,
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  icon: canSeePassword.value
                                      ? Icon(
                                          Icons.visibility,
                                          color: AppColors.primaryColor,
                                        )
                                      : Icon(Icons.visibility_off,
                                          color: AppColors.primaryColor),
                                  onPressed: () {
                                    canSeePassword.value =
                                        !canSeePassword.value;
                                  },
                                ),
                              ),
                              style: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                              maxLength: 50,
                              maxLengthEnforced: true,
                              autocorrect: false,
                              obscureText: !canSeePassword.value,
                              onChanged: (value) =>
                                  context.bloc<ChangeInfoBloc>().add(
                                        ChangeInfoEvent.passwordChanged(value),
                                      ),
                              validator: (_) => context
                                  .bloc<ChangeInfoBloc>()
                                  .state
                                  .password
                                  .value
                                  .fold(
                                      (f) => f.maybeMap(
                                          invalidPassword: (input) {
                                            if (input.failedValue.length != 0) {
                                              return S
                                                  .of(context)
                                                  .changePasswordErrorLabel;
                                            } else {
                                              return null;
                                            }
                                          },
                                          orElse: () => null),
                                      (_) => null),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerHeader,
                            ),
                            Text(
                              S.of(context).changePasswordLabelNew,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerXXs,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: "",
                                  labelStyle: AppTextStyles.normal1
                                      .copyWith(fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.layoutMarginS,
                                      vertical: AppDimens.layoutHSpacerS),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  errorText: state.arePasswordsSame
                                      ? null
                                      : S.of(context).changePasswordErrorSame,
                                  errorMaxLines: 3,
                                  suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: canSeeNewPassword.value
                                          ? Icon(
                                              Icons.visibility,
                                              color: AppColors.primaryColor,
                                            )
                                          : Icon(Icons.visibility_off,
                                              color: AppColors.primaryColor),
                                      onPressed: () {
                                        canSeeNewPassword.value =
                                            !canSeeNewPassword.value;
                                      })),
                              style: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                              maxLength: 50,
                              maxLengthEnforced: true,
                              autocorrect: false,
                              obscureText: !canSeeNewPassword.value,
                              onChanged: (value) => context
                                  .bloc<ChangeInfoBloc>()
                                  .add(
                                    ChangeInfoEvent.newPasswordChanged(value),
                                  ),
                              validator: (_) => context
                                  .bloc<ChangeInfoBloc>()
                                  .state
                                  .newPassword
                                  .value
                                  .fold(
                                      (f) => f.maybeMap(
                                          invalidPassword: (input) {
                                            if (input.failedValue.length != 0) {
                                              return S
                                                  .of(context)
                                                  .changePasswordErrorLabel;
                                            } else {
                                              return null;
                                            }
                                          },
                                          orElse: () => null),
                                      (r) => null),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerHeader,
                            ),
                            Text(
                              S.of(context).changePasswordLabelConfirm,
                              style: AppTextStyles.normal1
                                  .copyWith(color: AppColors.g75Color),
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerXXs,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: "",
                                  labelStyle: AppTextStyles.normal1
                                      .copyWith(fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.layoutMarginS,
                                      vertical: AppDimens.layoutHSpacerS),
                                  counterStyle:
                                      TextStyle(color: Colors.transparent),
                                  errorText: state.arePasswordsSame
                                      ? null
                                      : S.of(context).changePasswordErrorSame,
                                  errorMaxLines: 3,
                                  suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: canSeePasswordConfirm.value
                                          ? Icon(
                                              Icons.visibility,
                                              color: AppColors.primaryColor,
                                            )
                                          : Icon(Icons.visibility_off,
                                              color: AppColors.primaryColor),
                                      onPressed: () {
                                        canSeePasswordConfirm.value =
                                            !canSeePasswordConfirm.value;
                                      })),
                              style: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                              maxLength: 50,
                              maxLengthEnforced: true,
                              autocorrect: false,
                              obscureText: !canSeePasswordConfirm.value,
                              onChanged: (value) => context
                                  .bloc<ChangeInfoBloc>()
                                  .add(
                                    ChangeInfoEvent.newPasswordConfirmChanged(
                                        value),
                                  ),
                              validator: (_) => context
                                  .bloc<ChangeInfoBloc>()
                                  .state
                                  .newPasswordConfirm
                                  .value
                                  .fold(
                                      (f) => f.maybeMap(
                                          invalidPassword: (input) {
                                            if (input.failedValue.length != 0) {
                                              return S
                                                  .of(context)
                                                  .changePasswordErrorLabel;
                                            } else {
                                              return null;
                                            }
                                          },
                                          orElse: () => null),
                                      (r) => null),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
