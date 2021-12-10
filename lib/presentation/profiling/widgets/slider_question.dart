import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:dartz/dartz.dart' show Tuple2;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/profiling/widgets/custom_slider_widget.dart';
import 'package:intl/intl.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SliderQuestion extends StatefulWidget {
  final ProfilingItem profilingItem;
  final int type;

  static const MONEY = 0;
  static const PERCENT = 1;
  static const MX = false; //CHANGE in COL to false

  SliderQuestion({Key key, @required this.profilingItem, @required this.type})
      : super(key: key);

  @override
  _SliderQuestionState createState() => _SliderQuestionState();
}

class _SliderQuestionState extends State<SliderQuestion> {
  MoneyMaskedTextController _controller;

  @override
  void initState() {
    bool isColombia = getIt<IEnv>().isColombia();
    if (isColombia)
      _controller = MoneyMaskedTextController(
          thousandSeparator: '.',
          leftSymbol: widget.type == SliderQuestion.MONEY ? '\$' : '',
          rightSymbol: widget.type == SliderQuestion.PERCENT ? '%' : '',
          precision: 0,
          decimalSeparator: '');
    else
      _controller = MoneyMaskedTextController(
          thousandSeparator: ',',
          leftSymbol: widget.type == SliderQuestion.MONEY ? '\$' : '',
          rightSymbol: widget.type == SliderQuestion.PERCENT ? '%' : '',
          precision: widget.type == SliderQuestion.MONEY ? 2 : 0,
          decimalSeparator: widget.type == SliderQuestion.MONEY ? '.' : '');
    _controller.text = widget.profilingItem.questions.first.value
        .toStringAsFixed(isColombia ? 0 : 2);
    super.initState();
  }

  formatedNumber(number) {
    var formatCurrency;

    formatCurrency =
    new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);


    if (getIt<IEnv>().isColombia()) {
      formatCurrency = new NumberFormat.currency(
          customPattern: "\u00A4#,##0.00\u00A0",
          symbol: "\$",
          decimalDigits: 0,
          locale: "es");
    }

    return formatCurrency.format(number);
  }

  final node = FocusNode();
  @override
  Widget build(BuildContext context) {
    // var otherNode = FocusNode();
    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        keyboardBarColor: Colors.grey[200],
        nextFocus: false,
        actions: [
          KeyboardActionsItem(
            focusNode: node,
            // onTapAction: () {
            //   print("Aaaa");
            //   FocusScope.of(context).requestFocus(otherNode);
            // },
            displayDoneButton: true,
          ),
        ],
      );
    }

    final minValue = widget.profilingItem.questions.first.value;
    final maxValue = widget.profilingItem.questions.last.value;
    final formatCurrency = new NumberFormat.currency(
        customPattern: "\u00A4#,##0.00\u00A0",
        symbol: "\$",
        decimalDigits: 0,
        locale: "es"); // Moneda Mexico(Pesos)

    return BlocConsumer<ProfilingFormBloc, ProfilingFormState>(
      listener: (context, state) {
        final value = state.responses
            .asList()
            .firstWhere(
                (element) => element.questionId == widget.profilingItem.id,
            orElse: () => null)
            ?.value;

        if (value != null)
          _controller.updateValue(double.tryParse(
              value.value.fold((l) => l.failedValue, (r) => r)));
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 112,
              child: KeyboardActions(
                config: _buildConfig(context),
                isDialog: true,
                // tapOutsideToDismiss: true,
                child: TextFormField(
                  focusNode: node,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  autovalidateMode: AutovalidateMode.always,
                  maxLength: widget.type == SliderQuestion.PERCENT
                      ? maxValue.toString().length - 1
                      : null,
                  // maxLength: widget.type == SliderQuestion.PERCENT ? 100 : null,
                  style: AppTextStyles.subtitle2
                      .copyWith(color: AppColors.g90Color),
                  controller: _controller,

                  validator: (_) => context
                      .bloc<ProfilingFormBloc>()
                      .state
                      .responses
                      .asList()
                      .firstWhere(
                          (element) =>
                      element.questionId == widget.profilingItem.id,
                      orElse: () => null)
                      ?.value
                      ?.value
                      ?.fold(
                        (f) => f.maybeMap(
                      numberToBig: (_) =>
                      S.of(context).errorValidFieldMaxProfile +
                          '${formatedNumber(maxValue)}'.replaceAll(
                              widget.type == SliderQuestion.PERCENT
                                  ? '\$'
                                  : '%',
                              ''),
                      invalidNumber: (_) =>
                      S.of(context).errorValidFieldFormatProfile,
                      numberToLow: (_) =>
                      S.of(context).errorValidFieldProfile +
                          '${formatedNumber(minValue)}'.replaceAll(
                              widget.type == SliderQuestion.PERCENT
                                  ? '\$'
                                  : '%',
                              ''),
                      orElse: () => null,
                    ),
                        (_) => null,
                  ),
                  onChanged: (val) {
                    print("OnChanged: $val");
                    // double score = 0;
                    // double value = double.parse(
                    //     getRawTextValue().replaceAll("%", "").trim());
                    double value = _controller.numberValue;
                    print("DValue: $value");
                    var score = getScore(value);
                    print("Score: $score");
                    context.bloc<ProfilingFormBloc>().add(
                        ProfilingFormEvent.responseSliderChanged(
                            widget.profilingItem.id,
                            '',
                            score,
                            value.toStringAsFixed(2),
                            Tuple2(
                                minValue,
                                widget.type == SliderQuestion.PERCENT
                                    ? maxValue
                                    : null)));
                  },
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: widget.type == SliderQuestion.MONEY
                          ? S.of(context).sliderMoneyHintLabel
                          : S.of(context).sliderPercentHintLabel,
                      hintStyle: AppTextStyles.subtitle2
                          .copyWith(color: AppColors.g25Color)),
                ),
              ),
            ),
            // const SizedBox(
            //   height: AppDimens.layoutSpacerS,
            // ),
            CustomSliderWidget(
                profilingItem: widget.profilingItem,
                type: widget.type,
                valueField: _controller.numberValue)
          ],
        );
      },
    );
  }

  double getScore(double value) {
    double score = 0;
    for (var q in widget.profilingItem.questions) {
      if (value <= q.value) {
        score = q.score;
        print(q.value);
        break;
      }
    }
    if (value > widget.profilingItem.questions.last.value)
      score = widget.profilingItem.questions.last.score;
    print("$score:");
    return score;
  }

  String getRawTextValue() => _controller.text
      .replaceAll(widget.type == SliderQuestion.MONEY ? '\$' : '%', '')
      .replaceAll(SliderQuestion.MX ? ',' : '.', '');
}
