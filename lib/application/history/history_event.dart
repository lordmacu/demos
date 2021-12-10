part of 'history_bloc.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.getTransactions(int valuePeriocity) = _GetTransactions;
  const factory HistoryEvent.transactionsReceived(
    Either<BaseFailure, KtList<ProfitabilityItem>> profitabilitiesOrFailure,
    Either<BaseFailure, KtList<TransactionItem>> graphTransactionsOrFailure,
  ) = _TransactionsReceived;
}
