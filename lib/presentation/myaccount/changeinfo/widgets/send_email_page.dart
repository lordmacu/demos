import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/myaccount/changeinfo/change_info_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/myaccount/changeinfo/widgets/send_otp_page.dart';
import 'package:ualet/router/router.gr.dart';

class SendEmailPage extends HookWidget {
  final String email;
  final String phoneNumber;
  final ChangeType changeType;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  SendEmailPage({
    @required this.email,
    @required this.phoneNumber,
    @required this.changeType,
    @required this.oldPassword,
    @required this.newPassword,
    @required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    var resendVisible = useState(false);
    String obfuscatedEmail = "${email[0]}*****@${email.split("@")[1]}";
    Future.delayed(Duration(seconds: 10), () {
      resendVisible.value = true;
    });
    return BlocProvider<ChangeInfoBloc>(
      create: (context) => getIt<ChangeInfoBloc>(),
      child: BlocConsumer<ChangeInfoBloc, ChangeInfoState>(
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
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.layoutMarginM,
                  right: AppDimens.layoutMarginM,
                  bottom: AppDimens.layoutSpacerL,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PrimaryButton(
                        text: S.of(context).emailConfirmButton,
                        action: () => context
                            .bloc<ChangeInfoBloc>()
                            .add(ChangeInfoEvent.checkEmailConfirmed(email)),
                      ),
                      Visibility(
                        visible: resendVisible.value,
                        maintainInteractivity: false,
                        maintainSize: false,
                        maintainState: true,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: AppDimens.layoutSpacerM),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () => context.bloc<ChangeInfoBloc>().add(
                                ChangeInfoEvent.sendEmail(email, phoneNumber)),
                            child: Text(
                              S.of(context).alreadyHaveAnResendEmailButton,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.normal1.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                        left: AppDimens.layoutMarginM,
                        right: AppDimens.layoutMarginM,
                        top: AppDimens.layoutSpacerX * 1.5,
                      ),
                      children: <Widget>[
                        Image.asset(
                          AppImages.emailIconSuccess,
                          height: 90,
                          width: 90,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).titleConfirmEmail,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.title2
                              .copyWith(color: AppColors.successColor),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          "${S.of(context).descriptionConfirmEmail} $obfuscatedEmail",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          top: AppDimens.layoutMargin),
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: AppColors.primaryColor,
                      alignment: Alignment.topLeft,
                      tooltip: "Volver",
                      onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          state.emailConfirmedOption.fold(() {}, (either) {
            either.fold(
              (f) {
                showDialog(
                  context: context,
                    builder: (BuildContext context)=>CustomDialog(
                      buttonText: S.of(context).createPasswordButton,
                      icon: Icons.highlight_off,
                      iconColor: AppColors.bgToastInvalid2,
                      title: S.of(context).modalEmailNotConfirmedTitle,
                      description:
                      S.of(context).modalEmailNotConfirmedDescription,
                      buttonAction: () => ExtendedNavigator.rootNavigator.pop(),
                    )
                   ,
                );
              },
              (r) {
                context
                    .bloc<ChangeInfoBloc>()
                    .add(ChangeInfoEvent.sendOTP(phoneNumber));
                context.bloc<ChangeInfoBloc>().close();
                ExtendedNavigator.rootNavigator.popAndPushNamed(
                  Routes.sendOTPPage,
                  arguments: SendOTPPageArguments(
                      email: email,
                      phoneNumber: phoneNumber,
                      changetype: changeType,
                      oldPassword: oldPassword,
                      newPassword: newPassword,
                      confirmPassword: confirmPassword),
                );
              },
            );
          });
        },
      ),
    );
  }
}
