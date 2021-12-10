part of 'bankdelete_bloc.dart';

@freezed
abstract class BankdeleteState with _$BankdeleteState {
  const factory BankdeleteState({
    Option<Either<BaseFailure, bool>> deleteOrFailure,
  }) = _BankdeleteState;

  factory BankdeleteState.initial() => BankdeleteState(
        deleteOrFailure: none(),
      );
}
