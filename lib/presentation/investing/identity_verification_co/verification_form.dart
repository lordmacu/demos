import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/domain/user_verification/user_info_registraduria.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/CustomSimpleAutoCompleteTextField/autocomplete_textfield.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_datetime_picker.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_autocomplete.dart';
import 'package:ualet/presentation/core/widgets/select/custom_dropdown_menu.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'widgets/custom_date_picker.dart';

class VerificationForm extends HookWidget {
  final UserInfoRegistraduria info;
  final List<String> countries;

  final DashboardGoal goal;
  final bool bankTransfer;
  final double investment;
  final BankAccountItem bankAccountItem;
  String countryChangedText = "";
  String expeditionRegionChangedText = "";
  String birthRegionChangedText = "";
  final bool redirectHome;

  VerificationForm({
    Key key,
    @required this.info,
    @required this.countries,
    this.goal,
    this.bankTransfer = false,
    this.investment = 0,
    this.bankAccountItem,
    this.redirectHome,
  }) : super(key: key);

  var key1 = GlobalKey<AutoCompleteTextFieldState<String>>();
  var key2 = GlobalKey<AutoCompleteTextFieldState<String>>();
  var key3 = GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    var dateError = useState("");
    var controllerPais = useTextEditingController();
    var controllerNacimiento = useTextEditingController();
    var controllerExpedicion = useTextEditingController();
    final FocusNode _focusDocumentNumber = FocusNode();
    var submitting = useState(false);

    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            displayDoneButton: true,
            focusNode: _focusDocumentNumber,
          ),
        ],
      );
    }

    return BlocProvider(
      create: (context) => getIt<UserVerificationBloc>()
        ..add(UserVerificationEvent.fillFields(info, countries))
        ..add(UserVerificationEvent.countryChanged("Colombia")),
      child: BlocConsumer<UserVerificationBloc, UserVerificationState>(
        builder: (context, state) {
          if (state.isSubmitting || submitting.value) {
            return Stack(
              children: <Widget>[
                Container(
                  color: AppColors.backgroundColor,
                ),
                LoadingInProgressOverlay(isLoading: true)
              ],
            );
          } else {
            var dateControllerBirth = TextEditingController();
            var dateControllerExpedition = TextEditingController();
            controllerPais.text = state.countryText;
            controllerExpedicion.text = state.expeditionRegionText;
            controllerNacimiento.text = state.regionText;
            bool firstMod = state.userInfo.firstName == '';
            String usrName =
                firstMod ? info.firstName : state.userInfo.firstName;
            return WillPopScope(
                child: Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: SafeArea(
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.only(
                          left: AppDimens.layoutMargin,
                          right: AppDimens.layoutMargin,
                          top: AppDimens.layoutSpacerXs,
                          bottom: AppDimens.layoutSpacerXs),
                      children: [
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: AppColors.primaryColor,
                          alignment: Alignment.topLeft,
                          tooltip: "Volver",
                          onPressed: () =>
                              ExtendedNavigator.rootNavigator.pop(),
                        ),
                        Text(
                          S.of(context).identityVerificationTitle,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.title2.copyWith(
                            color: AppColors.g25Color,
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Text(
                          S.of(context).identityVerificationDescription,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.normal1.copyWith(
                            color: AppColors.g75Color,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Doc Type
                            CustomDropdownMenu(
                              itemsList: state.idTypes,
                              selectedIndex: info.idType,
                              onChanged: (value) {
                                context.bloc<UserVerificationBloc>().add(
                                      UserVerificationEvent.documentTypeChanged(
                                          value),
                                    );
                              },
                              label: S.of(context).idDocumentType,
                            ),
                            SizedBox(
                              height: AppDimens.layoutSpacerS,
                            ),
                            //Doc Number
                            CustomTextFormField(
                              decoration: InputDecoration(
                                hintText: S.of(context).documentNumber,
                                hintStyle: AppTextStyles.normal1
                                    .copyWith(color: AppColors.g25Color),
                                counterStyle:
                                    TextStyle(color: Colors.transparent),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.layoutMarginS,
                                    vertical: AppDimens.layoutHSpacerS),
                              ),
                              maxLength: 20,
                              enabled: false,
                              maxLengthEnforced: true,
                              focusNode: _focusDocumentNumber,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false, signed: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              initialValue: info.id,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  //First Name
                                  child: CustomTextFormField(
                                    decoration: InputDecoration(
                                      hintText: S.of(context).firstName,
                                      hintStyle: AppTextStyles.normal1
                                          .copyWith(color: AppColors.g25Color),
                                      counterStyle:
                                          TextStyle(color: Colors.transparent),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: AppDimens.layoutMarginS,
                                          vertical: AppDimens.layoutHSpacerS),
                                    ),
                                    maxLength: 60,
                                    maxLengthEnforced: true,
                                    initialValue: usrName,
                                    inputFormatters: [
                                      new FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z ñÑ]"))
                                    ],
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) => context
                                        .bloc<UserVerificationBloc>()
                                        .add(
                                          UserVerificationEvent
                                              .firstNameChanged(value),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimens.layoutSpacerS,
                                ),
                                Flexible(
                                  child: CustomTextFormField(
                                    decoration: InputDecoration(
                                      hintText: S.of(context).secondName,
                                      hintStyle: AppTextStyles.normal1
                                          .copyWith(color: AppColors.g25Color),
                                      counterStyle:
                                          TextStyle(color: Colors.transparent),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: AppDimens.layoutMarginS,
                                          vertical: AppDimens.layoutHSpacerS),
                                    ),
                                    maxLength: 60,
                                    maxLengthEnforced: true,
                                    initialValue: info.secondName,
                                    inputFormatters: [
                                      new FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z ñÑ]"))
                                    ],
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) => context
                                        .bloc<UserVerificationBloc>()
                                        .add(
                                          UserVerificationEvent
                                              .secondNameChanged(value),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextFormField(
                                    decoration: InputDecoration(
                                      hintText: S.of(context).firstLastName,
                                      hintStyle: AppTextStyles.normal1
                                          .copyWith(color: AppColors.g25Color),
                                      counterStyle:
                                          TextStyle(color: Colors.transparent),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: AppDimens.layoutMarginS,
                                          vertical: AppDimens.layoutHSpacerS),
                                    ),
                                    maxLength: 60,
                                    maxLengthEnforced: true,
                                    initialValue: info.surname,
                                    inputFormatters: [
                                      new FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z ñÑ]"))
                                    ],
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) => context
                                        .bloc<UserVerificationBloc>()
                                        .add(
                                          UserVerificationEvent
                                              .firstSurnameChanged(value),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimens.layoutSpacerS,
                                ),
                                Flexible(
                                  child: CustomTextFormField(
                                    decoration: InputDecoration(
                                      hintText: S.of(context).secondLastName,
                                      hintStyle: AppTextStyles.normal1
                                          .copyWith(color: AppColors.g25Color),
                                      counterStyle:
                                          TextStyle(color: Colors.transparent),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: AppDimens.layoutMarginS,
                                          vertical: AppDimens.layoutHSpacerS),
                                    ),
                                    maxLength: 60,
                                    maxLengthEnforced: true,
                                    initialValue: info.secondSurname,
                                    inputFormatters: [
                                      new FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z ñÑ]"))
                                    ],
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) => context
                                        .bloc<UserVerificationBloc>()
                                        .add(
                                          UserVerificationEvent
                                              .secondSurnameChanged(value),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomDatePicker(
                          dateController: dateControllerBirth,
                          initialDate: info.birthDate,
                          initialValue: S.of(context).birthDateLabel,
                          firstDate: DateTime(DateTime.now().year - 118),
                          lastDate: DateTime(DateTime.now().year - 18),
                          onChanged: (date) => context
                              .bloc<UserVerificationBloc>()
                              .add(
                                  UserVerificationEvent.birthDateChanged(date)),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerS,
                        ),
                        CustomTextFormField(
                          decoration: InputDecoration(
                            hintText: S.of(context).birthCountry,
                            hintStyle: AppTextStyles.normal1
                                .copyWith(color: AppColors.g25Color),
                            counterStyle: TextStyle(color: Colors.transparent),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppDimens.layoutMarginS,
                                vertical: AppDimens.layoutHSpacerS),
                          ),
                          maxLength: 60,
                          maxLengthEnforced: true,
                          // enabled: false,
                          readOnly: true,
                          initialValue: "Colombia",
                          inputFormatters: [
                            new FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z]"))
                          ],
                          textCapitalization: TextCapitalization.characters,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerS,
                        ),
                        CustomDropdownAutocomplete(
                          controller: controllerNacimiento,
                          sonKey: key2,
                          suggestions: state.regions,
                          selectedIndex: state.userInfo.regionId,
                          textSend: state.regionText,
                          clearOnSubmit: false,
                          textSubmitted: (value) {
                            context.bloc<UserVerificationBloc>().add(
                                  UserVerificationEvent.birthRegionChanged(
                                      value),
                                );
                          },
                          label: S.of(context).cityBirth,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerS,
                        ),
                        CustomDropdownMenu(
                          itemsList: state.genderId,
                          selectedIndex: state.userInfo.genderId ?? 0,
                          onChanged: (value) {
                            context.bloc<UserVerificationBloc>().add(
                                  UserVerificationEvent.genderChanged(value),
                                );
                          },
                          label: S.of(context).genderLabel,
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerS,
                        ),
                        CustomDatePicker(
                          dateController: dateControllerExpedition,
                          initialDate: info.expeditionDate,
                          initialValue: S.of(context).expeditionDateLabel,
                          lastDate: DateTime.now(),
                          onChanged: (date) {
                            if (date.isBefore(state.userInfo.birthDate
                                .add(Duration(days: 365 * 18)))) {
                              dateError.value = S.of(context).expDateError;
                            } else {
                              dateError.value = '';
                            }
                            context.bloc<UserVerificationBloc>().add(
                                UserVerificationEvent.expeditionDateChanged(
                                    date));
                          },
                        ),
                        dateError.value == ''
                            ? Container()
                            : Text(dateError.value,
                                style: AppTextStyles.caption2
                                    .copyWith(color: AppColors.dangerColor)),
                        CustomDropdownAutocomplete(
                          controller: controllerExpedicion,
                          sonKey: key3,
                          suggestions: state.regions,
                          clearOnSubmit: false,
                          textSend: state.expeditionRegionText,
                          selectedIndex: state.userInfo.expeditionRegionId,
                          textSubmitted: (value) {
                            context.bloc<UserVerificationBloc>().add(
                                UserVerificationEvent.expeditionRegionChanged(
                                    value));
                          },
                          label: S.of(context).expeditionPlace,
                        ),
                        SizedBox(
                          height: AppDimens.layoutMargin,
                        ),
                        _footer(context, state, dateError)
                      ],
                    ),
                  ),
                ),
                onWillPop: () {});
          }
        },
        listener: (context, state) {
          // infoState.value = state.userInfo;

          if (state.userInfo.expeditionDate.isBefore(
              state.userInfo.birthDate.add(Duration(days: 365 * 18)))) {
            dateError.value = S.of(context).expDateError;
          } else {
            dateError.value = '';
          }
          state.updateOption.fold(() {}, (either) {
            either.fold((l) {
              ToastHelper.createError(
                  message: l.map(
                      unexpected: (s) => "Server error",
                      fromServer: (s) => s.message)).show(context);
            }, (r) async {
              bool error = false;
              submitting.value = true;
              var getResult =
                  await getIt<IProfilingMxRepository>().getCustomerLevelSimpl();
              getResult.fold((l) {
                print("Error customerLevel");
                ToastHelper.createError(
                        message: l.map(
                            unexpected: (e) => "Error inesperado",
                            fromServer: (e) => "Error: ${e.message}"))
                    .show(context);
              }, (r) async {
                var response = await getIt<ICustomerLevelRepoCol>()
                    .verifyNextRedirection(investment);

                response.fold((l) {
                  ToastHelper.createError(
                          message: l.map(
                              unexpected: (e) => "Error inesperado",
                              fromServer: (e) => "Error: ${e.message}"))
                      .show(context);
                }, (r) {
                  submitting.value = false;
                  switch (r.customerLevel) {
                    case CustomerLevelRepositoryCol.MOSTRAR_SARLAFT:
                      //Firebase 29
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>  Align(
                            alignment: Alignment.center,
                            child: CustomDialog(
                              buttonText: S.of(context).continueButton,
                              buttonAction: () {
                                getIt<IFireBaseEventLogger>()
                                    .investmentMovementsTop();
                                ExtendedNavigator.rootNavigator
                                    .pushReplacementNamed(
                                        Routes.investingGrandesMontos,
                                        arguments:
                                            InvestingGrandesMontosMasterArguments(
                                          cargarDocumentos: false,
                                          goal: goal,
                                          isDebito: !bankTransfer,
                                          investment: investment,
                                        ));
                              },
                              // description: S.of(context).sarlaftPopupSubtitle,
                              description: r.message,
                              // title: S.of(context).sarlaftPopupTitle,
                              title: r.title,
                              icon: Icons.add_to_home_screen,
                              iconColor: AppColors.successColor,
                            ),
                          ));
                      break;
                    case CustomerLevelRepositoryCol.CARGUE_DOCUMENTOS:
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                        builder: (BuildContext context) =>  Align(
                            alignment: Alignment.center,
                            child: CustomDialog(
                              description: r.message,
                              title: r.title,
                              buttonText: S.of(context).continueButton,
                              buttonAction: () {
                                getIt<IFireBaseEventLogger>()
                                    .investmentMovementsTop();
                                ExtendedNavigator.rootNavigator
                                    .pushReplacementNamed(
                                        Routes.investingGrandesMontos,
                                        arguments:
                                            InvestingGrandesMontosMasterArguments(
                                          cargarDocumentos: true,
                                          goal: goal,
                                          isDebito: !bankTransfer,
                                          investment: investment,
                                        ));
                              },
                              // description: S.of(context).sarlaftPopupSubtitle,
                              // title: S.of(context).sarlaftPopupTitle,
                              icon: Icons.add_to_home_screen,
                              iconColor: AppColors.successColor,
                            ),
                          ));
                      break;
                    case CustomerLevelRepositoryCol.MOSTRAR_EVIDENTE:
                      ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.introEvidenteVerification,
                        arguments: IntroEvidenteVerificationArguments(
                          goal: goal,
                          bankTransfer: bankTransfer,
                          investment: investment,
                        ),
                      );
                      break;
                    default:
                      ExtendedNavigator.rootNavigator.pushNamed(
                        Routes.introEvidenteVerification,
                        arguments: IntroEvidenteVerificationArguments(
                          goal: goal,
                          bankTransfer: bankTransfer,
                          investment: investment,
                        ),
                      );
                  }
                });
              });

              // print("Navigating to Investing OVerviewPAge");
              // ExtendedNavigator.rootNavigator
              //     .pushNamed(Routes.investingOverviewPage,
              //         arguments: InvestingOverviewPageArguments(
              //           bankAccountItem: bankAccountItem,
              //           bankTransfer: bankTransfer,
              //           goal: goal,
              //           investment: bankTransferValue,
              //           goals: goals,
              //           multiple: multiple,
              //           valuesChosen: valuesChosen,
              //         ));
            });
          });
        },
      ),
    );
  }

  Padding _footer(BuildContext context, UserVerificationState state,
      ValueNotifier<String> dateError) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
          text: S.of(context).confirm,
          enabled: state.buttonVerificationActive && dateError.value == '',
          action: () {
            getIt<IFireBaseEventLogger>().verificationDataIdentification();
            context.bloc<UserVerificationBloc>().add(
                  UserVerificationEvent.updateId(
                    state.userInfo,
                  ),
                );
          }),
    );
  }
}
