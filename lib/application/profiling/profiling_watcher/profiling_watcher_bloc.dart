import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/profiling/i_profiling_mx_repository.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';

part 'profiling_watcher_event.dart';
part 'profiling_watcher_state.dart';

part 'profiling_watcher_bloc.freezed.dart';

@injectable
class ProfilingWatcherBloc
    extends Bloc<ProfilingWatcherEvent, ProfilingWatcherState> {
  final IProfilingMxRepository _profilingRepository;

  ProfilingWatcherBloc(this._profilingRepository);

  @override
  ProfilingWatcherState get initialState => ProfilingWatcherState.initial();

  @override
  Stream<ProfilingWatcherState> mapEventToState(
    ProfilingWatcherEvent event,
  ) async* {
    Either<BaseFailure, KtList<ProfilingItem>> failureOrProfilingItems;

    yield ProfilingWatcherState.loadInProgress();
    failureOrProfilingItems = await _profilingRepository?.getProfilingItems();
    yield failureOrProfilingItems.fold(
        (l) => ProfilingWatcherState.loadFailure(l),
        (r) => ProfilingWatcherState.loadSuccess(r));
  }
}
