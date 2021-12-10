part of 'bankdelete_bloc.dart';

@freezed
abstract class BankdeleteEvent with _$BankdeleteEvent {
  const factory BankdeleteEvent.deleteBankAccount(BankAccountItem bankAccount) =
      _deleteBankAccount;
  const factory BankdeleteEvent.resetBloc() = _resetBloc;
}
