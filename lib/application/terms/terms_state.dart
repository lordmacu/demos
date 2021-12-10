part of 'terms_bloc.dart';

@freezed
abstract class TermsState with _$TermsState {
  const factory TermsState.initial() = Initial;
  const factory TermsState.loadInProgress() = DataTransferInProgress;
  const factory TermsState.loadSuccess(String items) = LoadSuccess;
  const factory TermsState.loadFailure(BaseFailure failure) = LoadFailure;
}
