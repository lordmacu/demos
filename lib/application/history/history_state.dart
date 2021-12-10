part of 'history_bloc.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = Initial;
  const factory HistoryState.loadInProgress() = LoadInProgress;
  const factory HistoryState.loadSuccess(
    KtList<ProfitabilityItem> profitabilities,
    KtList<TransactionItem> graphTransactions,
  ) = LoadSuccess;
  const factory HistoryState.loadFailure(BaseFailure failure) = LoadFailure;
}
