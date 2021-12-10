import 'dart:convert';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/investing/i_investing_repository_mx.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/identification/i_identification_repository.dart';
import 'package:ualet/domain/investing/user_domicilio_info.dart';
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

class InvestingDomicilioConfirmationPage extends StatefulWidget {
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  const InvestingDomicilioConfirmationPage({
    Key key,
    this.goal,
    this.bankTransfer = false,
    this.bankTransferValue = 0,
    this.bankAccountItem,
    this.multiple,
    this.goals,
    this.valuesChosen,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      InvestingDomicilioConfirmationPageState();
}

class InvestingDomicilioConfirmationPageState
    extends State<InvestingDomicilioConfirmationPage> {
  //Controllers
  TextEditingController _calleController = TextEditingController();
  TextEditingController _extController = TextEditingController();
  TextEditingController _numIntController = TextEditingController();
  TextEditingController _coloniaController = TextEditingController();
  TextEditingController _postalController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _municipioController = TextEditingController();
  TextEditingController _estado2Controller = TextEditingController();

  Future<UserDomicilioInfo> fUserDomicilioInfo;
  Map sdkResult;
  Map resultDataValidResponse;
  Map resultDataValidResponseData;

  bool buttonActivated;
  bool isSending;
  bool isPreloadData = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    isSending = false;
    buttonActivated = false;

    fUserDomicilioInfo = sdkTuIdentidad();
    fUserDomicilioInfo.then((resp) {
      isPreloadData = true;
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  showError(BuildContext context) {
    if (!buttonActivated) {
      ToastHelper.createError(message: error, duration: Duration(seconds: 5))
          .show(context);
    }
  }

  Future<UserDomicilioInfo> sdkTuIdentidad() async {
    UserDomicilioInfo userIdInfoR = UserDomicilioInfo.empty();
    final result =
        await TuIdentidad.address(getIt.get(instanceName: "TuIdentidadApiKey"));
    setState(() {
      sdkResult = result;
      print(result);

      if (sdkResult["status"] && sdkResult["response"] != null) {
        resultDataValidResponse = json.decode(sdkResult["response"]);

        if (resultDataValidResponse["data"] != null) {
          buttonActivated = true;
          resultDataValidResponseData = resultDataValidResponse["data"];
          print("RESULT");
          print(resultDataValidResponseData);
          List<String> postalCodeArray =
              resultDataValidResponseData["addressline4"].split("C.P.");

          if (resultDataValidResponseData["addressline3"].contains("C.P.")) {
            postalCodeArray =
                resultDataValidResponseData["addressline3"].split("C.P.");
          }
          userIdInfoR = UserDomicilioInfo(
            calle: resultDataValidResponseData["addressline2"],
            colonia: resultDataValidResponseData["addressline2"],
            estado2: resultDataValidResponseData["addressline4"].split(",")[1],
            estado: resultDataValidResponseData["addressline4"].split(",")[1],
            municipio:
                resultDataValidResponseData["addressline4"].split(",")[0],
            numExt: resultDataValidResponseData["serviceNumber"],
            numInt: resultDataValidResponseData["addressline1"],
            postal: postalCodeArray.last,
          );
        } else {
          String errorCode = json.decode(sdkResult['error'])['code'];
          print("ERROR CODE: $errorCode");
        }
      } else {
        String errorCode = json.decode(sdkResult['error'])['code'];
        print("ERROR CODE: $errorCode");
        error = getErrorMsg(errorCode);
      }
    });
    return userIdInfoR;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isPreloadData,
      child: FutureBuilder(
          future: fUserDomicilioInfo,
          builder: (context, AsyncSnapshot<UserDomicilioInfo> snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => showError(context));
              return _buildRoot(context, snapshot.data);
            } else {
              return Container();
            }
          }),
    );
  }

  Widget _buildRoot(BuildContext context, UserDomicilioInfo userDomicilioInfo) {
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
                  //Subtitle
                  _subTitle(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  //Calle
                  _normalField(context, _calleController,
                      userDomicilioInfo.calle, S.of(context).street),
                  _numsRow(context, userDomicilioInfo),
                  _colPostalRow(context, userDomicilioInfo),
                  _stateMunicipioRow(context, userDomicilioInfo),
                  _normalField(context, _estado2Controller,
                      userDomicilioInfo.estado2, S.of(context).state),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _buttonNext(context),
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
        S.of(context).domicilioVerificationTitle,
        style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      ),
    );
  }

  Widget _subTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 50),
      child: Text(
        S.of(context).domicilioVerificationSubtitle,
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

  Widget _numsRow(BuildContext context, UserDomicilioInfo userDomicilioInfo) {
    double calcWidth = MediaQuery.of(context).size.width * 0.40;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _normalField(context, _extController,
                  userDomicilioInfo.numExt, S.of(context).numExt)),
          Container(
            width: calcWidth,
            child: _normalField(context, _numIntController,
                userDomicilioInfo.numInt, S.of(context).numInt),
          ),
        ],
      ),
    );
  }

  Widget _colPostalRow(
      BuildContext context, UserDomicilioInfo userDomicilioInfo) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _normalField(context, _coloniaController,
                  userDomicilioInfo.colonia, S.of(context).colony)),
          Container(
            width: calcWidth,
            child: _normalField(context, _postalController,
                userDomicilioInfo.postal, S.of(context).postalCode),
          ),
        ],
      ),
    );
  }

  Widget _stateMunicipioRow(
      BuildContext context, UserDomicilioInfo userDomicilioInfo) {
    double calcWidth = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: calcWidth,
              child: _normalField(context, _estadoController,
                  userDomicilioInfo.estado, S.of(context).state)),
          Container(
            width: calcWidth,
            child: _normalField(context, _municipioController,
                userDomicilioInfo.municipio, S.of(context).municipio),
          ),
        ],
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
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
                setState(() {
                  isSending = true;
                });

                var response = await getIt<IIdentificationRepository>()
                    .logTuIdentidad2(json.encode(sdkResult));

                getIt<SharedPreferences>().currentInvestingAccount =
                    widget.bankAccountItem;
                getIt<SharedPreferences>().currentInvestingGoal = widget.goal;

                // Actualiza el customer lvl del usuario a 21 que es listo para entrevista MX.
                // var updateCustomerLvl = await getIt<ICustomerLevelRepoMx>()
                //     .updateCustomerLevel(CustomerLevelRepository.ENTREVISTA);

                // setState(() {
                //   isSending = false;
                // });

                // updateCustomerLvl.fold(
                //     (l) => {},
                //     (r) => {
                //           ExtendedNavigator.rootNavigator.pushNamed(
                //               Routes.investingVerificationOverviewMx,
                //               arguments:
                //                   InvestingVerificationOverviewMxArguments(
                //                       check1: true,
                //                       check2: true,
                //                       finishedVerification: true,
                //                       goal: widget.goal,
                //                       bankTransfer: widget.bankTransfer,
                //                       bankTransferValue:
                //                           widget.bankTransferValue,
                //                       bankAccountItem: widget.bankAccountItem,
                //                       goals: widget.goals,
                //                       multiple: widget.multiple,
                //                       valuesChosen: widget.valuesChosen))
                //         });

                bool error = false;

                //Vinculación del Usuario.
                var responseEnrolment =
                    await getIt<IInvestingRepository>().softEnrollment();

                responseEnrolment.fold((l) {
                  error = true;
                  setState(() {
                    isSending = false;
                  });
                  ToastHelper.createError(
                      message: l.map(
                          fromServer: (e) => "Error: ${e.message}",
                          unexpected: (_) => "Error inesperado")).show(context);
                  return null;
                }, (r) async {
                  //Email de vinculación exitosa.
                  var responseSendEmailt = await getIt<IInvestingRepositoryMx>()
                      .sendEmailVinculation();

                  return null;
                });

                if (error) return;

                var isColombia = getIt<IEnv>().isColombia();
                if (isColombia) {
                  ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.videoSenderIntroPage,
                    arguments: VideoSenderIntroPageArguments(
                      goal: widget.goal,
                      bankTransfer: widget.bankTransfer,
                      bankTransferValue: widget.bankTransferValue,
                      bankAccountItem: widget.bankAccountItem,
                      goals: widget.goals,
                      multiple: widget.multiple,
                      valuesChosen: widget.valuesChosen,
                      idVideoFace: getIt<SharedPreferences>().vidIdFace,
                      idVideoINEIFE: getIt<SharedPreferences>().vidIdINEIFE,
                    ),
                  );
                } else {
                  ExtendedNavigator.rootNavigator.pushReplacementNamed(
                    Routes.investingVerificationOverviewMx,
                    arguments: InvestingVerificationOverviewMxArguments(
                      check1: true,
                      check2: true,
                      goal: widget.goal,
                      bankTransfer: widget.bankTransfer,
                      bankTransferValue: widget.bankTransferValue,
                      bankAccountItem: widget.bankAccountItem,
                      goals: widget.goals,
                      multiple: widget.multiple,
                      valuesChosen: widget.valuesChosen,
                      finishedVerification: true,
                    ),
                  );
                }
              }
            : null,
      ),
    );
  }

  Widget _repeatButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          buttonActivated = false;
          fUserDomicilioInfo = sdkTuIdentidad();
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
      'ADS002': 'No se encontraron coincidencias.',
      'ADS003': 'El formato de archivo no es correcto.',
      'ADS004': 'Información incorrecta.',
      'ADS005': 'El campo que esta vacio es necesario.',
      'ADS006': 'El documento no es válido.',
      'ADS007': 'El tamaño del archivo es mayor que lo esperado.',
      'ADS008': 'Datos inconsistentes.',
      'ADS009': 'La apiKey no es válida.',
      'ADS010': 'La respuesta del servidor falló.',
      'ADS011': 'El tiempo de respuesta esta excedido.',
      'ADS012': 'Error al cargar la imagen.',
    };

    if (msgMap.containsKey(error)) {
      return msgMap[error];
    } else {
      return 'Error inesperado';
    }
  }
}
