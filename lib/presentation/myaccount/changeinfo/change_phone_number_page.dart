import 'package:ualet/application/myaccount/account_bloc.dart';
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
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:injectable/injectable.dart';

class ChangePhoneNumber extends HookWidget {
  final String email;
  final String phoneNumber;
  final isColombia = getIt<IEnv>().isColombia();

  ChangePhoneNumber({@required this.email, @required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusPhone = FocusNode();

    final controller = MaskedTextController(mask: '000 000 0000');
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
              LoadingInProgressOverlay(isLoading: true),
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
              child: BlocProvider(
                create: (context) => getIt<AccountBloc>(),
                child: PrimaryButton(
                    text: S.of(context).recoveryPasswordButton,
                    enabled: state.phoneNumberAvailable &&
                        state.phoneNumber.value.fold(
                            (f) => f.maybeMap(
                                invalidPhoneNumber: (_) => false,
                                notValidOperatorMX: (_) => false,
                                orElse: () => true),
                            (r) => true),
                    action: () {
                      context.bloc<ChangeInfoBloc>().add(
                            ChangeInfoEvent.updatePhoneNumber(state
                                .phoneNumber.value
                                .fold((l) => phoneNumber, (r) => r)),
                          );
                    }),
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
                      S.of(context).changePhoneNumberTitle,
                      textAlign: TextAlign.left,
                      style: AppTextStyles.title2
                          .copyWith(color: AppColors.g25Color),
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerL,
                    ),
                    Text(
                      S.of(context).changePhoneNumberDescription,
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
                            "${S.of(context).changePhoneNumberLabel}",
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
                                  "${isColombia ? S.of(context).countryCode : S.of(context).countryCodeMX} $phoneNumber",
                              labelStyle: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.layoutMarginS,
                                  vertical: AppDimens.layoutHSpacerS),
                              counterStyle:
                                  TextStyle(color: Colors.transparent),
                              errorText: state.phoneNumberAvailable
                                  ? null
                                  : S.of(context).phoneNumberAlreadyUsed,
                              errorMaxLines: 3,
                              prefix: Text(
                                isColombia
                                    ? S.of(context).countryCode
                                    : S.of(context).countryCodeMX,
                              ),
                              prefixStyle: AppTextStyles.normal1
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            style: AppTextStyles.normal1
                                .copyWith(fontWeight: FontWeight.w400),
                            maxLength: 50,
                            maxLengthEnforced: true,
                            autocorrect: false,
                            focusNode: _focusPhone,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            controller: controller,
                            onChanged: (value) {
                              context.bloc<ChangeInfoBloc>().add(
                                    ChangeInfoEvent.phoneNumberChanged(
                                        value),
                                  );
                            },
                            validator: (_) => context
                                .bloc<ChangeInfoBloc>()
                                .state
                                .phoneNumber
                                .value
                                .fold(
                                    (f) => f.maybeMap(
                                          invalidPhoneNumber: (_) => S
                                              .of(context)
                                              .changePhoneNumberError,
                                          phoneNumberNotStartsWith3: (_) => S
                                              .of(context)
                                              .phoneNumberIncorrectOperator,
                                          notValidOperatorMX: (_) => S
                                              .of(context)
                                              .phoneNumberIncorrectOperatorMX,
                                          orElse: () => null,
                                        ),
                                    (_) => null),
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
      }, listener: (context, state) {
        if (state.saveUpdatephoneNumber) {
          if (state.sendOtp) {
            String phoneNumber = controller.text.replaceAll(" ", "");
            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.sendOTPPage,
              arguments: SendOTPPageArguments(
                email: email,
                phoneNumber:
                    state.phoneNumber.value.fold((l) => null, (r) => r),
                newNumber: phoneNumber,
                changetype: ChangeType.phoneNumber,
                oldPassword: "",
                newPassword: "",
                confirmPassword: "",
              ),
            );
          }
        }
      }),
    );
  }
}
