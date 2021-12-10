part of 'profiling_watcher_bloc.dart';

@freezed
abstract class ProfilingWatcherState with _$ProfilingWatcherState {
  const factory ProfilingWatcherState.initial() = Initial;
  const factory ProfilingWatcherState.loadInProgress() = DataTransferInProgress;
  const factory ProfilingWatcherState.loadSuccess(
      KtList<ProfilingItem> profilingItems) = LoadSuccess;
  const factory ProfilingWatcherState.loadFailure(BaseFailure noteFailure) =
      LoadFailure;
}
