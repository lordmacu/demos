import 'dart:async';

import 'package:ualet/domain/core/values.dart';
import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/domain/withdrawalMX/simulate_transaction_remove_money.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/myaccount/value_objects.dart';
import 'package:ualet/domain/withdrawalMX/i_withdrawal_repository.dart';
import 'package:ualet/domain/withdrawalMX/value_objects.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/withdrawalMX/bank_info.dart';
import 'package:ualet/domain/withdrawalMX/validar_transaction_popup_info.dart';

part 'withdrawal_form_event.dart';
part 'withdrawal_form_state.dart';

part 'withdrawal_form_bloc.freezed.dart';

@injectable
class WithdrawalFormBloc
    extends Bloc<WithdrawalFormEvent, WithdrawalFormState> {
  final IWithdrawalRepository _withdrawalRepository;
  WithdrawalFormBloc(this._withdrawalRepository);
  @override
  Stream<WithdrawalFormState> mapEventToState(
    WithdrawalFormEvent event,
  ) async* {
    double min = getIt<IEnv>().isColombia() ? 10000.0 : Values.withdrawalCost;
    yield* event.map(
      chooseWithdrawalType: (e) async* {
        int type = e.type;
        yield state.copyWith(
          withdrawalType: type,
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      choosePopUpType: (e) async* {

        ValidarTransactionPopupInfo valuePopUpType = ValidarTransactionPopupInfo.empty();
        bool nextProcess = false;

        final responsePopUpType = await _withdrawalRepository.validateTransactionPopUpType(e.rulePopUpType, e.transactionValue);
        responsePopUpType.fold(
            (l) => {}, (r) {
              if(r.popUpType > 0 && r.result) {
                valuePopUpType = r;
              }
              nextProcess = true; 
        });

        yield state.copyWith(
          popUpType: valuePopUpType,
          isNextProcess: nextProcess
        );
      },
      chooseGoal: (e) async* {
        print({
          e.withdrawal,
          e.goal.currentAmt,
          min,
          validateWithdrawal(e.withdrawal, e.goal.currentAmt, min)
        });
        if (validateWithdrawal(e.withdrawal, e.goal.currentAmt, min)) {
          List goalsChosen = state.goalsChosen;
          List valuesChosen = state.ammountChosen;
          Map alreadyChosen = state.alreadyChosen;
          bool isAlreadyChosen = false;
          if (alreadyChosen.containsKey(e.goal.id)) {
            isAlreadyChosen = alreadyChosen[e.goal.id];
          }
          if (isAlreadyChosen) {
            for (int i = 0; i < goalsChosen.length; i++) {
              if (goalsChosen[i].id == e.goal.id) {
                valuesChosen[i] = e.withdrawal;
              }
            }
          } else {
            for (int i = 0; i < goalsChosen.length; i++) {
              if (goalsChosen[i].id == 0) {
                goalsChosen[i] = e.goal;
                valuesChosen[i] = e.withdrawal;
                alreadyChosen[e.goal.id] = true;
                break;
              }
            }
          }
          double total = valuesChosen.fold(0, (i, j) => i + j);
          yield state.copyWith(
            goalsChosen: goalsChosen,
            totalwithdrawal: total,
            ammountChosen: valuesChosen,
          );
        } else {
          List goalsChosen = state.goalsChosen;
          List valuesChosen = state.ammountChosen;
          Map alreadyChosen = state.alreadyChosen;
          if (alreadyChosen.containsKey(e.goal.id)) {
            alreadyChosen[e.goal.id] = false;
          }

          for (int i = 0; i < goalsChosen.length; i++) {
            if (goalsChosen[i].id == e.goal.id) {
              goalsChosen[i] = DashboardGoal.empty();
              valuesChosen[i] = 0.0;
            }
          }
          double total = valuesChosen.fold(0, (i, j) => i + j);

          yield state.copyWith(
            alreadyChosen: alreadyChosen,
            goalsChosen: goalsChosen,
            ammountChosen: valuesChosen,
            totalwithdrawal: total,
          );
        }
      },
      unChooseGoal: (e) async* {
        List goalsChosen = state.goalsChosen;
        List valuesChosen = state.ammountChosen;
        Map alreadyChosen = state.alreadyChosen;
        if (alreadyChosen.containsKey(e.goal.id)) {
          alreadyChosen[e.goal.id] = false;
        }
        for (int i = 0; i < goalsChosen.length; i++) {
          if (goalsChosen[i].id == e.goal.id) {
            goalsChosen[i] = DashboardGoal.empty();
            valuesChosen[i] = 0.0;
          }
        }

        double total = valuesChosen.fold(0, (i, j) => i + j);
        yield state.copyWith(
          alreadyChosen: alreadyChosen,
          ammountChosen: valuesChosen,
          goalsChosen: goalsChosen,
          totalwithdrawal: total,
        );
      },

      resetWithdraw: (e) async* {
        yield state.copyWith(
          withdrawalType: 3,
            isNextProcess:false
        );
    },
      chooseAccount: (e) async* {
        print("Choose Account: ${e.bank.bankAccountId}");
        if (state.bankChosen.bankAccountId == e.bank.bankAccountId) {
          yield state.copyWith(
            bankChosen: BankInfo.empty(),
          );
        } else {
          yield state.copyWith(
            bankChosen: e.bank,
            phoneConfirmedOption: none(),
            withdrawalParcialOption: none(),
            withdrawalAllOption: none(),
            deleteGoalOption: none(),
            deleteAllDebitsOption: none(),
            deleteDebitOption: none(),
            deleteAllGoalsOption: none(),
          );
        }
      },
      otpChanged: (e) async* {
        yield state.copyWith(
          otp: OTP(e.otp),
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      sendOTP: (e) async* {
        yield state.copyWith(isSubmitting: true);
        await _withdrawalRepository.sendOTP(e.phoneNumber);
        yield state.copyWith(
          isSubmitting: false,
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      validateOTP: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrValidated =
            await _withdrawalRepository.validateOTP(e.phoneNumber, e.otp);
        yield state.copyWith(
          isSubmitting: false,
          phoneConfirmedOption: some(failureOrValidated),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      confirmHolder: (e) async* {
        yield state.copyWith(
          confirmedHolder: e.confirmed,
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          phoneConfirmedOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      withdrawalAll: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
        );
        final failureOrWithdrawal = await _withdrawalRepository.withdrawalAll(
            e.bankAccountId,
            e.isValidDeleteDebit,
            e.isValidDeleteGoal,
            e.isValidReCalculateDebits);
        yield state.copyWith(
          isSubmitting: false,
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: some(failureOrWithdrawal),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      withdrawalParcial: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final failureOrWithdrawal =
            await _withdrawalRepository.withdrawalParcial(
                e.valuesChosen,
                e.bankAccountId,
                e.goals,
                e.totalValue,
                e.isValidDeleteDebit,
                e.isValidDeleteGoal);
        yield state.copyWith(
          isSubmitting: false,
          phoneConfirmedOption: none(),
          withdrawalAllOption: none(),
          withdrawalParcialOption: some(failureOrWithdrawal),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      confirmWithdrawal: (e) async* {
        yield state.copyWith(
          confirmedWithdrawal: e.value,
        );
      },
      debitOptionChanged: (e) async* {
        yield state.copyWith(debitOptions: e.value);
      },
      goalOptionChanged: (e) async* {
        yield state.copyWith(goalOptions: e.value);
      },
      showModalDeleteGoalChanged: (e) async* {
        yield state.copyWith(showModalDeleteGoal: e.value);
      },
      showModalReCalculateDebitsChanged: (e) async* {
        yield state.copyWith(showModalReCalculateDebits: e.value);
      },
      deleteGoals: (e) async* {
        var failureOrDeleted =
            await _withdrawalRepository.deleteAllGoals(e.goals);
        yield state.copyWith(
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: some(failureOrDeleted),
        );
      },
      deleteDebits: (e) async* {
        var failureOrDeleted =
            await _withdrawalRepository.deleteAllDebit(e.debits);
        yield state.copyWith(
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: some(failureOrDeleted),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
        );
      },
      deleteGoal: (e) async* {
        yield state.copyWith(isSubmitting: true);
        var failureOrDeleted = await _withdrawalRepository.deleteGoal(e.goal);
        yield state.copyWith(
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: some(failureOrDeleted),
          deleteAllDebitsOption: none(),
          deleteDebitOption: none(),
          deleteAllGoalsOption: none(),
          isSubmitting: false,
        );
      },
      deleteDebit: (e) async* {
        yield state.copyWith(isSubmitting: true);
        var failureOrDeleted = await _withdrawalRepository.deleteDebit(e.debit);
        yield state.copyWith(
          phoneConfirmedOption: none(),
          withdrawalParcialOption: none(),
          withdrawalAllOption: none(),
          deleteGoalOption: none(),
          deleteAllDebitsOption: none(),
          deleteDebitOption: some(failureOrDeleted),
          deleteAllGoalsOption: none(),
          isSubmitting: false,
        );
      },
      showDialog: (e) async* {
        yield state.copyWith(isBelow: e.value);
      },
      alreadyShown: (e) async* {
        yield state.copyWith(alreadyShown: e.value);
      },
      checkBox: (e) async* {
        yield state.copyWith(checkbox: e.value);
      },
      assignTo: (e) async* {
        yield state.copyWith(goalToAssign: e.goal);
      },
      assignFrom: (e) async* {
        yield state.copyWith(goalFromAssign: e.goal, valueAssigned: e.value);
      },
      assignMoney: (e) async* {

        yield state.copyWith(isSubmitting: true);
        var assignedOrFailure = await _withdrawalRepository.assignMoney(
            state.goalFromAssign, e.goalToAssign, state.valueAssigned);
        yield state.copyWith(assignMoneyOption: some(assignedOrFailure), isSubmitting: false, goalToAssign: e.goalToAssign);

      },
      getSimulation: (e) async* {

        yield state.copyWith(isSubmitting: true);
        var responseSimulation = await _withdrawalRepository.getSimulation(e.value);
        
        yield state.copyWith(
          isSubmitting: false,
          responseSimulation: some(responseSimulation)
        );
      },

    );
  }

  bool validateWithdrawal(double input, double goalValue, double min) {
    if (goalValue - input < min) {
      return false;
      // } else if (input < minMx) { //TODO: Check Country
    } else if (input < min) {
      return false;
    } else if (input <= 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  WithdrawalFormState get initialState => WithdrawalFormState.initial();
}
