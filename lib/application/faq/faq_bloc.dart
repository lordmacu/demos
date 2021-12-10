import 'dart:async';

import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/faq/i_faq_repository.dart';
import 'package:ualet/domain/faq/faq_item.dart';

part 'faq_event.dart';
part 'faq_state.dart';

part 'faq_bloc.freezed.dart';

@injectable
class FAQBloc extends Bloc<FAQEvent, FAQState> {
  final IFAQRepository _faqRepository;

  FAQBloc(this._faqRepository);

  @override
  FAQState get initialState => FAQState.initial();

  @override
  Stream<FAQState> mapEventToState(
    FAQEvent event,
  ) async* {
    yield* event.map(getFAQItems: (e) async* {
      yield const FAQState.loadInProgress();

      var failureOrItems = await _faqRepository.getFAQItems();

      var profileOrFailure = await _faqRepository.getProfile();

      add(FAQEvent.faqItemsReceived(failureOrItems, profileOrFailure));
    }, faqItemsReceived: (e) async* {
      yield e.failureOrItems.fold(
        (f) => FAQState.loadFailure(f),
        (items) {
          return e.profileOrFailure.fold(
            (failure) => FAQState.loadFailure(failure),
            (profile) => FAQState.loadSuccess(items, profile),
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
