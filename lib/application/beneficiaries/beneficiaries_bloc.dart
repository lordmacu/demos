import 'package:ualet/domain/beneficiaries/beneficiary_item.dart';
import 'package:ualet/domain/beneficiaries/i_beneficiaries_repo.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'beneficiaries_state.dart';
part 'beneficiaries_event.dart';

part 'beneficiaries_bloc.freezed.dart';

@injectable
class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  final IBeneficiariesRepo repo;

  BeneficiariesBloc(this.repo);
  @override
  // TODO: implement initialState
  BeneficiariesState get initialState => BeneficiariesState.initial();

  @override
  Stream<BeneficiariesState> mapEventToState(BeneficiariesEvent event) async* {
    yield* event.map(addBeneficiary: (_) async* {
      if (state.benficiaries.size < 3) {
        print("AddBeneficiary");
        final lst = state.benficiaries.toMutableList();
        lst.add(BeneficiaryItem.empty());
        yield state.copyWith(
          benficiaries: lst.toList(),
          postOrFailure: none(),
          error: '',
        );
      } else {
        print("AddBeneficiary ignored");
      }
    }, getBeneficiaries: (_) async* {
      yield state.copyWith(
        isLoading: true,
      );
      final result = await repo.getBeneficiaries();
      String error = '';
      KtList<BeneficiaryItem> list = KtList.from([BeneficiaryItem.empty()]);
      result.fold((l) {
        error = l.map(
            unexpected: (_) => "Error inesperado",
            fromServer: (e) => e.message);
      }, (r) => list = r);
      bool isUpdate = true;
      if (list.size == 0) {
        isUpdate = false;
        list = KtList.from([BeneficiaryItem.empty()]);
      }
      yield state.copyWith(
        benficiaries: list,
        error: error,
        isLoading: false,
        postOrFailure: none(),
        isUpdate: isUpdate,
      );
    }, editBeneficiary: (e) async* {
      print("Edit Beneficiary: ${e.index}");
      print(e.newItem);
      final lst = state.benficiaries.toMutableList();
      lst[e.index] = e.newItem;
      yield state.copyWith(
        benficiaries: lst.toList(),
        postOrFailure: none(),
        error: '',
      );
    }, removeBeneficiary: (e) async* {
      if (state.benficiaries.size > 0) {
        print("Remove Beneficiary: ${e.index}");
        final lst = state.benficiaries.toMutableList();
        final toRemove = lst.get(e.index);
        final lstDeleted = state.deleted.toMutableList();
        if (toRemove.id != -1) {
          lstDeleted.add(toRemove);
        }
        lst.remove(lst.get(e.index));
        yield state.copyWith(
          benficiaries: lst.toList(),
          deleted: lstDeleted.toList(),
          postOrFailure: none(),
          error: '',
        );
      } else {
        print("Remove ignored");
      }
    }, postBeneficiaries: (_) async* {
      yield state.copyWith(isLoading: true);
      final result =
          await repo.postBeneficiaries(state.benficiaries, state.deleted);
      yield state.copyWith(
        isLoading: false,
        error: '',
        postOrFailure: some(result),
      );
    });
  }

  bool isPercentageComplete() {
    double percentage = 0;
    state.benficiaries.forEach((element) {
      percentage += element.percentage;
    });
    print(percentage);
    return percentage == 100;
  }

  bool isButtonActive() {
    bool r = true;
    state.benficiaries.forEach((element) {
      if (element.name == '' ||
          element.number == '' ||
          element.number.length != 10) r = false;
    });
    return isPercentageComplete() && r;
  }
}
