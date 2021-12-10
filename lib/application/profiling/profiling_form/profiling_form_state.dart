part of 'profiling_form_bloc.dart';

@freezed
abstract class ProfilingFormState with _$ProfilingFormState {
  const factory ProfilingFormState(
      {@required
          KtList<ProfilingResponse> responses,
      @required
          int correctResponsesLength,
      @required
          int index,
      @required
          bool isSubmitting,
      @required
          KtList<ProfilingItem> items,
      @required
          Option<Either<BaseFailure, ProfilingResult>>
              postFailureOrSuccessOption}) = _ProfilingFormState;

  factory ProfilingFormState.initial() => ProfilingFormState(
      responses: KtList.empty(),
      index: 0,
      correctResponsesLength: 0,
      isSubmitting: false,
      postFailureOrSuccessOption: none(),
      items: KtList.empty());
}
