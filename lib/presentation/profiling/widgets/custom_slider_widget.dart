import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/domain/core/value_objects.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/domain/profiling/profiling_response.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    Key key,
    @required this.profilingItem,
    @required this.type,
    @required this.valueField,
  }) : super(key: key);

  final ProfilingItem profilingItem;
  final int type;
  final double valueField;

  @override
  Widget build(BuildContext context) {
    final minValue = profilingItem.questions.first.value;
    final maxValue = profilingItem.questions.last.value;
    final formatCurrency =
        new NumberFormat.simpleCurrency(locale: "es_Mx", decimalDigits: 2);

    return BlocBuilder<ProfilingFormBloc, ProfilingFormState>(
      builder: (context, state) => Container(
        height: AppDimens.sliderContainerSize,
        padding: const EdgeInsets.only(
            top: AppDimens.layoutSpacerS,
            left: AppDimens.layoutSpacerS,
            right: AppDimens.layoutSpacerS),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: AppDimens.layoutSpacerXXs,
                  right: AppDimens.layoutSpacerXXs),
              child: Stack(
                children: [
                  Visibility(
                    visible: type != 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '0%',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        Text(
                          '25%',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        Text(
                          '50%',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        Text(
                          '75%',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        Text(
                          '100%',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: type == 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          type == 0
                              ? '${formatCurrency.format(minValue)}'
                              : '${formatCurrency.format(minValue).replaceAll(r'$', '%')}',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        type == 0
                            ? Text(
                                '${formatCurrency.format(maxValue / (5))}',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.menu3
                                    .copyWith(color: AppColors.g50Color),
                              )
                            : Container(),
                        Text(
                          type == 0
                              ? '${formatCurrency.format(maxValue / (5 / 2))}'
                              : '${formatCurrency.format(maxValue / 2).replaceAll(r'$', '%')}',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        ),
                        type == 0
                            ? Text(
                                '',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.menu3
                                    .copyWith(color: AppColors.g50Color),
                              )
                            : Container(),
                        type == 0
                            ? Text(
                                '',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.menu3
                                    .copyWith(color: AppColors.g50Color),
                              )
                            : Container(),
                        Text(
                          type == 0
                              ? '${formatCurrency.format(maxValue)}' +
                                  (valueField > maxValue ? '+' : '')
                              : '${formatCurrency.format(maxValue).replaceAll(r'$', '%')}',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.menu3
                              .copyWith(color: AppColors.g50Color),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            FlutterSlider(
              values: [buildValue(maxValue, state, minValue)],
              step: FlutterSliderStep(
                step: maxValue / 1000,
              ),
              max: maxValue,
              min: minValue,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                double score = lowerValue / (maxValue - minValue) * 4;
                score = getScore(lowerValue);
                context.bloc<ProfilingFormBloc>().add(
                    ProfilingFormEvent.responseSliderChanged(
                        profilingItem.id,
                        '',
                        score,
                        lowerValue.toStringAsFixed(0),
                        Tuple2(minValue, null)));
              },
              handler: FlutterSliderHandler(
                  decoration: BoxDecoration(),
                  child: Image.asset(AppImages.sliderHandler)),
              handlerAnimation: FlutterSliderHandlerAnimation(
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.bounceIn,
                  duration: Duration(milliseconds: 500),
                  scale: 1.5),
              trackBar: FlutterSliderTrackBar(
                activeTrackBarHeight: 5.0,
                inactiveTrackBarHeight: 5.0,
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.g10Color,
                ),
                activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double buildValue(
      double maxValue, ProfilingFormState state, double minValue) {
    final value = state.responses
        .asList()
        .firstWhere((element) => element.questionId == profilingItem.id,
            orElse: () => null)
        ?.value
        ?.getOrElse(minValue.toString());

    return min(
        maxValue,
        max(double.tryParse(value ?? minValue.toString()) ?? minValue,
            minValue));
  }

  double getScore(double value) {
    double score = 0;
    for (var q in profilingItem.questions) {
      if (value <= q.value) {
        score = q.score;
        print(q.value);
        break;
      }
    }
    if (value > profilingItem.questions.last.value)
      score = profilingItem.questions.last.score;
    print("$score:");
    return score;
  }
}
