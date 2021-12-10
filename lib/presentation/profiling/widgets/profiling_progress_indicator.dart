import 'dart:math';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ualet/to_be_refactor/utils/extensions/build_context_x.dart';

class ProfilingProgressIndicatorWidget extends StatelessWidget {
  final int size;
  final ScrollController scrollController;
  const ProfilingProgressIndicatorWidget(
    this.size, {
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilingFormBloc, ProfilingFormState>(
      builder: (context, state) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: AppColors.backgroundColor,
          padding: const EdgeInsets.only(
              bottom: AppDimens.layoutMargin * 2,
              left: AppDimens.layoutMargin,
              right: AppDimens.layoutMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                  child: Container(
                    height: AppDimens.buttonSecundary.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutMarginButtonS,
                      ),
                      child: SecondaryButton(
                          text: S.of(context).nextButton,
                          action: () {

                            getIt<IFireBaseEventLogger>().profileQuestion(state.index + 1);

                            scrollController.animateTo(0,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.decelerate);
                            context
                                .bloc<ProfilingFormBloc>()
                                .add(ProfilingFormEvent.nextQuestion(size));
                          }),
                    ),
                  ),
                  visible: state.correctResponsesLength > state.index),
              const SizedBox(height: AppDimens.layoutSpacerM),
              Text(
                S.of(context).profilingProgressIndicatorLabel(
                    min(state.index + 1, state.correctResponsesLength), size),
                style:
                    AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
              ),
              const SizedBox(height: AppDimens.layoutSpacerXs),
              LinearPercentIndicator(
                width: context.screenWidth() - AppDimens.layoutMargin * 2,
                lineHeight: 13.0,
                percent:
                    min(state.index + 1, state.correctResponsesLength) / size,
                animateFromLastPercent: true,
                animation: true,
                animationDuration: 600,
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: AppColors.g10Color,
                progressColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
