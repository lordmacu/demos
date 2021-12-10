part of 'investing_mx_main_bloc.dart';

@freezed
abstract class InvestingMxMainEvent with _$InvestingMxMainEvent {
  const factory InvestingMxMainEvent.selectGoal(
      DashboardGoal newGoal, int newSelectedIndex) = _selectGoal;
  const factory InvestingMxMainEvent.inicial() = _initial;
  const factory InvestingMxMainEvent.updateFee(double newFee) = _updateFee;
  const factory InvestingMxMainEvent.updatePeriodicity(
      int newPeriodicity, bool multiple) = _newPeriodicity;
  const factory InvestingMxMainEvent.undoChange(bool multiple) =
      _undoChange; //Cuando el usuario pone que no quiere cambiar los datos ene el popup
  const factory InvestingMxMainEvent.acceptChange(bool multiple) =
      _acceptChange; //Cuando el usuarioa cepta los cambios en el popup
  const factory InvestingMxMainEvent.forceShowDialog() = _forceShowDialog;
  const factory InvestingMxMainEvent.updateInitialDate(
      DateTime newInitialDate) = _updateInitialDate;
  const factory InvestingMxMainEvent.getMultipleData(
      List<DashboardGoal> goals, List<double> values) = _GetMultipleFata;
  const factory InvestingMxMainEvent.nextPage(bool isSubmitting) = _NextPage;
  const factory InvestingMxMainEvent.nextProcessAwait(BankAccountItem item, DashboardGoal goal, bool multiple, List<DashboardGoal> goals, double totalValue) = _NextProcessAwait;
}
