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
import 'package:ualet/presentation/profiling/widgets/form_questions.dart';
import 'package:ualet/presentation/profiling/widgets/list_cards.dart';

class SarlaftFormQuestion extends StatefulWidget {
  final ProfilingItem profilingItem;
  final int type;

  static const MONEY = 0;
  static const PERCENT = 1;

  SarlaftFormQuestion(
      {Key key, @required this.profilingItem, @required this.type})
      : super(key: key);

  @override
  _SarlaftFormQuestionState createState() => _SarlaftFormQuestionState();
}

class _SarlaftFormQuestionState extends State<SarlaftFormQuestion> {
  MoneyMaskedTextController _controller;
  String _selected;

  @override
  void initState() {
    _controller = MoneyMaskedTextController(
        thousandSeparator: '.',
        leftSymbol: widget.type == SarlaftFormQuestion.MONEY ? '\$' : '',
        rightSymbol: widget.type == SarlaftFormQuestion.PERCENT ? '%' : '',
        precision: 0,
        decimalSeparator: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilingFormBloc, ProfilingFormState>(
      listener: (context, state) {
        final value = state.responses
            .asList()
            .firstWhere(
                (element) => element.questionId == widget.profilingItem.id,
                orElse: () => null)
            ?.value;

        if (value != null) _selected = value.getOrElse('');
      },
      builder: (context, state) {
        // final Function(String optionId) selectAction = (optionId) => context
        //     .bloc<ProfilingFormBloc>()
        //     .add(ProfilingFormEvent.responseUniqueCheckChanged(
        //         widget.profilingItem.id, optionId));
        final Function(String qId, String responseId, String vfObservation,
                double score) selectAction =
            (qId, optionId, vfObservation, score) => context
                .bloc<ProfilingFormBloc>()
                .add(ProfilingFormEvent.responseUniqueFormCheckChanged(
                    widget.profilingItem.id + "." + qId,
                    score,
                    optionId,
                    '',
                    vfObservation));

        final Function(String qId, String sqId, String response, double score)
            subQAction = (qId, sqId, response, score) => context
                .bloc<ProfilingFormBloc>()
                .add(ProfilingFormEvent.responseFormSubquestion(score,
                    widget.profilingItem.id + "." + qId, sqId, response));

        return Container(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: AppDimens.layoutSpacerS,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    ...widget.profilingItem.formQuestions
                        .map((e) => FormQuestions(
                              option: e,
                              selectAction: selectAction,
                              subQuestionAction: subQAction,
                            ))
                        .toList()
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getRawTextValue() => _controller.text
      .replaceAll(widget.type == SarlaftFormQuestion.MONEY ? '\$' : '%', '')
      .replaceAll('.', '');
}
