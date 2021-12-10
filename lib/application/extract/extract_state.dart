part of 'extract_bloc.dart';

@freezed
abstract class ExtractState with _$ExtractState {
  const factory ExtractState.initial() = Initial;
  const factory ExtractState.loadInProgress() = DataTransferInProgress;
  const factory ExtractState.loadSuccess(KtList<ExtractItem> extractItems, KtList<ExtractItem> extractItemsCertificate) =
      LoadSuccess;
  // const factory ExtractState.generateExtract(KtList<ExtractItem> requestedExtracts) = RequestExtracts;
  const factory ExtractState.loadFailure(BaseFailure failure) = LoadFailure;
}
