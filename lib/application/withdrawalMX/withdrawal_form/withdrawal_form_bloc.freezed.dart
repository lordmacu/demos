// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'withdrawal_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$WithdrawalFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  });
}

class _$WithdrawalFormEventTearOff {
  const _$WithdrawalFormEventTearOff();

  ChooseWithdrawalType chooseWithdrawalType(int type) {
    return ChooseWithdrawalType(
      type,
    );
  }

  ChoosePopUpType choosePopUpType(int rulePopUpType, double transactionValue) {
    return ChoosePopUpType(
      rulePopUpType,
      transactionValue,
    );
  }

  ChooseGoal chooseGoal(DashboardGoal goal, double withdrawal) {
    return ChooseGoal(
      goal,
      withdrawal,
    );
  }

  UnChooseGoal unChooseGoal(DashboardGoal goal) {
    return UnChooseGoal(
      goal,
    );
  }

  ChooseAccount chooseAccount(BankInfo bank) {
    return ChooseAccount(
      bank,
    );
  }

  OTPChanged otpChanged(String otp) {
    return OTPChanged(
      otp,
    );
  }

  SendOTP sendOTP(String phoneNumber) {
    return SendOTP(
      phoneNumber,
    );
  }

  ValidateOTP validateOTP(String phoneNumber, String otp) {
    return ValidateOTP(
      phoneNumber,
      otp,
    );
  }

  ConfirmHolder confirmHolder(bool confirmed) {
    return ConfirmHolder(
      confirmed,
    );
  }

  WithdrawalAll withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
      bool isValidDeleteGoal, bool isValidReCalculateDebits) {
    return WithdrawalAll(
      bankAccountId,
      isValidDeleteDebit,
      isValidDeleteGoal,
      isValidReCalculateDebits,
    );
  }

  WithdrawalParcial withdrawalParcial(
      List<double> valuesChosen,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal) {
    return WithdrawalParcial(
      valuesChosen,
      bankAccountId,
      goals,
      totalValue,
      isValidDeleteDebit,
      isValidDeleteGoal,
    );
  }

  ConfirmWithdrawal confirmWithdrawal(bool value) {
    return ConfirmWithdrawal(
      value,
    );
  }

  ResetWithdraw resetWithdraw(bool value) {
    return ResetWithdraw(
      value,
    );
  }

  DebitOptionChanged debitOptionChanged(int value) {
    return DebitOptionChanged(
      value,
    );
  }

  GoalOptionChanged goalOptionChanged(int value) {
    return GoalOptionChanged(
      value,
    );
  }

  ShowModalDeleteGoalChanged showModalDeleteGoalChanged(bool value) {
    return ShowModalDeleteGoalChanged(
      value,
    );
  }

  ShowModalReCalculateDebitsChanged showModalReCalculateDebitsChanged(
      bool value) {
    return ShowModalReCalculateDebitsChanged(
      value,
    );
  }

  DeleteGoals deleteGoals(List<DashboardGoal> goals) {
    return DeleteGoals(
      goals,
    );
  }

  DeleteDebits deleteDebits(List<DebitInfo> debits) {
    return DeleteDebits(
      debits,
    );
  }

  DeleteGoal deleteGoal(DashboardGoal goal) {
    return DeleteGoal(
      goal,
    );
  }

  DeleteDebit deleteDebit(DebitInfo debit) {
    return DeleteDebit(
      debit,
    );
  }

  ShowDialog showDialog(bool value) {
    return ShowDialog(
      value,
    );
  }

  AlreadyShown alreadyShown(bool value) {
    return AlreadyShown(
      value,
    );
  }

  CheckBox checkBox(bool value) {
    return CheckBox(
      value,
    );
  }

  AssignTo assignTo(DashboardGoal goal) {
    return AssignTo(
      goal,
    );
  }

  AssignFrom assignFrom(DashboardGoal goal, double value) {
    return AssignFrom(
      goal,
      value,
    );
  }

  AssignMoney assignMoney(DashboardGoal goalToAssign) {
    return AssignMoney(
      goalToAssign,
    );
  }

  GetSimulation getSimulation(double value) {
    return GetSimulation(
      value,
    );
  }
}

const $WithdrawalFormEvent = _$WithdrawalFormEventTearOff();

class _$ChooseWithdrawalType implements ChooseWithdrawalType {
  const _$ChooseWithdrawalType(this.type) : assert(type != null);

  @override
  final int type;

  @override
  String toString() {
    return 'WithdrawalFormEvent.chooseWithdrawalType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChooseWithdrawalType &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @override
  _$ChooseWithdrawalType copyWith({
    Object type = freezed,
  }) {
    return _$ChooseWithdrawalType(
      type == freezed ? this.type : type as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseWithdrawalType(type);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseWithdrawalType != null) {
      return chooseWithdrawalType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseWithdrawalType(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseWithdrawalType != null) {
      return chooseWithdrawalType(this);
    }
    return orElse();
  }
}

abstract class ChooseWithdrawalType implements WithdrawalFormEvent {
  const factory ChooseWithdrawalType(int type) = _$ChooseWithdrawalType;

  int get type;

  ChooseWithdrawalType copyWith({int type});
}

class _$ChoosePopUpType implements ChoosePopUpType {
  const _$ChoosePopUpType(this.rulePopUpType, this.transactionValue)
      : assert(rulePopUpType != null),
        assert(transactionValue != null);

  @override
  final int rulePopUpType;
  @override
  final double transactionValue;

  @override
  String toString() {
    return 'WithdrawalFormEvent.choosePopUpType(rulePopUpType: $rulePopUpType, transactionValue: $transactionValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChoosePopUpType &&
            (identical(other.rulePopUpType, rulePopUpType) ||
                const DeepCollectionEquality()
                    .equals(other.rulePopUpType, rulePopUpType)) &&
            (identical(other.transactionValue, transactionValue) ||
                const DeepCollectionEquality()
                    .equals(other.transactionValue, transactionValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rulePopUpType) ^
      const DeepCollectionEquality().hash(transactionValue);

  @override
  _$ChoosePopUpType copyWith({
    Object rulePopUpType = freezed,
    Object transactionValue = freezed,
  }) {
    return _$ChoosePopUpType(
      rulePopUpType == freezed ? this.rulePopUpType : rulePopUpType as int,
      transactionValue == freezed
          ? this.transactionValue
          : transactionValue as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return choosePopUpType(rulePopUpType, transactionValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (choosePopUpType != null) {
      return choosePopUpType(rulePopUpType, transactionValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return choosePopUpType(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (choosePopUpType != null) {
      return choosePopUpType(this);
    }
    return orElse();
  }
}

abstract class ChoosePopUpType implements WithdrawalFormEvent {
  const factory ChoosePopUpType(int rulePopUpType, double transactionValue) =
      _$ChoosePopUpType;

  int get rulePopUpType;
  double get transactionValue;

  ChoosePopUpType copyWith({int rulePopUpType, double transactionValue});
}

class _$ChooseGoal implements ChooseGoal {
  const _$ChooseGoal(this.goal, this.withdrawal)
      : assert(goal != null),
        assert(withdrawal != null);

  @override
  final DashboardGoal goal;
  @override
  final double withdrawal;

  @override
  String toString() {
    return 'WithdrawalFormEvent.chooseGoal(goal: $goal, withdrawal: $withdrawal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChooseGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.withdrawal, withdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawal, withdrawal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(withdrawal);

  @override
  _$ChooseGoal copyWith({
    Object goal = freezed,
    Object withdrawal = freezed,
  }) {
    return _$ChooseGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
      withdrawal == freezed ? this.withdrawal : withdrawal as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseGoal(goal, withdrawal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseGoal != null) {
      return chooseGoal(goal, withdrawal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseGoal != null) {
      return chooseGoal(this);
    }
    return orElse();
  }
}

abstract class ChooseGoal implements WithdrawalFormEvent {
  const factory ChooseGoal(DashboardGoal goal, double withdrawal) =
      _$ChooseGoal;

  DashboardGoal get goal;
  double get withdrawal;

  ChooseGoal copyWith({DashboardGoal goal, double withdrawal});
}

class _$UnChooseGoal implements UnChooseGoal {
  const _$UnChooseGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'WithdrawalFormEvent.unChooseGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnChooseGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$UnChooseGoal copyWith({
    Object goal = freezed,
  }) {
    return _$UnChooseGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return unChooseGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unChooseGoal != null) {
      return unChooseGoal(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return unChooseGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unChooseGoal != null) {
      return unChooseGoal(this);
    }
    return orElse();
  }
}

abstract class UnChooseGoal implements WithdrawalFormEvent {
  const factory UnChooseGoal(DashboardGoal goal) = _$UnChooseGoal;

  DashboardGoal get goal;

  UnChooseGoal copyWith({DashboardGoal goal});
}

class _$ChooseAccount implements ChooseAccount {
  const _$ChooseAccount(this.bank) : assert(bank != null);

  @override
  final BankInfo bank;

  @override
  String toString() {
    return 'WithdrawalFormEvent.chooseAccount(bank: $bank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChooseAccount &&
            (identical(other.bank, bank) ||
                const DeepCollectionEquality().equals(other.bank, bank)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bank);

  @override
  _$ChooseAccount copyWith({
    Object bank = freezed,
  }) {
    return _$ChooseAccount(
      bank == freezed ? this.bank : bank as BankInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseAccount(bank);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseAccount != null) {
      return chooseAccount(bank);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return chooseAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (chooseAccount != null) {
      return chooseAccount(this);
    }
    return orElse();
  }
}

abstract class ChooseAccount implements WithdrawalFormEvent {
  const factory ChooseAccount(BankInfo bank) = _$ChooseAccount;

  BankInfo get bank;

  ChooseAccount copyWith({BankInfo bank});
}

class _$OTPChanged implements OTPChanged {
  const _$OTPChanged(this.otp) : assert(otp != null);

  @override
  final String otp;

  @override
  String toString() {
    return 'WithdrawalFormEvent.otpChanged(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OTPChanged &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @override
  _$OTPChanged copyWith({
    Object otp = freezed,
  }) {
    return _$OTPChanged(
      otp == freezed ? this.otp : otp as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return otpChanged(otp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (otpChanged != null) {
      return otpChanged(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return otpChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (otpChanged != null) {
      return otpChanged(this);
    }
    return orElse();
  }
}

abstract class OTPChanged implements WithdrawalFormEvent {
  const factory OTPChanged(String otp) = _$OTPChanged;

  String get otp;

  OTPChanged copyWith({String otp});
}

class _$SendOTP implements SendOTP {
  const _$SendOTP(this.phoneNumber) : assert(phoneNumber != null);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'WithdrawalFormEvent.sendOTP(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @override
  _$SendOTP copyWith({
    Object phoneNumber = freezed,
  }) {
    return _$SendOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return sendOTP(phoneNumber);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return sendOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendOTP != null) {
      return sendOTP(this);
    }
    return orElse();
  }
}

abstract class SendOTP implements WithdrawalFormEvent {
  const factory SendOTP(String phoneNumber) = _$SendOTP;

  String get phoneNumber;

  SendOTP copyWith({String phoneNumber});
}

class _$ValidateOTP implements ValidateOTP {
  const _$ValidateOTP(this.phoneNumber, this.otp)
      : assert(phoneNumber != null),
        assert(otp != null);

  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'WithdrawalFormEvent.validateOTP(phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateOTP &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp);

  @override
  _$ValidateOTP copyWith({
    Object phoneNumber = freezed,
    Object otp = freezed,
  }) {
    return _$ValidateOTP(
      phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      otp == freezed ? this.otp : otp as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return validateOTP(phoneNumber, otp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(phoneNumber, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return validateOTP(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (validateOTP != null) {
      return validateOTP(this);
    }
    return orElse();
  }
}

abstract class ValidateOTP implements WithdrawalFormEvent {
  const factory ValidateOTP(String phoneNumber, String otp) = _$ValidateOTP;

  String get phoneNumber;
  String get otp;

  ValidateOTP copyWith({String phoneNumber, String otp});
}

class _$ConfirmHolder implements ConfirmHolder {
  const _$ConfirmHolder(this.confirmed) : assert(confirmed != null);

  @override
  final bool confirmed;

  @override
  String toString() {
    return 'WithdrawalFormEvent.confirmHolder(confirmed: $confirmed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmHolder &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(confirmed);

  @override
  _$ConfirmHolder copyWith({
    Object confirmed = freezed,
  }) {
    return _$ConfirmHolder(
      confirmed == freezed ? this.confirmed : confirmed as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return confirmHolder(confirmed);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmHolder != null) {
      return confirmHolder(confirmed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return confirmHolder(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmHolder != null) {
      return confirmHolder(this);
    }
    return orElse();
  }
}

abstract class ConfirmHolder implements WithdrawalFormEvent {
  const factory ConfirmHolder(bool confirmed) = _$ConfirmHolder;

  bool get confirmed;

  ConfirmHolder copyWith({bool confirmed});
}

class _$WithdrawalAll implements WithdrawalAll {
  const _$WithdrawalAll(this.bankAccountId, this.isValidDeleteDebit,
      this.isValidDeleteGoal, this.isValidReCalculateDebits)
      : assert(bankAccountId != null),
        assert(isValidDeleteDebit != null),
        assert(isValidDeleteGoal != null),
        assert(isValidReCalculateDebits != null);

  @override
  final String bankAccountId;
  @override
  final bool isValidDeleteDebit;
  @override
  final bool isValidDeleteGoal;
  @override
  final bool isValidReCalculateDebits;

  @override
  String toString() {
    return 'WithdrawalFormEvent.withdrawalAll(bankAccountId: $bankAccountId, isValidDeleteDebit: $isValidDeleteDebit, isValidDeleteGoal: $isValidDeleteGoal, isValidReCalculateDebits: $isValidReCalculateDebits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WithdrawalAll &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.isValidDeleteDebit, isValidDeleteDebit) ||
                const DeepCollectionEquality()
                    .equals(other.isValidDeleteDebit, isValidDeleteDebit)) &&
            (identical(other.isValidDeleteGoal, isValidDeleteGoal) ||
                const DeepCollectionEquality()
                    .equals(other.isValidDeleteGoal, isValidDeleteGoal)) &&
            (identical(
                    other.isValidReCalculateDebits, isValidReCalculateDebits) ||
                const DeepCollectionEquality().equals(
                    other.isValidReCalculateDebits, isValidReCalculateDebits)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(isValidDeleteDebit) ^
      const DeepCollectionEquality().hash(isValidDeleteGoal) ^
      const DeepCollectionEquality().hash(isValidReCalculateDebits);

  @override
  _$WithdrawalAll copyWith({
    Object bankAccountId = freezed,
    Object isValidDeleteDebit = freezed,
    Object isValidDeleteGoal = freezed,
    Object isValidReCalculateDebits = freezed,
  }) {
    return _$WithdrawalAll(
      bankAccountId == freezed ? this.bankAccountId : bankAccountId as String,
      isValidDeleteDebit == freezed
          ? this.isValidDeleteDebit
          : isValidDeleteDebit as bool,
      isValidDeleteGoal == freezed
          ? this.isValidDeleteGoal
          : isValidDeleteGoal as bool,
      isValidReCalculateDebits == freezed
          ? this.isValidReCalculateDebits
          : isValidReCalculateDebits as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return withdrawalAll(bankAccountId, isValidDeleteDebit, isValidDeleteGoal,
        isValidReCalculateDebits);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalAll != null) {
      return withdrawalAll(bankAccountId, isValidDeleteDebit, isValidDeleteGoal,
          isValidReCalculateDebits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return withdrawalAll(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalAll != null) {
      return withdrawalAll(this);
    }
    return orElse();
  }
}

abstract class WithdrawalAll implements WithdrawalFormEvent {
  const factory WithdrawalAll(String bankAccountId, bool isValidDeleteDebit,
      bool isValidDeleteGoal, bool isValidReCalculateDebits) = _$WithdrawalAll;

  String get bankAccountId;
  bool get isValidDeleteDebit;
  bool get isValidDeleteGoal;
  bool get isValidReCalculateDebits;

  WithdrawalAll copyWith(
      {String bankAccountId,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal,
      bool isValidReCalculateDebits});
}

class _$WithdrawalParcial implements WithdrawalParcial {
  const _$WithdrawalParcial(this.valuesChosen, this.bankAccountId, this.goals,
      this.totalValue, this.isValidDeleteDebit, this.isValidDeleteGoal)
      : assert(valuesChosen != null),
        assert(bankAccountId != null),
        assert(goals != null),
        assert(totalValue != null),
        assert(isValidDeleteDebit != null),
        assert(isValidDeleteGoal != null);

  @override
  final List<double> valuesChosen;
  @override
  final String bankAccountId;
  @override
  final List<DashboardGoal> goals;
  @override
  final double totalValue;
  @override
  final bool isValidDeleteDebit;
  @override
  final bool isValidDeleteGoal;

  @override
  String toString() {
    return 'WithdrawalFormEvent.withdrawalParcial(valuesChosen: $valuesChosen, bankAccountId: $bankAccountId, goals: $goals, totalValue: $totalValue, isValidDeleteDebit: $isValidDeleteDebit, isValidDeleteGoal: $isValidDeleteGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WithdrawalParcial &&
            (identical(other.valuesChosen, valuesChosen) ||
                const DeepCollectionEquality()
                    .equals(other.valuesChosen, valuesChosen)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)) &&
            (identical(other.totalValue, totalValue) ||
                const DeepCollectionEquality()
                    .equals(other.totalValue, totalValue)) &&
            (identical(other.isValidDeleteDebit, isValidDeleteDebit) ||
                const DeepCollectionEquality()
                    .equals(other.isValidDeleteDebit, isValidDeleteDebit)) &&
            (identical(other.isValidDeleteGoal, isValidDeleteGoal) ||
                const DeepCollectionEquality()
                    .equals(other.isValidDeleteGoal, isValidDeleteGoal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(valuesChosen) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(goals) ^
      const DeepCollectionEquality().hash(totalValue) ^
      const DeepCollectionEquality().hash(isValidDeleteDebit) ^
      const DeepCollectionEquality().hash(isValidDeleteGoal);

  @override
  _$WithdrawalParcial copyWith({
    Object valuesChosen = freezed,
    Object bankAccountId = freezed,
    Object goals = freezed,
    Object totalValue = freezed,
    Object isValidDeleteDebit = freezed,
    Object isValidDeleteGoal = freezed,
  }) {
    return _$WithdrawalParcial(
      valuesChosen == freezed
          ? this.valuesChosen
          : valuesChosen as List<double>,
      bankAccountId == freezed ? this.bankAccountId : bankAccountId as String,
      goals == freezed ? this.goals : goals as List<DashboardGoal>,
      totalValue == freezed ? this.totalValue : totalValue as double,
      isValidDeleteDebit == freezed
          ? this.isValidDeleteDebit
          : isValidDeleteDebit as bool,
      isValidDeleteGoal == freezed
          ? this.isValidDeleteGoal
          : isValidDeleteGoal as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return withdrawalParcial(valuesChosen, bankAccountId, goals, totalValue,
        isValidDeleteDebit, isValidDeleteGoal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalParcial != null) {
      return withdrawalParcial(valuesChosen, bankAccountId, goals, totalValue,
          isValidDeleteDebit, isValidDeleteGoal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return withdrawalParcial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (withdrawalParcial != null) {
      return withdrawalParcial(this);
    }
    return orElse();
  }
}

abstract class WithdrawalParcial implements WithdrawalFormEvent {
  const factory WithdrawalParcial(
      List<double> valuesChosen,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal) = _$WithdrawalParcial;

  List<double> get valuesChosen;
  String get bankAccountId;
  List<DashboardGoal> get goals;
  double get totalValue;
  bool get isValidDeleteDebit;
  bool get isValidDeleteGoal;

  WithdrawalParcial copyWith(
      {List<double> valuesChosen,
      String bankAccountId,
      List<DashboardGoal> goals,
      double totalValue,
      bool isValidDeleteDebit,
      bool isValidDeleteGoal});
}

class _$ConfirmWithdrawal implements ConfirmWithdrawal {
  const _$ConfirmWithdrawal(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.confirmWithdrawal(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmWithdrawal &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ConfirmWithdrawal copyWith({
    Object value = freezed,
  }) {
    return _$ConfirmWithdrawal(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return confirmWithdrawal(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmWithdrawal != null) {
      return confirmWithdrawal(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return confirmWithdrawal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmWithdrawal != null) {
      return confirmWithdrawal(this);
    }
    return orElse();
  }
}

abstract class ConfirmWithdrawal implements WithdrawalFormEvent {
  const factory ConfirmWithdrawal(bool value) = _$ConfirmWithdrawal;

  bool get value;

  ConfirmWithdrawal copyWith({bool value});
}

class _$ResetWithdraw implements ResetWithdraw {
  const _$ResetWithdraw(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.resetWithdraw(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ResetWithdraw &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ResetWithdraw copyWith({
    Object value = freezed,
  }) {
    return _$ResetWithdraw(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return resetWithdraw(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetWithdraw != null) {
      return resetWithdraw(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return resetWithdraw(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetWithdraw != null) {
      return resetWithdraw(this);
    }
    return orElse();
  }
}

abstract class ResetWithdraw implements WithdrawalFormEvent {
  const factory ResetWithdraw(bool value) = _$ResetWithdraw;

  bool get value;

  ResetWithdraw copyWith({bool value});
}

class _$DebitOptionChanged implements DebitOptionChanged {
  const _$DebitOptionChanged(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.debitOptionChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DebitOptionChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$DebitOptionChanged copyWith({
    Object value = freezed,
  }) {
    return _$DebitOptionChanged(
      value == freezed ? this.value : value as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return debitOptionChanged(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (debitOptionChanged != null) {
      return debitOptionChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return debitOptionChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (debitOptionChanged != null) {
      return debitOptionChanged(this);
    }
    return orElse();
  }
}

abstract class DebitOptionChanged implements WithdrawalFormEvent {
  const factory DebitOptionChanged(int value) = _$DebitOptionChanged;

  int get value;

  DebitOptionChanged copyWith({int value});
}

class _$GoalOptionChanged implements GoalOptionChanged {
  const _$GoalOptionChanged(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.goalOptionChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoalOptionChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$GoalOptionChanged copyWith({
    Object value = freezed,
  }) {
    return _$GoalOptionChanged(
      value == freezed ? this.value : value as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return goalOptionChanged(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (goalOptionChanged != null) {
      return goalOptionChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return goalOptionChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (goalOptionChanged != null) {
      return goalOptionChanged(this);
    }
    return orElse();
  }
}

abstract class GoalOptionChanged implements WithdrawalFormEvent {
  const factory GoalOptionChanged(int value) = _$GoalOptionChanged;

  int get value;

  GoalOptionChanged copyWith({int value});
}

class _$ShowModalDeleteGoalChanged implements ShowModalDeleteGoalChanged {
  const _$ShowModalDeleteGoalChanged(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.showModalDeleteGoalChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowModalDeleteGoalChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ShowModalDeleteGoalChanged copyWith({
    Object value = freezed,
  }) {
    return _$ShowModalDeleteGoalChanged(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showModalDeleteGoalChanged(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showModalDeleteGoalChanged != null) {
      return showModalDeleteGoalChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showModalDeleteGoalChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showModalDeleteGoalChanged != null) {
      return showModalDeleteGoalChanged(this);
    }
    return orElse();
  }
}

abstract class ShowModalDeleteGoalChanged implements WithdrawalFormEvent {
  const factory ShowModalDeleteGoalChanged(bool value) =
      _$ShowModalDeleteGoalChanged;

  bool get value;

  ShowModalDeleteGoalChanged copyWith({bool value});
}

class _$ShowModalReCalculateDebitsChanged
    implements ShowModalReCalculateDebitsChanged {
  const _$ShowModalReCalculateDebitsChanged(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.showModalReCalculateDebitsChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowModalReCalculateDebitsChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ShowModalReCalculateDebitsChanged copyWith({
    Object value = freezed,
  }) {
    return _$ShowModalReCalculateDebitsChanged(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showModalReCalculateDebitsChanged(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showModalReCalculateDebitsChanged != null) {
      return showModalReCalculateDebitsChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showModalReCalculateDebitsChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showModalReCalculateDebitsChanged != null) {
      return showModalReCalculateDebitsChanged(this);
    }
    return orElse();
  }
}

abstract class ShowModalReCalculateDebitsChanged
    implements WithdrawalFormEvent {
  const factory ShowModalReCalculateDebitsChanged(bool value) =
      _$ShowModalReCalculateDebitsChanged;

  bool get value;

  ShowModalReCalculateDebitsChanged copyWith({bool value});
}

class _$DeleteGoals implements DeleteGoals {
  const _$DeleteGoals(this.goals) : assert(goals != null);

  @override
  final List<DashboardGoal> goals;

  @override
  String toString() {
    return 'WithdrawalFormEvent.deleteGoals(goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteGoals &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goals);

  @override
  _$DeleteGoals copyWith({
    Object goals = freezed,
  }) {
    return _$DeleteGoals(
      goals == freezed ? this.goals : goals as List<DashboardGoal>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteGoals(goals);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoals != null) {
      return deleteGoals(goals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteGoals(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoals != null) {
      return deleteGoals(this);
    }
    return orElse();
  }
}

abstract class DeleteGoals implements WithdrawalFormEvent {
  const factory DeleteGoals(List<DashboardGoal> goals) = _$DeleteGoals;

  List<DashboardGoal> get goals;

  DeleteGoals copyWith({List<DashboardGoal> goals});
}

class _$DeleteDebits implements DeleteDebits {
  const _$DeleteDebits(this.debits) : assert(debits != null);

  @override
  final List<DebitInfo> debits;

  @override
  String toString() {
    return 'WithdrawalFormEvent.deleteDebits(debits: $debits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteDebits &&
            (identical(other.debits, debits) ||
                const DeepCollectionEquality().equals(other.debits, debits)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(debits);

  @override
  _$DeleteDebits copyWith({
    Object debits = freezed,
  }) {
    return _$DeleteDebits(
      debits == freezed ? this.debits : debits as List<DebitInfo>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteDebits(debits);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteDebits != null) {
      return deleteDebits(debits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteDebits(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteDebits != null) {
      return deleteDebits(this);
    }
    return orElse();
  }
}

abstract class DeleteDebits implements WithdrawalFormEvent {
  const factory DeleteDebits(List<DebitInfo> debits) = _$DeleteDebits;

  List<DebitInfo> get debits;

  DeleteDebits copyWith({List<DebitInfo> debits});
}

class _$DeleteGoal implements DeleteGoal {
  const _$DeleteGoal(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'WithdrawalFormEvent.deleteGoal(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$DeleteGoal copyWith({
    Object goal = freezed,
  }) {
    return _$DeleteGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteGoal(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoal != null) {
      return deleteGoal(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteGoal != null) {
      return deleteGoal(this);
    }
    return orElse();
  }
}

abstract class DeleteGoal implements WithdrawalFormEvent {
  const factory DeleteGoal(DashboardGoal goal) = _$DeleteGoal;

  DashboardGoal get goal;

  DeleteGoal copyWith({DashboardGoal goal});
}

class _$DeleteDebit implements DeleteDebit {
  const _$DeleteDebit(this.debit) : assert(debit != null);

  @override
  final DebitInfo debit;

  @override
  String toString() {
    return 'WithdrawalFormEvent.deleteDebit(debit: $debit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteDebit &&
            (identical(other.debit, debit) ||
                const DeepCollectionEquality().equals(other.debit, debit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(debit);

  @override
  _$DeleteDebit copyWith({
    Object debit = freezed,
  }) {
    return _$DeleteDebit(
      debit == freezed ? this.debit : debit as DebitInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteDebit(debit);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteDebit != null) {
      return deleteDebit(debit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return deleteDebit(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteDebit != null) {
      return deleteDebit(this);
    }
    return orElse();
  }
}

abstract class DeleteDebit implements WithdrawalFormEvent {
  const factory DeleteDebit(DebitInfo debit) = _$DeleteDebit;

  DebitInfo get debit;

  DeleteDebit copyWith({DebitInfo debit});
}

class _$ShowDialog implements ShowDialog {
  const _$ShowDialog(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.showDialog(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowDialog &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$ShowDialog copyWith({
    Object value = freezed,
  }) {
    return _$ShowDialog(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showDialog(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showDialog != null) {
      return showDialog(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return showDialog(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showDialog != null) {
      return showDialog(this);
    }
    return orElse();
  }
}

abstract class ShowDialog implements WithdrawalFormEvent {
  const factory ShowDialog(bool value) = _$ShowDialog;

  bool get value;

  ShowDialog copyWith({bool value});
}

class _$AlreadyShown implements AlreadyShown {
  const _$AlreadyShown(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.alreadyShown(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AlreadyShown &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$AlreadyShown copyWith({
    Object value = freezed,
  }) {
    return _$AlreadyShown(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return alreadyShown(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (alreadyShown != null) {
      return alreadyShown(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return alreadyShown(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (alreadyShown != null) {
      return alreadyShown(this);
    }
    return orElse();
  }
}

abstract class AlreadyShown implements WithdrawalFormEvent {
  const factory AlreadyShown(bool value) = _$AlreadyShown;

  bool get value;

  AlreadyShown copyWith({bool value});
}

class _$CheckBox implements CheckBox {
  const _$CheckBox(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.checkBox(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CheckBox &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$CheckBox copyWith({
    Object value = freezed,
  }) {
    return _$CheckBox(
      value == freezed ? this.value : value as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return checkBox(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkBox != null) {
      return checkBox(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return checkBox(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkBox != null) {
      return checkBox(this);
    }
    return orElse();
  }
}

abstract class CheckBox implements WithdrawalFormEvent {
  const factory CheckBox(bool value) = _$CheckBox;

  bool get value;

  CheckBox copyWith({bool value});
}

class _$AssignTo implements AssignTo {
  const _$AssignTo(this.goal) : assert(goal != null);

  @override
  final DashboardGoal goal;

  @override
  String toString() {
    return 'WithdrawalFormEvent.assignTo(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssignTo &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goal);

  @override
  _$AssignTo copyWith({
    Object goal = freezed,
  }) {
    return _$AssignTo(
      goal == freezed ? this.goal : goal as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignTo(goal);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignTo != null) {
      return assignTo(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignTo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignTo != null) {
      return assignTo(this);
    }
    return orElse();
  }
}

abstract class AssignTo implements WithdrawalFormEvent {
  const factory AssignTo(DashboardGoal goal) = _$AssignTo;

  DashboardGoal get goal;

  AssignTo copyWith({DashboardGoal goal});
}

class _$AssignFrom implements AssignFrom {
  const _$AssignFrom(this.goal, this.value)
      : assert(goal != null),
        assert(value != null);

  @override
  final DashboardGoal goal;
  @override
  final double value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.assignFrom(goal: $goal, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssignFrom &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$AssignFrom copyWith({
    Object goal = freezed,
    Object value = freezed,
  }) {
    return _$AssignFrom(
      goal == freezed ? this.goal : goal as DashboardGoal,
      value == freezed ? this.value : value as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignFrom(goal, value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignFrom != null) {
      return assignFrom(goal, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignFrom(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignFrom != null) {
      return assignFrom(this);
    }
    return orElse();
  }
}

abstract class AssignFrom implements WithdrawalFormEvent {
  const factory AssignFrom(DashboardGoal goal, double value) = _$AssignFrom;

  DashboardGoal get goal;
  double get value;

  AssignFrom copyWith({DashboardGoal goal, double value});
}

class _$AssignMoney implements AssignMoney {
  const _$AssignMoney(this.goalToAssign) : assert(goalToAssign != null);

  @override
  final DashboardGoal goalToAssign;

  @override
  String toString() {
    return 'WithdrawalFormEvent.assignMoney(goalToAssign: $goalToAssign)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AssignMoney &&
            (identical(other.goalToAssign, goalToAssign) ||
                const DeepCollectionEquality()
                    .equals(other.goalToAssign, goalToAssign)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goalToAssign);

  @override
  _$AssignMoney copyWith({
    Object goalToAssign = freezed,
  }) {
    return _$AssignMoney(
      goalToAssign == freezed
          ? this.goalToAssign
          : goalToAssign as DashboardGoal,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignMoney(goalToAssign);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignMoney != null) {
      return assignMoney(goalToAssign);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return assignMoney(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (assignMoney != null) {
      return assignMoney(this);
    }
    return orElse();
  }
}

abstract class AssignMoney implements WithdrawalFormEvent {
  const factory AssignMoney(DashboardGoal goalToAssign) = _$AssignMoney;

  DashboardGoal get goalToAssign;

  AssignMoney copyWith({DashboardGoal goalToAssign});
}

class _$GetSimulation implements GetSimulation {
  const _$GetSimulation(this.value) : assert(value != null);

  @override
  final double value;

  @override
  String toString() {
    return 'WithdrawalFormEvent.getSimulation(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetSimulation &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$GetSimulation copyWith({
    Object value = freezed,
  }) {
    return _$GetSimulation(
      value == freezed ? this.value : value as double,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result chooseWithdrawalType(int type),
    @required
        Result choosePopUpType(int rulePopUpType, double transactionValue),
    @required Result chooseGoal(DashboardGoal goal, double withdrawal),
    @required Result unChooseGoal(DashboardGoal goal),
    @required Result chooseAccount(BankInfo bank),
    @required Result otpChanged(String otp),
    @required Result sendOTP(String phoneNumber),
    @required Result validateOTP(String phoneNumber, String otp),
    @required Result confirmHolder(bool confirmed),
    @required
        Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
            bool isValidDeleteGoal, bool isValidReCalculateDebits),
    @required
        Result withdrawalParcial(
            List<double> valuesChosen,
            String bankAccountId,
            List<DashboardGoal> goals,
            double totalValue,
            bool isValidDeleteDebit,
            bool isValidDeleteGoal),
    @required Result confirmWithdrawal(bool value),
    @required Result resetWithdraw(bool value),
    @required Result debitOptionChanged(int value),
    @required Result goalOptionChanged(int value),
    @required Result showModalDeleteGoalChanged(bool value),
    @required Result showModalReCalculateDebitsChanged(bool value),
    @required Result deleteGoals(List<DashboardGoal> goals),
    @required Result deleteDebits(List<DebitInfo> debits),
    @required Result deleteGoal(DashboardGoal goal),
    @required Result deleteDebit(DebitInfo debit),
    @required Result showDialog(bool value),
    @required Result alreadyShown(bool value),
    @required Result checkBox(bool value),
    @required Result assignTo(DashboardGoal goal),
    @required Result assignFrom(DashboardGoal goal, double value),
    @required Result assignMoney(DashboardGoal goalToAssign),
    @required Result getSimulation(double value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return getSimulation(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result chooseWithdrawalType(int type),
    Result choosePopUpType(int rulePopUpType, double transactionValue),
    Result chooseGoal(DashboardGoal goal, double withdrawal),
    Result unChooseGoal(DashboardGoal goal),
    Result chooseAccount(BankInfo bank),
    Result otpChanged(String otp),
    Result sendOTP(String phoneNumber),
    Result validateOTP(String phoneNumber, String otp),
    Result confirmHolder(bool confirmed),
    Result withdrawalAll(String bankAccountId, bool isValidDeleteDebit,
        bool isValidDeleteGoal, bool isValidReCalculateDebits),
    Result withdrawalParcial(
        List<double> valuesChosen,
        String bankAccountId,
        List<DashboardGoal> goals,
        double totalValue,
        bool isValidDeleteDebit,
        bool isValidDeleteGoal),
    Result confirmWithdrawal(bool value),
    Result resetWithdraw(bool value),
    Result debitOptionChanged(int value),
    Result goalOptionChanged(int value),
    Result showModalDeleteGoalChanged(bool value),
    Result showModalReCalculateDebitsChanged(bool value),
    Result deleteGoals(List<DashboardGoal> goals),
    Result deleteDebits(List<DebitInfo> debits),
    Result deleteGoal(DashboardGoal goal),
    Result deleteDebit(DebitInfo debit),
    Result showDialog(bool value),
    Result alreadyShown(bool value),
    Result checkBox(bool value),
    Result assignTo(DashboardGoal goal),
    Result assignFrom(DashboardGoal goal, double value),
    Result assignMoney(DashboardGoal goalToAssign),
    Result getSimulation(double value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSimulation != null) {
      return getSimulation(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result chooseWithdrawalType(ChooseWithdrawalType value),
    @required Result choosePopUpType(ChoosePopUpType value),
    @required Result chooseGoal(ChooseGoal value),
    @required Result unChooseGoal(UnChooseGoal value),
    @required Result chooseAccount(ChooseAccount value),
    @required Result otpChanged(OTPChanged value),
    @required Result sendOTP(SendOTP value),
    @required Result validateOTP(ValidateOTP value),
    @required Result confirmHolder(ConfirmHolder value),
    @required Result withdrawalAll(WithdrawalAll value),
    @required Result withdrawalParcial(WithdrawalParcial value),
    @required Result confirmWithdrawal(ConfirmWithdrawal value),
    @required Result resetWithdraw(ResetWithdraw value),
    @required Result debitOptionChanged(DebitOptionChanged value),
    @required Result goalOptionChanged(GoalOptionChanged value),
    @required
        Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    @required
        Result showModalReCalculateDebitsChanged(
            ShowModalReCalculateDebitsChanged value),
    @required Result deleteGoals(DeleteGoals value),
    @required Result deleteDebits(DeleteDebits value),
    @required Result deleteGoal(DeleteGoal value),
    @required Result deleteDebit(DeleteDebit value),
    @required Result showDialog(ShowDialog value),
    @required Result alreadyShown(AlreadyShown value),
    @required Result checkBox(CheckBox value),
    @required Result assignTo(AssignTo value),
    @required Result assignFrom(AssignFrom value),
    @required Result assignMoney(AssignMoney value),
    @required Result getSimulation(GetSimulation value),
  }) {
    assert(chooseWithdrawalType != null);
    assert(choosePopUpType != null);
    assert(chooseGoal != null);
    assert(unChooseGoal != null);
    assert(chooseAccount != null);
    assert(otpChanged != null);
    assert(sendOTP != null);
    assert(validateOTP != null);
    assert(confirmHolder != null);
    assert(withdrawalAll != null);
    assert(withdrawalParcial != null);
    assert(confirmWithdrawal != null);
    assert(resetWithdraw != null);
    assert(debitOptionChanged != null);
    assert(goalOptionChanged != null);
    assert(showModalDeleteGoalChanged != null);
    assert(showModalReCalculateDebitsChanged != null);
    assert(deleteGoals != null);
    assert(deleteDebits != null);
    assert(deleteGoal != null);
    assert(deleteDebit != null);
    assert(showDialog != null);
    assert(alreadyShown != null);
    assert(checkBox != null);
    assert(assignTo != null);
    assert(assignFrom != null);
    assert(assignMoney != null);
    assert(getSimulation != null);
    return getSimulation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result chooseWithdrawalType(ChooseWithdrawalType value),
    Result choosePopUpType(ChoosePopUpType value),
    Result chooseGoal(ChooseGoal value),
    Result unChooseGoal(UnChooseGoal value),
    Result chooseAccount(ChooseAccount value),
    Result otpChanged(OTPChanged value),
    Result sendOTP(SendOTP value),
    Result validateOTP(ValidateOTP value),
    Result confirmHolder(ConfirmHolder value),
    Result withdrawalAll(WithdrawalAll value),
    Result withdrawalParcial(WithdrawalParcial value),
    Result confirmWithdrawal(ConfirmWithdrawal value),
    Result resetWithdraw(ResetWithdraw value),
    Result debitOptionChanged(DebitOptionChanged value),
    Result goalOptionChanged(GoalOptionChanged value),
    Result showModalDeleteGoalChanged(ShowModalDeleteGoalChanged value),
    Result showModalReCalculateDebitsChanged(
        ShowModalReCalculateDebitsChanged value),
    Result deleteGoals(DeleteGoals value),
    Result deleteDebits(DeleteDebits value),
    Result deleteGoal(DeleteGoal value),
    Result deleteDebit(DeleteDebit value),
    Result showDialog(ShowDialog value),
    Result alreadyShown(AlreadyShown value),
    Result checkBox(CheckBox value),
    Result assignTo(AssignTo value),
    Result assignFrom(AssignFrom value),
    Result assignMoney(AssignMoney value),
    Result getSimulation(GetSimulation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getSimulation != null) {
      return getSimulation(this);
    }
    return orElse();
  }
}

abstract class GetSimulation implements WithdrawalFormEvent {
  const factory GetSimulation(double value) = _$GetSimulation;

  double get value;

  GetSimulation copyWith({double value});
}

mixin _$WithdrawalFormState {
  int get withdrawalType;
  bool get isNextProcess;
  ValidarTransactionPopupInfo get popUpType;
  DashboardGoal get goalChosen;
  BankInfo get bankChosen;
  double get totalwithdrawal;
  bool get confirmedHolder;
  bool get confirmedWithdrawal;
  int get debitOptions;
  int get goalOptions;
  bool get showModalDeleteGoal;
  bool get showModalReCalculateDebits;
  OTP get otp;
  List<DashboardGoal> get goalsChosen;
  List<double> get ammountChosen;
  bool get isSubmitting;
  bool get isBelow;
  bool get alreadyShown;
  Map<int, bool> get alreadyChosen;
  DashboardGoal get goalToAssign;
  DashboardGoal get goalFromAssign;
  double get valueAssigned;
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  Option<Either<BaseFailure, bool>> get withdrawalAllOption;
  Option<Either<BaseFailure, bool>> get withdrawalParcialOption;
  Option<Either<BaseFailure, bool>> get deleteGoalOption;
  Option<Either<BaseFailure, bool>> get deleteDebitOption;
  Option<Either<BaseFailure, bool>> get deleteAllGoalsOption;
  Option<Either<BaseFailure, bool>> get deleteAllDebitsOption;
  bool get checkbox;
  Option<Either<BaseFailure, bool>> get assignMoneyOption;
  Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
      get responseSimulation;

  WithdrawalFormState copyWith(
      {int withdrawalType,
      bool isNextProcess,
      ValidarTransactionPopupInfo popUpType,
      DashboardGoal goalChosen,
      BankInfo bankChosen,
      double totalwithdrawal,
      bool confirmedHolder,
      bool confirmedWithdrawal,
      int debitOptions,
      int goalOptions,
      bool showModalDeleteGoal,
      bool showModalReCalculateDebits,
      OTP otp,
      List<DashboardGoal> goalsChosen,
      List<double> ammountChosen,
      bool isSubmitting,
      bool isBelow,
      bool alreadyShown,
      Map<int, bool> alreadyChosen,
      DashboardGoal goalToAssign,
      DashboardGoal goalFromAssign,
      double valueAssigned,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> withdrawalAllOption,
      Option<Either<BaseFailure, bool>> withdrawalParcialOption,
      Option<Either<BaseFailure, bool>> deleteGoalOption,
      Option<Either<BaseFailure, bool>> deleteDebitOption,
      Option<Either<BaseFailure, bool>> deleteAllGoalsOption,
      Option<Either<BaseFailure, bool>> deleteAllDebitsOption,
      bool checkbox,
      Option<Either<BaseFailure, bool>> assignMoneyOption,
      Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
          responseSimulation});
}

class _$WithdrawalFormStateTearOff {
  const _$WithdrawalFormStateTearOff();

  _WithdrawalFormState call(
      {int withdrawalType,
      bool isNextProcess,
      ValidarTransactionPopupInfo popUpType,
      DashboardGoal goalChosen,
      BankInfo bankChosen,
      double totalwithdrawal,
      bool confirmedHolder,
      bool confirmedWithdrawal,
      int debitOptions,
      int goalOptions,
      bool showModalDeleteGoal,
      bool showModalReCalculateDebits,
      OTP otp,
      List<DashboardGoal> goalsChosen,
      List<double> ammountChosen,
      bool isSubmitting,
      bool isBelow,
      bool alreadyShown,
      Map<int, bool> alreadyChosen,
      DashboardGoal goalToAssign,
      DashboardGoal goalFromAssign,
      double valueAssigned,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> withdrawalAllOption,
      Option<Either<BaseFailure, bool>> withdrawalParcialOption,
      Option<Either<BaseFailure, bool>> deleteGoalOption,
      Option<Either<BaseFailure, bool>> deleteDebitOption,
      Option<Either<BaseFailure, bool>> deleteAllGoalsOption,
      Option<Either<BaseFailure, bool>> deleteAllDebitsOption,
      bool checkbox,
      Option<Either<BaseFailure, bool>> assignMoneyOption,
      Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
          responseSimulation}) {
    return _WithdrawalFormState(
      withdrawalType: withdrawalType,
      isNextProcess: isNextProcess,
      popUpType: popUpType,
      goalChosen: goalChosen,
      bankChosen: bankChosen,
      totalwithdrawal: totalwithdrawal,
      confirmedHolder: confirmedHolder,
      confirmedWithdrawal: confirmedWithdrawal,
      debitOptions: debitOptions,
      goalOptions: goalOptions,
      showModalDeleteGoal: showModalDeleteGoal,
      showModalReCalculateDebits: showModalReCalculateDebits,
      otp: otp,
      goalsChosen: goalsChosen,
      ammountChosen: ammountChosen,
      isSubmitting: isSubmitting,
      isBelow: isBelow,
      alreadyShown: alreadyShown,
      alreadyChosen: alreadyChosen,
      goalToAssign: goalToAssign,
      goalFromAssign: goalFromAssign,
      valueAssigned: valueAssigned,
      phoneConfirmedOption: phoneConfirmedOption,
      withdrawalAllOption: withdrawalAllOption,
      withdrawalParcialOption: withdrawalParcialOption,
      deleteGoalOption: deleteGoalOption,
      deleteDebitOption: deleteDebitOption,
      deleteAllGoalsOption: deleteAllGoalsOption,
      deleteAllDebitsOption: deleteAllDebitsOption,
      checkbox: checkbox,
      assignMoneyOption: assignMoneyOption,
      responseSimulation: responseSimulation,
    );
  }
}

const $WithdrawalFormState = _$WithdrawalFormStateTearOff();

class _$_WithdrawalFormState implements _WithdrawalFormState {
  const _$_WithdrawalFormState(
      {this.withdrawalType,
      this.isNextProcess,
      this.popUpType,
      this.goalChosen,
      this.bankChosen,
      this.totalwithdrawal,
      this.confirmedHolder,
      this.confirmedWithdrawal,
      this.debitOptions,
      this.goalOptions,
      this.showModalDeleteGoal,
      this.showModalReCalculateDebits,
      this.otp,
      this.goalsChosen,
      this.ammountChosen,
      this.isSubmitting,
      this.isBelow,
      this.alreadyShown,
      this.alreadyChosen,
      this.goalToAssign,
      this.goalFromAssign,
      this.valueAssigned,
      this.phoneConfirmedOption,
      this.withdrawalAllOption,
      this.withdrawalParcialOption,
      this.deleteGoalOption,
      this.deleteDebitOption,
      this.deleteAllGoalsOption,
      this.deleteAllDebitsOption,
      this.checkbox,
      this.assignMoneyOption,
      this.responseSimulation});

  @override
  final int withdrawalType;
  @override
  final bool isNextProcess;
  @override
  final ValidarTransactionPopupInfo popUpType;
  @override
  final DashboardGoal goalChosen;
  @override
  final BankInfo bankChosen;
  @override
  final double totalwithdrawal;
  @override
  final bool confirmedHolder;
  @override
  final bool confirmedWithdrawal;
  @override
  final int debitOptions;
  @override
  final int goalOptions;
  @override
  final bool showModalDeleteGoal;
  @override
  final bool showModalReCalculateDebits;
  @override
  final OTP otp;
  @override
  final List<DashboardGoal> goalsChosen;
  @override
  final List<double> ammountChosen;
  @override
  final bool isSubmitting;
  @override
  final bool isBelow;
  @override
  final bool alreadyShown;
  @override
  final Map<int, bool> alreadyChosen;
  @override
  final DashboardGoal goalToAssign;
  @override
  final DashboardGoal goalFromAssign;
  @override
  final double valueAssigned;
  @override
  final Option<Either<BaseFailure, bool>> phoneConfirmedOption;
  @override
  final Option<Either<BaseFailure, bool>> withdrawalAllOption;
  @override
  final Option<Either<BaseFailure, bool>> withdrawalParcialOption;
  @override
  final Option<Either<BaseFailure, bool>> deleteGoalOption;
  @override
  final Option<Either<BaseFailure, bool>> deleteDebitOption;
  @override
  final Option<Either<BaseFailure, bool>> deleteAllGoalsOption;
  @override
  final Option<Either<BaseFailure, bool>> deleteAllDebitsOption;
  @override
  final bool checkbox;
  @override
  final Option<Either<BaseFailure, bool>> assignMoneyOption;
  @override
  final Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
      responseSimulation;

  @override
  String toString() {
    return 'WithdrawalFormState(withdrawalType: $withdrawalType, isNextProcess: $isNextProcess, popUpType: $popUpType, goalChosen: $goalChosen, bankChosen: $bankChosen, totalwithdrawal: $totalwithdrawal, confirmedHolder: $confirmedHolder, confirmedWithdrawal: $confirmedWithdrawal, debitOptions: $debitOptions, goalOptions: $goalOptions, showModalDeleteGoal: $showModalDeleteGoal, showModalReCalculateDebits: $showModalReCalculateDebits, otp: $otp, goalsChosen: $goalsChosen, ammountChosen: $ammountChosen, isSubmitting: $isSubmitting, isBelow: $isBelow, alreadyShown: $alreadyShown, alreadyChosen: $alreadyChosen, goalToAssign: $goalToAssign, goalFromAssign: $goalFromAssign, valueAssigned: $valueAssigned, phoneConfirmedOption: $phoneConfirmedOption, withdrawalAllOption: $withdrawalAllOption, withdrawalParcialOption: $withdrawalParcialOption, deleteGoalOption: $deleteGoalOption, deleteDebitOption: $deleteDebitOption, deleteAllGoalsOption: $deleteAllGoalsOption, deleteAllDebitsOption: $deleteAllDebitsOption, checkbox: $checkbox, assignMoneyOption: $assignMoneyOption, responseSimulation: $responseSimulation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawalFormState &&
            (identical(other.withdrawalType, withdrawalType) ||
                const DeepCollectionEquality()
                    .equals(other.withdrawalType, withdrawalType)) &&
            (identical(other.isNextProcess, isNextProcess) ||
                const DeepCollectionEquality()
                    .equals(other.isNextProcess, isNextProcess)) &&
            (identical(other.popUpType, popUpType) ||
                const DeepCollectionEquality()
                    .equals(other.popUpType, popUpType)) &&
            (identical(other.goalChosen, goalChosen) ||
                const DeepCollectionEquality()
                    .equals(other.goalChosen, goalChosen)) &&
            (identical(other.bankChosen, bankChosen) ||
                const DeepCollectionEquality()
                    .equals(other.bankChosen, bankChosen)) &&
            (identical(other.totalwithdrawal, totalwithdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.totalwithdrawal, totalwithdrawal)) &&
            (identical(other.confirmedHolder, confirmedHolder) ||
                const DeepCollectionEquality()
                    .equals(other.confirmedHolder, confirmedHolder)) &&
            (identical(other.confirmedWithdrawal, confirmedWithdrawal) ||
                const DeepCollectionEquality()
                    .equals(other.confirmedWithdrawal, confirmedWithdrawal)) &&
            (identical(other.debitOptions, debitOptions) ||
                const DeepCollectionEquality()
                    .equals(other.debitOptions, debitOptions)) &&
            (identical(other.goalOptions, goalOptions) ||
                const DeepCollectionEquality()
                    .equals(other.goalOptions, goalOptions)) &&
            (identical(other.showModalDeleteGoal, showModalDeleteGoal) ||
                const DeepCollectionEquality()
                    .equals(other.showModalDeleteGoal, showModalDeleteGoal)) &&
            (identical(other.showModalReCalculateDebits, showModalReCalculateDebits) ||
                const DeepCollectionEquality().equals(
                    other.showModalReCalculateDebits,
                    showModalReCalculateDebits)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.goalsChosen, goalsChosen) ||
                const DeepCollectionEquality()
                    .equals(other.goalsChosen, goalsChosen)) &&
            (identical(other.ammountChosen, ammountChosen) ||
                const DeepCollectionEquality()
                    .equals(other.ammountChosen, ammountChosen)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isBelow, isBelow) ||
                const DeepCollectionEquality()
                    .equals(other.isBelow, isBelow)) &&
            (identical(other.alreadyShown, alreadyShown) ||
                const DeepCollectionEquality()
                    .equals(other.alreadyShown, alreadyShown)) &&
            (identical(other.alreadyChosen, alreadyChosen) ||
                const DeepCollectionEquality()
                    .equals(other.alreadyChosen, alreadyChosen)) &&
            (identical(other.goalToAssign, goalToAssign) ||
                const DeepCollectionEquality()
                    .equals(other.goalToAssign, goalToAssign)) &&
            (identical(other.goalFromAssign, goalFromAssign) || const DeepCollectionEquality().equals(other.goalFromAssign, goalFromAssign)) &&
            (identical(other.valueAssigned, valueAssigned) || const DeepCollectionEquality().equals(other.valueAssigned, valueAssigned)) &&
            (identical(other.phoneConfirmedOption, phoneConfirmedOption) || const DeepCollectionEquality().equals(other.phoneConfirmedOption, phoneConfirmedOption)) &&
            (identical(other.withdrawalAllOption, withdrawalAllOption) || const DeepCollectionEquality().equals(other.withdrawalAllOption, withdrawalAllOption)) &&
            (identical(other.withdrawalParcialOption, withdrawalParcialOption) || const DeepCollectionEquality().equals(other.withdrawalParcialOption, withdrawalParcialOption)) &&
            (identical(other.deleteGoalOption, deleteGoalOption) || const DeepCollectionEquality().equals(other.deleteGoalOption, deleteGoalOption)) &&
            (identical(other.deleteDebitOption, deleteDebitOption) || const DeepCollectionEquality().equals(other.deleteDebitOption, deleteDebitOption)) &&
            (identical(other.deleteAllGoalsOption, deleteAllGoalsOption) || const DeepCollectionEquality().equals(other.deleteAllGoalsOption, deleteAllGoalsOption)) &&
            (identical(other.deleteAllDebitsOption, deleteAllDebitsOption) || const DeepCollectionEquality().equals(other.deleteAllDebitsOption, deleteAllDebitsOption)) &&
            (identical(other.checkbox, checkbox) || const DeepCollectionEquality().equals(other.checkbox, checkbox)) &&
            (identical(other.assignMoneyOption, assignMoneyOption) || const DeepCollectionEquality().equals(other.assignMoneyOption, assignMoneyOption)) &&
            (identical(other.responseSimulation, responseSimulation) || const DeepCollectionEquality().equals(other.responseSimulation, responseSimulation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(withdrawalType) ^
      const DeepCollectionEquality().hash(isNextProcess) ^
      const DeepCollectionEquality().hash(popUpType) ^
      const DeepCollectionEquality().hash(goalChosen) ^
      const DeepCollectionEquality().hash(bankChosen) ^
      const DeepCollectionEquality().hash(totalwithdrawal) ^
      const DeepCollectionEquality().hash(confirmedHolder) ^
      const DeepCollectionEquality().hash(confirmedWithdrawal) ^
      const DeepCollectionEquality().hash(debitOptions) ^
      const DeepCollectionEquality().hash(goalOptions) ^
      const DeepCollectionEquality().hash(showModalDeleteGoal) ^
      const DeepCollectionEquality().hash(showModalReCalculateDebits) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(goalsChosen) ^
      const DeepCollectionEquality().hash(ammountChosen) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isBelow) ^
      const DeepCollectionEquality().hash(alreadyShown) ^
      const DeepCollectionEquality().hash(alreadyChosen) ^
      const DeepCollectionEquality().hash(goalToAssign) ^
      const DeepCollectionEquality().hash(goalFromAssign) ^
      const DeepCollectionEquality().hash(valueAssigned) ^
      const DeepCollectionEquality().hash(phoneConfirmedOption) ^
      const DeepCollectionEquality().hash(withdrawalAllOption) ^
      const DeepCollectionEquality().hash(withdrawalParcialOption) ^
      const DeepCollectionEquality().hash(deleteGoalOption) ^
      const DeepCollectionEquality().hash(deleteDebitOption) ^
      const DeepCollectionEquality().hash(deleteAllGoalsOption) ^
      const DeepCollectionEquality().hash(deleteAllDebitsOption) ^
      const DeepCollectionEquality().hash(checkbox) ^
      const DeepCollectionEquality().hash(assignMoneyOption) ^
      const DeepCollectionEquality().hash(responseSimulation);

  @override
  _$_WithdrawalFormState copyWith({
    Object withdrawalType = freezed,
    Object isNextProcess = freezed,
    Object popUpType = freezed,
    Object goalChosen = freezed,
    Object bankChosen = freezed,
    Object totalwithdrawal = freezed,
    Object confirmedHolder = freezed,
    Object confirmedWithdrawal = freezed,
    Object debitOptions = freezed,
    Object goalOptions = freezed,
    Object showModalDeleteGoal = freezed,
    Object showModalReCalculateDebits = freezed,
    Object otp = freezed,
    Object goalsChosen = freezed,
    Object ammountChosen = freezed,
    Object isSubmitting = freezed,
    Object isBelow = freezed,
    Object alreadyShown = freezed,
    Object alreadyChosen = freezed,
    Object goalToAssign = freezed,
    Object goalFromAssign = freezed,
    Object valueAssigned = freezed,
    Object phoneConfirmedOption = freezed,
    Object withdrawalAllOption = freezed,
    Object withdrawalParcialOption = freezed,
    Object deleteGoalOption = freezed,
    Object deleteDebitOption = freezed,
    Object deleteAllGoalsOption = freezed,
    Object deleteAllDebitsOption = freezed,
    Object checkbox = freezed,
    Object assignMoneyOption = freezed,
    Object responseSimulation = freezed,
  }) {
    return _$_WithdrawalFormState(
      withdrawalType: withdrawalType == freezed
          ? this.withdrawalType
          : withdrawalType as int,
      isNextProcess:
          isNextProcess == freezed ? this.isNextProcess : isNextProcess as bool,
      popUpType: popUpType == freezed
          ? this.popUpType
          : popUpType as ValidarTransactionPopupInfo,
      goalChosen:
          goalChosen == freezed ? this.goalChosen : goalChosen as DashboardGoal,
      bankChosen:
          bankChosen == freezed ? this.bankChosen : bankChosen as BankInfo,
      totalwithdrawal: totalwithdrawal == freezed
          ? this.totalwithdrawal
          : totalwithdrawal as double,
      confirmedHolder: confirmedHolder == freezed
          ? this.confirmedHolder
          : confirmedHolder as bool,
      confirmedWithdrawal: confirmedWithdrawal == freezed
          ? this.confirmedWithdrawal
          : confirmedWithdrawal as bool,
      debitOptions:
          debitOptions == freezed ? this.debitOptions : debitOptions as int,
      goalOptions:
          goalOptions == freezed ? this.goalOptions : goalOptions as int,
      showModalDeleteGoal: showModalDeleteGoal == freezed
          ? this.showModalDeleteGoal
          : showModalDeleteGoal as bool,
      showModalReCalculateDebits: showModalReCalculateDebits == freezed
          ? this.showModalReCalculateDebits
          : showModalReCalculateDebits as bool,
      otp: otp == freezed ? this.otp : otp as OTP,
      goalsChosen: goalsChosen == freezed
          ? this.goalsChosen
          : goalsChosen as List<DashboardGoal>,
      ammountChosen: ammountChosen == freezed
          ? this.ammountChosen
          : ammountChosen as List<double>,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      isBelow: isBelow == freezed ? this.isBelow : isBelow as bool,
      alreadyShown:
          alreadyShown == freezed ? this.alreadyShown : alreadyShown as bool,
      alreadyChosen: alreadyChosen == freezed
          ? this.alreadyChosen
          : alreadyChosen as Map<int, bool>,
      goalToAssign: goalToAssign == freezed
          ? this.goalToAssign
          : goalToAssign as DashboardGoal,
      goalFromAssign: goalFromAssign == freezed
          ? this.goalFromAssign
          : goalFromAssign as DashboardGoal,
      valueAssigned: valueAssigned == freezed
          ? this.valueAssigned
          : valueAssigned as double,
      phoneConfirmedOption: phoneConfirmedOption == freezed
          ? this.phoneConfirmedOption
          : phoneConfirmedOption as Option<Either<BaseFailure, bool>>,
      withdrawalAllOption: withdrawalAllOption == freezed
          ? this.withdrawalAllOption
          : withdrawalAllOption as Option<Either<BaseFailure, bool>>,
      withdrawalParcialOption: withdrawalParcialOption == freezed
          ? this.withdrawalParcialOption
          : withdrawalParcialOption as Option<Either<BaseFailure, bool>>,
      deleteGoalOption: deleteGoalOption == freezed
          ? this.deleteGoalOption
          : deleteGoalOption as Option<Either<BaseFailure, bool>>,
      deleteDebitOption: deleteDebitOption == freezed
          ? this.deleteDebitOption
          : deleteDebitOption as Option<Either<BaseFailure, bool>>,
      deleteAllGoalsOption: deleteAllGoalsOption == freezed
          ? this.deleteAllGoalsOption
          : deleteAllGoalsOption as Option<Either<BaseFailure, bool>>,
      deleteAllDebitsOption: deleteAllDebitsOption == freezed
          ? this.deleteAllDebitsOption
          : deleteAllDebitsOption as Option<Either<BaseFailure, bool>>,
      checkbox: checkbox == freezed ? this.checkbox : checkbox as bool,
      assignMoneyOption: assignMoneyOption == freezed
          ? this.assignMoneyOption
          : assignMoneyOption as Option<Either<BaseFailure, bool>>,
      responseSimulation: responseSimulation == freezed
          ? this.responseSimulation
          : responseSimulation
              as Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>,
    );
  }
}

abstract class _WithdrawalFormState implements WithdrawalFormState {
  const factory _WithdrawalFormState(
      {int withdrawalType,
      bool isNextProcess,
      ValidarTransactionPopupInfo popUpType,
      DashboardGoal goalChosen,
      BankInfo bankChosen,
      double totalwithdrawal,
      bool confirmedHolder,
      bool confirmedWithdrawal,
      int debitOptions,
      int goalOptions,
      bool showModalDeleteGoal,
      bool showModalReCalculateDebits,
      OTP otp,
      List<DashboardGoal> goalsChosen,
      List<double> ammountChosen,
      bool isSubmitting,
      bool isBelow,
      bool alreadyShown,
      Map<int, bool> alreadyChosen,
      DashboardGoal goalToAssign,
      DashboardGoal goalFromAssign,
      double valueAssigned,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> withdrawalAllOption,
      Option<Either<BaseFailure, bool>> withdrawalParcialOption,
      Option<Either<BaseFailure, bool>> deleteGoalOption,
      Option<Either<BaseFailure, bool>> deleteDebitOption,
      Option<Either<BaseFailure, bool>> deleteAllGoalsOption,
      Option<Either<BaseFailure, bool>> deleteAllDebitsOption,
      bool checkbox,
      Option<Either<BaseFailure, bool>> assignMoneyOption,
      Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
          responseSimulation}) = _$_WithdrawalFormState;

  @override
  int get withdrawalType;
  @override
  bool get isNextProcess;
  @override
  ValidarTransactionPopupInfo get popUpType;
  @override
  DashboardGoal get goalChosen;
  @override
  BankInfo get bankChosen;
  @override
  double get totalwithdrawal;
  @override
  bool get confirmedHolder;
  @override
  bool get confirmedWithdrawal;
  @override
  int get debitOptions;
  @override
  int get goalOptions;
  @override
  bool get showModalDeleteGoal;
  @override
  bool get showModalReCalculateDebits;
  @override
  OTP get otp;
  @override
  List<DashboardGoal> get goalsChosen;
  @override
  List<double> get ammountChosen;
  @override
  bool get isSubmitting;
  @override
  bool get isBelow;
  @override
  bool get alreadyShown;
  @override
  Map<int, bool> get alreadyChosen;
  @override
  DashboardGoal get goalToAssign;
  @override
  DashboardGoal get goalFromAssign;
  @override
  double get valueAssigned;
  @override
  Option<Either<BaseFailure, bool>> get phoneConfirmedOption;
  @override
  Option<Either<BaseFailure, bool>> get withdrawalAllOption;
  @override
  Option<Either<BaseFailure, bool>> get withdrawalParcialOption;
  @override
  Option<Either<BaseFailure, bool>> get deleteGoalOption;
  @override
  Option<Either<BaseFailure, bool>> get deleteDebitOption;
  @override
  Option<Either<BaseFailure, bool>> get deleteAllGoalsOption;
  @override
  Option<Either<BaseFailure, bool>> get deleteAllDebitsOption;
  @override
  bool get checkbox;
  @override
  Option<Either<BaseFailure, bool>> get assignMoneyOption;
  @override
  Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
      get responseSimulation;

  @override
  _WithdrawalFormState copyWith(
      {int withdrawalType,
      bool isNextProcess,
      ValidarTransactionPopupInfo popUpType,
      DashboardGoal goalChosen,
      BankInfo bankChosen,
      double totalwithdrawal,
      bool confirmedHolder,
      bool confirmedWithdrawal,
      int debitOptions,
      int goalOptions,
      bool showModalDeleteGoal,
      bool showModalReCalculateDebits,
      OTP otp,
      List<DashboardGoal> goalsChosen,
      List<double> ammountChosen,
      bool isSubmitting,
      bool isBelow,
      bool alreadyShown,
      Map<int, bool> alreadyChosen,
      DashboardGoal goalToAssign,
      DashboardGoal goalFromAssign,
      double valueAssigned,
      Option<Either<BaseFailure, bool>> phoneConfirmedOption,
      Option<Either<BaseFailure, bool>> withdrawalAllOption,
      Option<Either<BaseFailure, bool>> withdrawalParcialOption,
      Option<Either<BaseFailure, bool>> deleteGoalOption,
      Option<Either<BaseFailure, bool>> deleteDebitOption,
      Option<Either<BaseFailure, bool>> deleteAllGoalsOption,
      Option<Either<BaseFailure, bool>> deleteAllDebitsOption,
      bool checkbox,
      Option<Either<BaseFailure, bool>> assignMoneyOption,
      Option<Either<BaseFailure, SimulateTransactionRemoveMoney>>
          responseSimulation});
}
