import 'dart:convert';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/investingMX/investingIdVerification/investing_mx_id_verification_bloc.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/identification/i_identification_repository.dart';
import 'package:ualet/domain/investing/user_id_info.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/extensions/shared_preferences_x.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_identidad/tu_identidad.dart';
import 'dart:io' show Platform;
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';

class InvestingIdentityConfirmationPageMX extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingIdentityConfirmationPageMX(
      {Key key,
      this.goal,
      this.bankTransfer = false,
      this.bankTransferValue = 0,
      this.bankAccountItem,
      this.multiple,
      this.goals,
      this.valuesChosen})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      InvestingIdentityConfirmationPageStateMX();
}

class InvestingIdentityConfirmationPageStateMX
    extends State<InvestingIdentityConfirmationPageMX> {
  //Controllers
  TextEditingController _docTypeController = TextEditingController();
  TextEditingController _curpController = TextEditingController();
  TextEditingController _namesController = TextEditingController();
  TextEditingController _firstLastNameController = TextEditingController();
  TextEditingController _secondLastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  dynamic sdkResult;
  dynamic resultDataValidResponse;
  dynamic resultDataValidResponseData;
  Future<UserIdInfo> fUserIdInfo;
  UserIdInfo userIdInfoFull;
  bool buttonActivated;
  bool alreadyCheck;
  bool isSending;
  String error = '';

  @override
  void initState() {
    buttonActivated = false;
    alreadyCheck = false;
    isSending = false;
    super.initState();
  }

  Future<UserIdInfo> sdkTuIdentidad() async {
    UserIdInfo userIdInfoR = UserIdInfo.empty();

    //get id types
    var mapOption = await getIt<IIdentificationRepository>().getIdTypes();
    var isError = false;
    Map<String, String> idTypes = {};
    mapOption.fold((l) => isError = true, (r) => idTypes = r);
    if (isError) return userIdInfoR;

    final result = await TuIdentidad.ine(
        getIt.get(instanceName: "TuIdentidadApiKey"), TuIdentidad.INE);
    if (Platform.isIOS) {
      setState(() {
        alreadyCheck = true;
        sdkResult = result;

        try {
          if (sdkResult is String && sdkResult.contains("code")) {
            var errorMessage = getErrorMsg(jsonDecode(sdkResult)["code"]);
            error = errorMessage;
          } else {
            // getIt<IFirebaseEventLoggerMX>().identityVerificationNext();
            buttonActivated = true;
            bool isIne = false;
            String ine = sdkResult["idMex"];
            String ife = sdkResult["idNumber"];
            if (ine != null && ine != '') {
              isIne = true;
            }
            if ((ine == null || ine == '') && (ife == null || ife == '')) {
              error = "El tipo de documento de identidad aún no está soportado";
              buttonActivated = false;
              return userIdInfoR;
            }

            var idType = isIne ? "16" : "17";
            var numerTypeDocument = isIne ? ine : ife;

            SharedPreferences _prefs = getIt<SharedPreferences>();
            _prefs.ineOrIfeType = idType;
            _prefs.ineOrIfeNumber = numerTypeDocument;

            userIdInfoR = UserIdInfo(
              id: isIne ? sdkResult["idMex"] : sdkResult["idNumber"],
              cityState: sdkResult["addressLine3"].split(',')[0],
              expedDate: DateTime.now().toIso8601String(),
              birthDate: sdkResult["dateOfBirth"],
              curp: sdkResult["curp"],
              docType: "15",
              firstLastname: sdkResult["firstLastName"],
              gender: sdkResult["sex"],
              names: sdkResult["name"],
              secondLastname: sdkResult["secondLastName"],
              mz1: sdkResult["mz1"],
              docTypeForm: idType,
            );
          }
        } catch (e) {
          if (sdkResult.contains("code")) {
            error = "Hubo un error inesperado validando tu documento.";
            setState(() {
              alreadyCheck = true;
            });
          }
        }
      });
    } else {
      setState(() {
        alreadyCheck = true;
        sdkResult = result;
        try {
          if (sdkResult["status"] && sdkResult["response"] != null) {
            resultDataValidResponse = json.decode(sdkResult["response"]);

            // Firebase Parte 1 Fase 1 - 37
            // getIt<IFirebaseEventLoggerMX>().identityVerificationNext();
            if (resultDataValidResponse["data"] != null) {
              buttonActivated = true;
              resultDataValidResponseData = resultDataValidResponse["data"];
              print("RESULT");
              print(resultDataValidResponseData);
              print(json.encode(resultDataValidResponse));
              bool isIne = false;
              String ine = resultDataValidResponseData['idMex'];
              String ife = resultDataValidResponseData['idNumber'];
              if (ine != null && ine != '') {
                isIne = true;
              }
              if ((ine == null || ine == '') && (ife == null || ife == '')) {
                error =
                    "El tipo de documento de identidad aún no está soportado";
                print(error);
                buttonActivated = false;
                return userIdInfoR;
              }

              var idType = isIne ? "16" : "17"; //INE = 16, IFE = 17
              var numerTypeDocument = isIne ? ine : ife;

              SharedPreferences _prefs = getIt<SharedPreferences>();
              _prefs.ineOrIfeType = idType;
              _prefs.ineOrIfeNumber = numerTypeDocument;

              userIdInfoR = UserIdInfo(
                id: isIne
                    ? resultDataValidResponseData['idMex']
                    : resultDataValidResponseData['idNumber'],
                cityState:
                    resultDataValidResponseData['addressLine3'].split(',')[0],
                expedDate: DateTime.now().toIso8601String(),
                birthDate: resultDataValidResponseData["dateOfBirth"],
                curp: resultDataValidResponseData["curp"],
                docType:
                    "15", //Tipo de identificación "CURP" en mx siempre se envia ese tipo
                firstLastname: resultDataValidResponseData["firstLastName"],
                gender: resultDataValidResponseData["sex"],
                names: resultDataValidResponseData["name"],
                secondLastname: resultDataValidResponseData["secondLastName"],
                mz1: resultDataValidResponseData[
                    "mz1"], //INE o IFE (Según corresponda)
                docTypeForm: idType,
              );
            } else {
              String errorCode = json.decode(sdkResult['error'])['code'];
              print("ERROR CODE: $errorCode");
              error = getErrorMsg(errorCode);
            }
          } else {
            String errorCode = json.decode(sdkResult['error'])['code'];
            print("ERROR CODE: $errorCode");
            error = getErrorMsg(errorCode);
          }
        } catch (e) {
          if (sdkResult.contains("code")) {
            error = "Hubo un error inesperado validando tu documento.";
            setState(() {
              alreadyCheck = true;
            });
          }
        }
      });
    }
    return userIdInfoR;
  }

  showError(BuildContext context) {
    if (!buttonActivated) {
      ToastHelper.createError(message: error, duration: Duration(seconds: 5))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestingMxIdVerificationBloc>(
          create: (context) => getIt<InvestingMxIdVerificationBloc>(),
        ),
      ],
      child: BlocBuilder<InvestingMxIdVerificationBloc,
          InvestingMxIdVerificationState>(
        builder: (context, state) {
          return _futureBuilder(context);
        },
      ),
    );
  }

  Widget _futureBuilder(BuildContext context) {
    return FutureBuilder(
      future: fUserIdInfo,
      builder: (context, AsyncSnapshot<UserIdInfo> snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => showError(context));
          return _buildRoot(context, snapshot.data);
        } else if (!alreadyCheck) {
          fUserIdInfo = sdkTuIdentidad();
          return _buildRoot(context, UserIdInfo.empty());
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildRoot(BuildContext context, UserIdInfo userIdInfo) {
    userIdInfoFull = userIdInfo;
    String tipoDoc = userIdInfo.docTypeForm == "16" ? "INE" : "IFE";
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
                primary: true,
                children: <Widget>[
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  //Title
                  _title(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _subTitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  //doc type
                  _normalField(context, _docTypeController, tipoDoc,
                      S.of(context).idDocumentType),
                  //curp
                  _normalField(context, _curpController, userIdInfo.curp,
                      S.of(context).curp),
                  //names
                  _normalField(context, _namesController, userIdInfo.names,
                      S.of(context).names),
                  //lastnames
                  _lastNamesRow(context, userIdInfo),
                  _normalField(context, _dateOfBirthController,
                      userIdInfo.birthDate, S.of(context).birthDateLabel),
                  _normalField(context, _genderController, userIdInfo.gender,
                      S.of(context).genderLabel),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _buttonNext(context, userIdInfo),
                  _repeatButton(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                ],
              ),
            ),
            LoadingInProgressOverlay(isLoading: isSending),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).identityVerificationTitle,
        style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      ),
    );
  }

  Widget _subTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 50),
      child: Text(
        S.of(context).identityVerificationSubTitle,
        style: AppTextStyles.normal4,
      ),
    );
  }

  Widget _normalField(BuildContext context, TextEditingController controller,
      String text, String label) {
    var textField = label;
    controller.text = text;
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          child: CustomTextFormField(
            enabled: false,
            readOnly: true,
            controller: controller,
            // initialValue: "aa",
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hoverColor: AppColors.g25Color,
              fillColor: AppColors.inputColor,
              filled: true,
              hintText: textField,
              prefixStyle: TextStyle(
                  fontFamily: 'open-sans-semi-bold',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: AppColors.g90Color),
              contentPadding: EdgeInsets.only(left: 20),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.g90Color),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'open-sans-regular',
                  color: AppColors.g25Color),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.primarySoftColor,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.g10Color,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
            ),
            onFieldSubmitted: (value) {},
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _lastNamesRow(BuildContext context, userIdInfo) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _normalField(context, _firstLastNameController,
                  userIdInfo.firstLastname, S.of(context).firstLastName)),
          Container(
            width: calcWidth,
            child: _normalField(context, _secondLastNameController,
                userIdInfo.secondLastname, S.of(context).secondLastName),
          ),
        ],
      ),
    );
  }

  Widget _buttonNext(BuildContext context, UserIdInfo user) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.layoutMarginM,
        right: AppDimens.layoutMarginM,
        // bottom: AppDimens.layoutSpacerL,
      ),
      child: PrimaryButton(
        text: S.of(context).confirm,
        action: buttonActivated
            ? () async {
                bool checkLista = false;
                setState(() {
                  isSending = true;
                });
                var res2 = await getIt<IIdentificationRepository>().checkLista(
                    userIdInfoFull.names,
                    userIdInfoFull.firstLastname,
                    userIdInfoFull.secondLastname);

                res2.fold((l) => checkLista = false, (r) => checkLista = r);

                if (checkLista) {
                  bool error = false;

                  //Almacenar el log de la respuesta del sdk de "TuIdentidad"
                  var logTuIdentidad = await getIt<IIdentificationRepository>()
                      .logTuIdentidad1(json.encode(sdkResult));

                  //Actualizar la información del usuario según respuesta del sdk de "TuIdentidad"
                  var res = await getIt<IIdentificationRepository>()
                      .updateIdentificationPost(user);

                  res.fold((l) {
                    error = true;
                    setState(() {
                      isSending = false;
                    });
                    ToastHelper.createError(
                            message: l.map(
                                fromServer: (e) => "Error: ${e.message}",
                                unexpected: (_) => "Error inesperado"))
                        .show(context);
                    return null;
                  }, (r) async {
                    //Estado "CREE"" del usuario, actualiza el nro de cuenta del usuario según la respuesta del back transaccional.
                    var resFindCustomerLevel =
                        await getIt<IProfilingMxRepository>()
                            .getCustomerLevelSimpl();
                    resFindCustomerLevel.fold((l) {
                      error = true;
                      setState(() {
                        isSending = false;
                      });
                      ToastHelper.createError(
                              message: l.map(
                                  fromServer: (e) => "Error: ${e.message}",
                                  unexpected: (_) => "Error inesperado"))
                          .show(context);
                      return null;
                    }, (r) async {
                      // Actualiza el customer lvl del usuario a 1 que es validado, estado CREE.
                      var updateCustomerLvl =
                          await getIt<ICustomerLevelRepoMx>()
                              .updateCustomerLevel(CustomerLevelRepository
                                  .TU_IDENTIDAD_DOCUMENTO);
                      return null;
                    });
                  });

                  if (error) return;

                  if (widget.bankAccountItem != null) {
                    getIt<SharedPreferences>().currentInvestingAccount =
                        widget.bankAccountItem;
                  }
                  getIt<SharedPreferences>().currentInvestingGoal = widget.goal;

                  setState(() {
                    isSending = false;
                  });

                  print("IDENTITY CONFIRMATION:::::${widget.bankAccountItem}");
                  getIt<SharedPreferences>().vidIdFace =
                      "${user.names.split(" ")[0]}_${user.curp}facevoice";
                  getIt<SharedPreferences>().vidIdINEIFE =
                      "${user.names.split(" ")[0]}_${user.curp}ineife";

                  ExtendedNavigator.rootNavigator.pushNamed(
                      Routes.investingVerificationOverviewMx,
                      arguments: InvestingVerificationOverviewMxArguments(
                          bankAccountItem: widget.bankAccountItem,
                          check1: true,
                          check2: false,
                          goal: DashboardGoal.empty(),
                          bankTransfer: widget.bankTransfer,
                          bankTransferValue: widget.bankTransferValue,
                          goals: List<DashboardGoal>.empty(),
                          multiple: false,
                          valuesChosen: widget.valuesChosen));
                } else {
                  showDialog(
                      context: context,
                    builder: (BuildContext context) =>CustomDialog(
                      icon: Icons.check_circle_outline,
                      iconColor: Colors.transparent,
                      buttonAction: () => Navigator.pop(context),
                      buttonText:
                      S.of(context).withdrawalTransactionSummaryButton,
                      title: S.of(context).blackListTextTitle,
                      description: S.of(context).blackListText,
                    )
                );
                }
              }
            : null,
      ),
    );
  }

  Widget _repeatButton(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        var res2 = await getIt<IIdentificationRepository>()
            .logTuIdentidad1(json.encode(sdkResult));
        setState(() {
          fUserIdInfo = sdkTuIdentidad();
        });
      },
      padding: EdgeInsets.zero,
      child: Text(S.of(context).repeatVerification,
          style: AppTextStyles.normalUnder1
              .copyWith(color: AppColors.primaryColor)),
    );
  }

  String getErrorMsg(String error) {
    Map<String, String> msgMap = {
      'INE001': 'Parámetros incorrectos.',
      'INE002': 'Información incorrecta. No se envio la imagen frontal.',
      'INE003': 'Información incorrecta. No se envio la imagen trasera.',
      'INE005': 'El documento no es una credencial para votar como INE o IFE.',
      'INE008': 'Algo anda mal, estamos trabajando para solucionarlo.',
      'INE009': 'Acceso denegado. ApiKey no presente.',
      'INE011': 'Detectamos dos imágenes del mismo lado.',
      'INE012': 'Tipo de imagen frontal: {Type} no soportado.',
      'INE013': 'Tipo de imagen trasera: {Type} no soportado.',
      'INE014': 'Acceso denegado. Encabezado de ApiKey extraviado.',
    };

    if (msgMap.containsKey(error)) {
      return msgMap[error];
    } else {
      return 'Error inesperado';
    }
  }
}
