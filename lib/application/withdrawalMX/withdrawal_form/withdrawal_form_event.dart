part of 'withdrawal_form_bloc.dart';

@freezed
abstract class WithdrawalFormEvent with _$WithdrawalFormEvent {
  const factory WithdrawalFormEvent.chooseWithdrawalType(int type) =
      ChooseWithdrawalType;
  const factory WithdrawalFormEvent.choosePopUpType(int rulePopUpType, double transactionValue) =
      ChoosePopUpType;
  const factory WithdrawalFormEvent.chooseGoal(
      DashboardGoal goal, double withdrawal) = ChooseGoal;
  const factory WithdrawalFormEvent.unChooseGoal(DashboardGoal goal) =
      UnChooseGoal;
  const factory WithdrawalFormEvent.chooseAccount(BankInfo bank) =
      ChooseAccount;
  const factory WithdrawalFormEvent.otpChanged(String otp) = OTPChanged;
  const factory WithdrawalFormEvent.sendOTP(String phoneNumber) = SendOTP;
  const factory WithdrawalFormEvent.validateOTP(
      String phoneNumber, String otp) = ValidateOTP;
  const factory WithdrawalFormEvent.confirmHolder(bool confirmed) =
      ConfirmHolder;
  const factory WithdrawalFormEvent.withdrawalAll(
      String bankAccountId,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal,
      bool isValidReCalculateDebits) = WithdrawalAll;
  const factory WithdrawalFormEvent.withdrawalParcial(
      List<double> valuesChosen,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal) = WithdrawalParcial;
  const factory WithdrawalFormEvent.confirmWithdrawal(bool value) =
      ConfirmWithdrawal;

  const factory WithdrawalFormEvent.resetWithdraw(bool value) =
  ResetWithdraw;

  const factory WithdrawalFormEvent.debitOptionChanged(int value) =
      DebitOptionChanged;
  const factory WithdrawalFormEvent.goalOptionChanged(int value) =
      GoalOptionChanged;
  const factory WithdrawalFormEvent.showModalDeleteGoalChanged(bool value) =
      ShowModalDeleteGoalChanged;
  const factory WithdrawalFormEvent.showModalReCalculateDebitsChanged(
      bool value) = ShowModalReCalculateDebitsChanged;
  const factory WithdrawalFormEvent.deleteGoals(List<DashboardGoal> goals) =
      DeleteGoals;
  const factory WithdrawalFormEvent.deleteDebits(List<DebitInfo> debits) =
      DeleteDebits;
  const factory WithdrawalFormEvent.deleteGoal(DashboardGoal goal) = DeleteGoal;
  const factory WithdrawalFormEvent.deleteDebit(DebitInfo debit) = DeleteDebit;
  const factory WithdrawalFormEvent.showDialog(bool value) = ShowDialog;
  const factory WithdrawalFormEvent.alreadyShown(bool value) = AlreadyShown;
  const factory WithdrawalFormEvent.checkBox(bool value) = CheckBox;
  const factory WithdrawalFormEvent.assignTo(DashboardGoal goal) = AssignTo;
  const factory WithdrawalFormEvent.assignFrom(
      DashboardGoal goal, double value) = AssignFrom;
  const factory WithdrawalFormEvent.assignMoney(DashboardGoal goalToAssign) = AssignMoney;

  const factory WithdrawalFormEvent.getSimulation(double value) = GetSimulation;
}
