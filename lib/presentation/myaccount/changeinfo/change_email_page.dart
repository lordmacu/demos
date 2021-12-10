import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/myaccount/changeinfo/change_info_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_otp_page.dart';
import 'package:ualet/router/router.gr.dart';

class ChangeEmailPage extends HookWidget {
  final String email;
  final String phoneNumber;
  ChangeEmailPage({@required this.email, @required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeInfoBloc>(
      create: (context) =>
          getIt<ChangeInfoBloc>()..add(ChangeInfoEvent.emailChanged(email)),
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
                  text: S.of(context).recoveryPasswordButton,
                  enabled: state.emailAvailable &&
                      state.emailAddress.value.fold(
                          (f) => f.maybeMap(
                                invalidEmail: (_) => false,
                                orElse: () => true,
                              ),
                          (_) => true),
                  action: () {
                    context.bloc<ChangeInfoBloc>().add(
                          ChangeInfoEvent.sendEmail(
                            state.emailAddress.value
                                .fold((l) => null, (r) => r),
                            phoneNumber,
                          ),
                        );
                    ExtendedNavigator.rootNavigator.pushNamed(
                      Routes.sendEmailPage,
                      arguments: SendEmailPageArguments(
                          email: state.emailAddress.value
                              .fold((l) => null, (r) => r),
                          phoneNumber: phoneNumber,
                          changeType: ChangeType.email,
                          oldPassword: "",
                          newPassword: "",
                          confirmPassword: ""),
                    );
                  },
                ),
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
                      S.of(context).changeEmailTitle,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g25Color),
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerL,
                    ),
                    Text(
                      S.of(context).changeEmailDescription,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.normal4.copyWith(
                        fontWeight: FontWeight.w400,
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
                            S.of(context).changeEmailInputLabel,
                            style: AppTextStyles.normal1
                                .copyWith(color: AppColors.g75Color),
                          ),
                          SizedBox(
                            height: AppDimens.layoutSpacerXXs,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: email,
                                labelStyle: AppTextStyles.normal1
                                    .copyWith(fontWeight: FontWeight.w400),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.layoutMarginS,
                                    vertical: AppDimens.layoutHSpacerS),
                                counterStyle:
                                    TextStyle(color: Colors.transparent),
                                errorText: state.emailAvailable
                                    ? null
                                    : S.of(context).emailAlreadyInUse,
                                errorMaxLines: 3,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                            initialValue: email,
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                            maxLength: 50,
                            maxLengthEnforced: true,
                            autocorrect: false,
                            onChanged: (value) =>
                                context.bloc<ChangeInfoBloc>().add(
                                      ChangeInfoEvent.emailChanged(value),
                                    ),
                            validator: (_) => context
                                .bloc<ChangeInfoBloc>()
                                .state
                                .emailAddress
                                .value
                                .fold(
                                    (f) => f.maybeMap(
                                          invalidEmail: (_) => S
                                              .of(context)
                                              .changeEmailErrorLabel,
                                          orElse: () => null,
                                        ),
                                    (_) => null),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            );
          }
        },
      ),
    );
  }
}
