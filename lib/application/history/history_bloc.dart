import 'dart:async';

import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/history/i_history_repository.dart';
import 'package:ualet/domain/history/profitability_item.dart';
import 'package:ualet/domain/history/transaction_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final IHistoryRepository _historyRepository;

  HistoryBloc(this._historyRepository);

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* event.map(
      getTransactions: (e) async* {
        yield HistoryState.loadInProgress();

        var grapTransactionsOrFailure =
            await _historyRepository.getGraphTransactions(e.valuePeriocity);

        var profitabilitiesOrFailure =
            await _historyRepository.getProfitability();

        add(HistoryEvent.transactionsReceived(
          profitabilitiesOrFailure,
          grapTransactionsOrFailure,
        ));
      },
      transactionsReceived: (e) async* {
        yield e.profitabilitiesOrFailure.fold(
          (profitabilitiyFailure) =>
              HistoryState.loadFailure(profitabilitiyFailure),
          (profitabilities) {
            return e.graphTransactionsOrFailure.fold(
                (failure) => HistoryState.loadFailure(failure),
                (graphTransactions) =>
                    LoadSuccess(profitabilities, graphTransactions));
          },
        );
      },
    );
  }

  @override
  HistoryState get initialState => HistoryState.initial();
}
