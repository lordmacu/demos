part of 'support_form_bloc.dart';

@freezed
abstract class SupportFormState with _$SupportFormState {
  const factory SupportFormState({
    @required bool isSubmitting,
    @required SupportMessage message,
    File file,
    @required
        Option<Either<BaseFailure, SupportMessage>> postFailureorSuccessOption,
  }) = _SupportFormState;

  factory SupportFormState.initial() => SupportFormState(
      isSubmitting: false,
      message: SupportMessage(
        message: "",
        typology: ""
      ),
      postFailureorSuccessOption: none());
}
