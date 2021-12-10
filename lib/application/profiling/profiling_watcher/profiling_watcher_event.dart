part of 'profiling_watcher_bloc.dart';

@freezed
abstract class ProfilingWatcherEvent with _$ProfilingWatcherEvent {
  const factory ProfilingWatcherEvent.getProfilingItems() = _GetProfilingItems;
}
