import 'package:ualet/domain/customer_level/i_customer_level_repo_col.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/hubs_pot/i_hubs_pot_repo.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/infrastructure/appsflyer/apps_flyer_event_logger.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/presentation/investing/widgets/bank_transfer_dialog.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/investing/investing_page.dart';
import 'package:ualet/presentation/profiling/widgets/popups/confirm_profiling_dialog_widget.dart';
import 'package:ualet/presentation/profiling/widgets/popups/suggest_invest.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/infrastructure/profiling/profiling_mx_repository.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:ualet/to_be_refactor/utils/extensions/build_context_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfilingSuccessPage extends HookWidget {
  final ProfilingResult result;

  const ProfilingSuccessPage({Key key, @required this.result});

  static final String cdn = '${EnvironmentConfig.cdnUrl}/profiling/';

  @override
  Widget build(BuildContext context) {
    var isEnabled = useState(true);
    String descChanged =
        result.description.replaceAll("\\n", "\n").replaceAll("\r", "");
    print(descChanged);
    return WillPopScope(
      child: Scaffold(
          bottomNavigationBar: SectionBottomSheet(
            textButton: S.of(context).acceptAndContinueButton,
            // textUnderline: S.of(context).reviewProfilingResultButton,
            textInf: '',
            isEnabled: isEnabled.value,
            action: () => _showPopupConfirm(context, isEnabled),
            redirectUnderline: () {
              //Firebase 15
              return ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                  Routes.profilingPage, (route) => false);
            },
            isValidRedirect: false,
            isValidResendButton: false,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.layoutMargin * 1.5),
            children: <Widget>[
              SizedBox(height: context.screenHeight(dividedBy: 8)),
              Text(
                S.of(context).profilingResultTitleLabel,
                textAlign: TextAlign.center,
                style: AppTextStyles.title2
                    .copyWith(color: AppColors.successColor),
              ),
              const SizedBox(height: AppDimens.layoutSpacerM),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(AppDimens.layoutMargin),
                child: Column(
                  children: <Widget>[
                    Text(
                      result.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.normal2
                          .copyWith(color: AppColors.g75Color),
                    ),
                    const SizedBox(height: AppDimens.layoutSpacerM),
                    Image(
                      image: NetworkImage("$cdn${result.image}"),
                      height: AppDimens.emojiSizeL.height,
                    ),
                    const SizedBox(height: AppDimens.layoutSpacerS),
                    Text(
                      result.subtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.normal2
                          .copyWith(color: AppColors.g50Color),
                    ),
                    const SizedBox(height: AppDimens.layoutSpacerM),
                    Text(
                      descChanged,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.normal1
                          .copyWith(color: AppColors.g75Color),
                    ),
                  ],
                ),
              ),
            ],
          )),
      onWillPop: () {},
    );
  }

  _showWelcomeBottomSheet(
      ValueNotifier<bool> isEnabled, BuildContext context) async {
    isEnabled.value = false;
    ParamsMxRepository repo = getIt<IProfilingMxRepository>();
    var postResult = await repo.postAssignProfile(result);
    postResult.fold((l) {
      print("error assignProfile");
      ToastHelper.createError(message: "Error asignando el perfil");
      return;
    }, (r) {});
    //CustomerLevel Perfilamiento
    var updateCustomerLvl = await getIt<ICustomerLevelRepoMx>()
        .updateCustomerLevel(CustomerLevelRepository.PERFILAMIENTO_MX);

    getIt<IFireBaseEventLogger>().profileConfirm({
      "Tipo-Perfil": result.title,
    });

    //Appsflyer 14
    getIt<IAppsFlyerEventLogger>().logEvent(
        AFEvents.PERFIL_REGISTRADO, {"tipo-perfil": result.title.toString()});

    //Envio HubsPot
    var repoHubsPot = getIt<IHubsPotRepo>();
    var responseHubsPot = await repoHubsPot.sendData(false);
    responseHubsPot.fold(
        (l) => {
              ToastHelper.createError(
                  message: l.maybeMap(
                      fromServer: (value) => value.message,
                      orElse: () => "")).show(context)
            }, (r) async {
      //Update customer level - profile MX
      updateCustomerLvl.fold((l) {
        print("Error updateCustomerLevel");
        ToastHelper.createError(message: "Error asignando el perfil");
      }, (r) {});
      //Update customer level assign profile
      updateCustomerLvl =
          await getIt<ICustomerLevelRepoCol>().setAfterPerfilamiento();
      updateCustomerLvl = await getIt<ICustomerLevelRepoCol>().setAfterMeta();

      updateCustomerLvl.fold((l) {
        print("Error updateCustomerLevel");
        ToastHelper.createError(message: "Error asignando el perfil");
      }, (r) {
        var isColombia = getIt<IEnv>().isColombia();
        if (isColombia) {
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.investingIntroPage,
            arguments: InvestingIntroPageArguments(
                fromRegister: true, valueFromRegister: 250000.0),
          );
        } else {
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.investingIntroPage,
            arguments: InvestingIntroPageArguments(
              fromRegister: true,
              valueFromRegister: 100.00,
            ),
          );

        }
      });
    });
  }

  _showPopupConfirm(context, ValueNotifier<bool> isEnabled) {
    getIt<IFireBaseEventLogger>().profileDiscovered();

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: ConfirmProfilingDialog(
            title: S.of(context).popUpConfirmProfileTitle,
            bodyDialog: S.of(context).popUpConfirmProfileBody,
            buttonAcceptText: S.of(context).popUpConfirmProfileButtonSuccess,
            buttonRejectText: S.of(context).popUpConfirmProfileButtonReject,
            reject: () async {
              await getIt<IFireBaseEventLogger>().profileUpdatePopUp();

              await getIt<IAppsFlyerEventLogger>()
                  .logEvent(AFEvents.PERFIL_REGISTRADO, {});

              return ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
                  Routes.profilingPage, (route) => false);
            },
            accept: () {
              ExtendedNavigator.rootNavigator.pop();
              _showPopUpInvest(isEnabled, context);
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.25)).animate(anim1),
          child: child,
        );
      },
    );
  }

  _showPopUpInvest(ValueNotifier<bool> isEnabled, context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: "Label",
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (ctx, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SuggestInvestDialog(
            continueCallBack: () {
              ExtendedNavigator.rootNavigator.pop();
              _showWelcomeBottomSheet(isEnabled, context);
            },
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
