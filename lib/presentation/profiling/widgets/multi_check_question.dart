import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/profiling/widgets/list_cards.dart';

class MultiCheckQuestion extends StatefulWidget {
  final ProfilingItem profilingItem;
  final int type;

  static const LIST_CHECK = 0;

  MultiCheckQuestion(
      {Key key, @required this.profilingItem, @required this.type})
      : super(key: key);

  @override
  _MultiCheckQuestionState createState() => _MultiCheckQuestionState();
}

class _MultiCheckQuestionState extends State<MultiCheckQuestion> {
  final List<String> _selected = new List<String>();
  String responseIds = '';
  final Map<String, bool> _itemSelected = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.profilingItem.questions.forEach((element) {
      _itemSelected[element.id] = false;
    });
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

        if (value != null) {
          _selected.add(value.getOrElse(''));
        }
      },
      builder: (context, state) {
        final Function(String optionId, double score) selectAction =
            (optionId, score) {
          _itemSelected[optionId] = !_itemSelected[optionId];
          String ids = '';
          double scoreSum = 0;
          widget.profilingItem.questions.forEach((element) {
            if (_itemSelected[element.id]) {
              ids += element.id + ',';
              if (element.score > scoreSum) scoreSum = element.score;
            }
          });
          print("IDS");
          print(ids);
          print("SCORE");
          print(scoreSum);
          context.bloc<ProfilingFormBloc>().add(
              ProfilingFormEvent.responseMultiCheckChanged(
                  scoreSum, widget.profilingItem.id, ids));
        };

        // final Function unselectAction = () => context
        //     .bloc<ProfilingFormBloc>()
        //     .add(ProfilingFormEvent.responseUniqueCheckChanged(
        //         0, widget.profilingItem.id, ''));

        // final Function(String optionId, double score) unSelectMultiAction =
        //     (optionId, score) => context.bloc<ProfilingFormBloc>().add(
        //         ProfilingFormEvent.responseMultiCheckChanged(
        //             score, widget.profilingItem.id, optionId));

        // final Function(String optionId) unSelectOption = (optionId) => {
        //       setState(() {
        //         _selected.remove(optionId);
        //         unSelectMultiAction(optionId, 0);
        //       }),
        //     };
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: AppDimens.layoutSpacerS,
            ),
            if (widget.type == MultiCheckQuestion.LIST_CHECK) ...[
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ...widget.profilingItem.questions
                      .map((e) => _itemSelected[e.id]
                          ? MultiSelectedListCard(
                              option: e, action: selectAction)
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
