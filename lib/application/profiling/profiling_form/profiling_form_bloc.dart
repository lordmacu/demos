import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/core/value_objects.dart';
import 'package:ualet/domain/core/value_validators.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/domain/profiling/profiling_response.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:ualet/to_be_refactor/models/profiling/get_questions.dart';

part 'profiling_form_event.dart';
part 'profiling_form_state.dart';

part 'profiling_form_bloc.freezed.dart';

@injectable
class ProfilingFormBloc extends Bloc<ProfilingFormEvent, ProfilingFormState> {
  final IProfilingMxRepository _profilingRepository;

  ProfilingFormBloc(this._profilingRepository);

  @override
  ProfilingFormState get initialState => ProfilingFormState.initial();

  @override
  Stream<ProfilingFormState> mapEventToState(
    ProfilingFormEvent event,
  ) async* {
    yield* event.map(
      //setItems
      setItems: (e) async* {
        yield state.copyWith(
          items: e.items,
        );
      },
      responseFormSubquestion: (e) async* {
        // print(e.questionId);
        // if(state.responses.filter((element) => element.questionId == e.questionId))

        final ProfilingResponse oldResponse = state.responses.firstOrNull(
            (response) =>
                response.questionId == e.questionId + "." + e.subquestionId);

        final ProfilingResponse newResponse = oldResponse?.copyWith(
                responseId: '',
                score: e.score,
                valueFieldObservation: e.responseText,
                value: StringNotEmpty(
                    e.responseText == '' ? e.questionId : e.responseText)) ??
            ProfilingResponse(
                score: e.score,
                questionId: e.questionId + "." + e.subquestionId,
                responseId: '',
                value: StringNotEmpty(
                    e.responseText == '' ? e.questionId : e.responseText));

        // print("Subquestion>>>>NewResponse\n" + newResponse.toString());

        final responsesList = state.responses.toMutableList();
        responsesList.remove(oldResponse);
        responsesList.add(newResponse);

        yield state.copyWith(
          responses: responsesList.toList(),
          postFailureOrSuccessOption: none(),
          // correctResponsesLength: state.index + 1,
          correctResponsesLength:
              state.index + checkCurrentScreenCompleted(responsesList.toList()),
        );
      },

      //slider
      responseSliderChanged: (e) async* {
        final validator = (input) => validateNumberInRange(input, e.limits);
        final ProfilingResponse oldResponse = state.responses
            .firstOrNull((response) => response.questionId == e.questionId);
        final ProfilingResponse newResponse = oldResponse?.copyWith(
                responseId: e.responseId,
                score: e.score,
                value: DoubleNumber(e.value, validator: validator)) ??
            ProfilingResponse(
                score: e.score,
                questionId: e.questionId,
                responseId: e.responseId,
                value: DoubleNumber(e.value, validator: validator));

        final responsesList = state.responses.toMutableList();
        responsesList.remove(oldResponse);
        responsesList.add(newResponse);
        yield state.copyWith(
          responses: responsesList.toList(),
          postFailureOrSuccessOption: none(),
          // correctResponsesLength:
          //     state.index + (newResponse.value.isValid() ? 1 : 0)
          correctResponsesLength:
              state.index + checkCurrentScreenCompleted(responsesList.toList()),
        );
      },

      //unique check
      responseUniqueCheckChanged: (e) async* {
        // print("ResUniqueCheckChanged: " + e.questionId + ":" + e.responseId);
        final ProfilingResponse oldResponse = state.responses
            .firstOrNull((response) => response.questionId == e.questionId);

        final ProfilingResponse newResponse = oldResponse?.copyWith(
                responseId: e.responseId,
                score: e.score,
                value: StringNotEmpty(e.responseId)) ??
            ProfilingResponse(
                score: e.score,
                questionId: e.questionId,
                responseId: e.responseId,
                value: StringNotEmpty(e.responseId));

        final responsesList = state.responses.toMutableList();
        responsesList.remove(oldResponse);
        responsesList.add(newResponse);

        yield state.copyWith(
          responses: responsesList.toList(),
          postFailureOrSuccessOption: none(),
          // correctResponsesLength:
          //     state.index + (newResponse.value.isValid() ? 1 : 0)
          correctResponsesLength:
              state.index + checkCurrentScreenCompleted(responsesList.toList()),
        );
      },

      //unique form check
      responseUniqueFormCheckChanged: (e) async* {
        // print("ResUniqueFormCheckChanged-> " +
        //     e.questionId +
        //     "->" +
        //     e.responseId +
        //     "(vfObs:)" +
        //     e.valueFieldObservation);
        final ProfilingResponse oldResponse = state.responses
            .firstOrNull((response) => response.questionId == e.questionId);

        final ProfilingResponse newResponse = oldResponse?.copyWith(
                responseId: e.responseId,
                //TODO
                score: e.score,
                isValueCheck: e.isValueCheck,
                valueFieldObservation: e.valueFieldObservation,
                value: StringNotEmpty(
                    e.responseId == '' ? e.questionId : e.responseId)) ??
            ProfilingResponse(
                //TODO
                score: e.score,
                questionId: e.questionId,
                responseId: e.responseId,
                value: StringNotEmpty(
                    e.responseId == '' ? e.questionId : e.responseId));

        final responsesList = state.responses.toMutableList();
        responsesList.remove(oldResponse);
        responsesList.add(newResponse);

        yield state.copyWith(
          responses: responsesList.toList(),
          postFailureOrSuccessOption: none(),
          // correctResponsesLength:
          //     state.index + (newResponse.value.isValid() ? 1 : 0)
          correctResponsesLength:
              state.index + checkCurrentScreenCompleted(responsesList.toList()),
        );
      },

      //Multicheck Changed
      responseMultiCheckChanged: (e) async* {
        final ProfilingResponse oldResponse = state.responses
            .firstOrNull((response) => response.questionId == e.questionId);
        final ProfilingResponse newResponse = oldResponse?.copyWith(
                responseId: e.responseId,
                score: e.score,
                value: StringNotEmpty(e.responseId)) ??
            ProfilingResponse(
                score: e.score,
                questionId: e.questionId,
                responseId: e.responseId,
                value: StringNotEmpty(e.responseId));

        final responsesList = state.responses.toMutableList();
        responsesList.remove(oldResponse);
        responsesList.add(newResponse);
        yield state.copyWith(
          responses: responsesList.toList(),
          postFailureOrSuccessOption: none(),
          // correctResponsesLength:
          //     state.index + (newResponse.value.isValid() ? 1 : 0),
          correctResponsesLength:
              state.index + checkCurrentScreenCompleted(responsesList.toList()),
        );
      },

      //Post
      postProfiling: (e) async* {
        yield state.copyWith(
            postFailureOrSuccessOption: none(), isSubmitting: true);

        final failureOrSuccess =
            await _profilingRepository.postProfilingData(state.responses);
        yield state.copyWith(
            isSubmitting: false,
            postFailureOrSuccessOption: some(failureOrSuccess));
      },
      previousQuestion: (e) async* {
        yield state.copyWith(
            index: state.index - 1, postFailureOrSuccessOption: none());
      },
      nextQuestion: (e) async* {
        if (state.correctResponsesLength == e.size &&
            state.index + 1 == e.size) {
          add(ProfilingFormEvent.postProfiling());
        } else {
          yield state.copyWith(
              index: state.index + 1, postFailureOrSuccessOption: none());
        }
      },
    );
  }

  int checkCurrentScreenCompleted(KtList<ProfilingResponse> pResponses) {
    if (state.items.isEmpty()) return 0;
    ProfilingItem item = state.items.get(state.index);
    KtList<ProfilingResponse> responses =
        pResponses.filter((r) => r.questionId.startsWith(item.id));
    // print(responses);

    //Checks the normal quiestion for an answer
    if (item.questions.isNotEmpty) {
      var a = responses.find((r) => r.questionId == item.id);
      if (a == null) return 0;
    }

    //Checks the forms type questions for answers to all forms
    if (item.formQuestions.isNotEmpty) {
      for (var q in item.formQuestions) {
        var res = responses.find((r) => item.id + "." + q.id == r.questionId);
        if (res == null) return 0;
        KtList<ProfilingFormOptionType> options =
            KtList.from(q.listOptionTypeCheck);
        var needsSub =
            options.find((o) => o.id == res.responseId).isObservation;
        //Checks extra text fields from those form questions
        if (needsSub) {
          for (var tf in q.listOptionTypeField) {
            var subResponse = responses.find(
                (r) => item.id + "." + q.id + "." + tf.id == r.questionId);
            if (subResponse == null) return 0;
            if (subResponse.valueFieldObservation == '') return 0;
          }
        }
      }
    }

    return 1;
  }
}
