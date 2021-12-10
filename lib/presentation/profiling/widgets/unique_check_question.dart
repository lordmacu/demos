import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';

import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/profiling/widgets/form_question.dart';

import 'package:ualet/presentation/profiling/widgets/list_cards.dart';
import 'package:ualet/presentation/profiling/widgets/wrap_cards.dart';

import 'form_questions.dart';

class UniqueCheckQuestion extends StatefulWidget {
  final ProfilingItem profilingItem;
  final int type;

  static const WRAP = 0;
  static const LIST = 1;
  static const LIST_FORM = 2;
  static const LIST_CHECK = 3;

  UniqueCheckQuestion(
      {Key key, @required this.profilingItem, @required this.type})
      : super(key: key);

  @override
  _UniqueCheckQuestionState createState() => _UniqueCheckQuestionState();
}

class _UniqueCheckQuestionState extends State<UniqueCheckQuestion> {
  String _selected;

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
        final Function(String optionId, double score) selectAction =
            (optionId, score) => context.bloc<ProfilingFormBloc>().add(
                ProfilingFormEvent.responseUniqueCheckChanged(
                    score, widget.profilingItem.id, optionId));

        final Function unselectAction = () => context
            .bloc<ProfilingFormBloc>()
            .add(ProfilingFormEvent.responseUniqueCheckChanged(
                0, widget.profilingItem.id, ''));

        final Function(String optionId, String isValueCheck,
                String valueFieldObservation) selectFormAction =
            (optionId, isValueCheck, valueFieldObservation) => context
                .bloc<ProfilingFormBloc>()
                .add(ProfilingFormEvent.responseUniqueFormCheckChanged(
                    widget.profilingItem.id,
                    0,
                    optionId,
                    isValueCheck,
                    valueFieldObservation));

        final Function(String qId, String responseId, String vfObservation,
                double score) selectActionForm =
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

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            if (widget.type == UniqueCheckQuestion.WRAP) ...[
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: AppDimens.layoutHSpacerS,
                crossAxisSpacing: AppDimens.layoutSpacerS,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: widget.profilingItem.questions
                    .map((e) => e.id == _selected
                        ? SelectedWrapCard(option: e, action: unselectAction)
                        : UnselectedWrapCard(option: e, action: selectAction))
                    .toList(),
              )
            ] else if (widget.type == UniqueCheckQuestion.LIST) ...[
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ...widget.profilingItem.questions
                      .map((e) => e.id == _selected
                          ? SelectedListCard(option: e, action: unselectAction)
                          : UnselectedListCard(option: e, action: selectAction))
                      .toList()
                ],
              ),
            ] else if (widget.type == UniqueCheckQuestion.LIST_FORM) ...[
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ...widget.profilingItem.questions
                      .map((e) => e.id == _selected
                          ? SelectedListCard(option: e, action: unselectAction)
                          : UnselectedListCard(option: e, action: selectAction))
                      .toList(),
                  ...[
                    ...widget.profilingItem.formQuestions
                        .map((e) => FormQuestions(
                              option: e,
                              selectAction: selectActionForm,
                              subQuestionAction: subQAction,
                            ))
                        .toList(),
                  ],
                ],
              ),
            ] else if (widget.type == UniqueCheckQuestion.LIST_CHECK) ...[
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ...widget.profilingItem.questions
                      .map((e) => e.id == _selected
                          ? SelectedListCard(option: e, action: unselectAction)
                          : UnselectedListCard(option: e, action: selectAction))
                      .toList()
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
