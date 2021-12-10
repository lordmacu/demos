import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/terms/i_terms_repository.dart';

part 'terms_event.dart';
part 'terms_state.dart';

part 'terms_bloc.freezed.dart';

@injectable
class TermsBloc extends Bloc<TermsEvent, TermsState> {
  final ITermsRepository _termsRepository;

  TermsBloc(this._termsRepository);

  StreamSubscription<Either<BaseFailure, String>> _termsStreamSubscription;

  @override
  TermsState get initialState => TermsState.initial();

  @override
  Stream<TermsState> mapEventToState(
    TermsEvent event,
  ) async* {
    yield* event.map(getTermsItems: (e) async* {
      yield const TermsState.loadInProgress();
      await _termsStreamSubscription?.cancel();
      _termsStreamSubscription = _termsRepository
          .getTerms()
          .listen((items) => add(TermsEvent.termsItemsreceived(items)));
    }, termsItemsreceived: (e) async* {
      yield e.failureOrItem.fold(
        (f) => TermsState.loadFailure(f),
        (items) => TermsState.loadSuccess(items),
      );
    });
  }

  @override
  Future<void> close() async {
    await _termsStreamSubscription.cancel();
    return super.close();
  }
}
