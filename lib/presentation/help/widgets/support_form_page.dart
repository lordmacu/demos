import 'dart:io';

import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_file_chooser.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/support/support_form_bloc.dart';
import 'package:ualet/domain/support/support_message.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';

class HelpSupportFormPage extends HookWidget {
  String topic;
  HelpSupportFormPage({this.topic});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SupportFormBloc>(
            create: (context) => getIt<SupportFormBloc>(),
          )
        ],
        child: MultiBlocListener(listeners: [
          BlocListener<SupportFormBloc, SupportFormState>(
            listener: (context, state) {
              state.postFailureorSuccessOption.fold(
                  () {},
                  (either) => either.fold(
                      (failure) => ToastHelper.createError(
                              message: failure.map(
                                  unexpected: (_) => 'Unexpected',
                                  fromServer: (failure) => failure.message))
                          .show(context),
                      (message) => ExtendedNavigator.rootNavigator
                          .pushReplacementNamed(Routes.supportSuccessPage)));
            },
          ),
        ], child: SupportBody(topic: this.topic)));
  }
}

class SupportBody extends HookWidget {
  final controller = useTextEditingController(text: "");
  final fileController = useTextEditingController();
  String topic;

  SupportBody({this.topic});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportFormBloc, SupportFormState>(
      builder: (context, state) {
        controller.addListener(() {
          SupportMessage newMessage =
              state.message.copyWith(message: controller.text, typology: topic);
          context
              .bloc<SupportFormBloc>()
              .add(SupportFormEvent.supportMessageChanged(newMessage));
        });
        if (state.isSubmitting) {
          return Stack(
            children: <Widget>[
              Container(
                color: AppColors.backgroundColor,
              ),
              LoadingInProgressOverlay(isLoading: true)
            ],
          );
        }
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
                enabled: state.message.message.isNotEmpty,
                action: () {
                  context
                      .bloc<SupportFormBloc>()
                      .add(SupportFormEvent.isSubmitting(true));

                  context
                      .bloc<SupportFormBloc>()
                      .add(SupportFormEvent.postSupportMessage());
                }),
          ),
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              ListView(
                primary: false,
                padding: EdgeInsets.only(
                    left: AppDimens.layoutMargin,
                    right: AppDimens.layoutMargin,
                    top: AppDimens.layoutSpacerXs,
                    bottom: AppDimens.layoutSpacerXs),
                children: <Widget>[
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
                    onPressed: () => ExtendedNavigator.rootNavigator.pop(),
                  ),
                  _supportHeader(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerL,
                  ),
                  _supportDescription(context),
                  SizedBox(
                    height: AppDimens.layoutSpacerM,
                  ),
                  _supportForm(context, state, this.topic),
                ],
              ),
            ],
          )),
        );
      },
    );
  }

  Widget _supportHeader(context) {
    return Text(
      S.of(context).helpSupport,
      textAlign: TextAlign.left,
      style: AppTextStyles.title2.copyWith(
        color: AppColors.g25Color,
      ),
    );
  }

  Widget _supportDescription(context) {
    return Text(
      S.of(context).supportDescription,
      textAlign: TextAlign.left,
      style: AppTextStyles.normal4.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _customFilePicker(
      BuildContext context,
      TextEditingController controller,
      String label,
      Function(File) onChanged) {
    return CustomFileChooser(
      extensions: ['pdf', 'png', 'jpg', 'jpeg'],
      fileController: controller,
      initialValue: label,
      onChanged: onChanged,
    );
  }

  Widget _supportForm(BuildContext context, state, topic) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "${this.topic}:",
              style: AppTextStyles.normal4.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerXXs,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: S.of(context).supportTextFieldHint,
                hintStyle:
                    AppTextStyles.normal1.copyWith(color: AppColors.g25Color),
                counterStyle: TextStyle(
                    color: state.message.message.length > 280
                        ? Colors.red
                        : Colors.transparent),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMarginS,
                    vertical: AppDimens.layoutHSpacerS)),
            autocorrect: true,
            keyboardType: TextInputType.text,
            maxLength: 300,
            maxLengthEnforced: true,
            maxLines: 11,
            style: AppTextStyles.normal1.copyWith(
                color: AppColors.g75Color, fontWeight: FontWeight.w400),
            controller: controller,
          ),
          SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          _customFilePicker(
            context,
            fileController,
            S.of(context).attachedFile,
            (file) {
              if (file != null && file.path != '') {
                print("FILEEEE added");
                context
                    .bloc<SupportFormBloc>()
                    .add(SupportFormEvent.fileChanged(file));
              } else {
                print("FILEEEE deleted");
                print(file);
                context
                    .bloc<SupportFormBloc>()
                    .add(SupportFormEvent.fileDeleted());
              }
            },
          ),
        ],
      ),
    );
  }
}
