import 'dart:async';

import 'package:ualet/domain/extract/Extract_item.dart';
import 'package:ualet/domain/extract/i_extract_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';

part 'extract_event.dart';
part 'extract_state.dart';
part 'extract_bloc.freezed.dart';

@injectable
class ExtractBloc extends Bloc<ExtractEvent, ExtractState> {
  final IExtractsRepository _extractRepository;

  ExtractBloc(this._extractRepository);

  StreamSubscription<Either<BaseFailure, KtList<ExtractItem>>>
      _extractStreamSubscription;

  @override
  ExtractState get initialState => ExtractState.initial();

  @override
  Stream<ExtractState> mapEventToState(
    ExtractEvent event,
  ) async* {
    yield* event.map(getExtractItems: (e) async* {
      yield const ExtractState.loadInProgress();
      await _extractStreamSubscription?.cancel();

      var responsecertificates = await _extractRepository.getCertifications();
      var responseExtracts = await _extractRepository.getExtracts();

      add(ExtractEvent.extractItemsReceived(
          responseExtracts, responsecertificates));
    }, extractItemsReceived: (e) async* {
      yield e.failureOrItems.fold((f) => ExtractState.loadFailure(f), (items) {
        return e.failureOrItemsCertificate.fold(
            (failure) => ExtractState.loadFailure(failure),
            (itemsCertificates) =>
                ExtractState.loadSuccess(items.sortedBy((i) => i.order), itemsCertificates.sortedBy((i) => i.order)));
      });
    }, generateExtract: (e) async* {
      print("GenerateExtract: ${e.month}");
      final response =
          await _extractRepository.requestExtracts(e.year, e.month).first;
    }, generateCertificate: (e) async* {
      print("GenerateExtract: ${e.month}");
      final response =
          await _extractRepository.requestExtracts(e.year, e.month).first;
    });
  }

  @override
  Future<void> close() async {
    await _extractStreamSubscription.cancel();
    return super.close();
  }
}
