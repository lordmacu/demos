part of 'edit_debit_bloc.dart';

@freezed
abstract class EditDebitEvent with _$EditDebitEvent {
  const factory EditDebitEvent.selectGoal(
      DashboardGoal newGoal, int newSelectedIndex) = _selectGoal;
  const factory EditDebitEvent.selectDebit(DebitItem newDebitItem) =
      _selectDebit;
  const factory EditDebitEvent.selectDebitInfo(DebitInfo newDebitItem) =
      _selectDebitInfo;
  const factory EditDebitEvent.inicial() = _initial;
  const factory EditDebitEvent.updateFee(double newFee) = _updateFee;
  const factory EditDebitEvent.updatePeriodicity(int newPeriodicity) =
      _newPeriodicity;
  const factory EditDebitEvent.undoChange() =
      _undoChange; //Cuando el usuario pone que no quiere cambiar los datos ene el popup
  const factory EditDebitEvent.acceptChange() =
      _acceptChange; //Cuando el usuarioa cepta los cambios en el popup
  const factory EditDebitEvent.forceShowDialog() = _forceShowDialog;
  const factory EditDebitEvent.updateInitialDate(DateTime newInitialDate) =
      _updateInitialDate;
  const factory EditDebitEvent.isSubmitting(bool value) = _isSubmitting;
}
