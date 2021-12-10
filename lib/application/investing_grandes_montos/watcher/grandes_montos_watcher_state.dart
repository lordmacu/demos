part of 'grandes_montos_watcher_bloc.dart';

@freezed
abstract class GrandesMontosWatcherState with _$GrandesMontosWatcherState {
  const factory GrandesMontosWatcherState.infoFinanciera1(
      List<OcupationItem> items, Map<String, String> cities, Map<String, String> countries) = _infoFinanciera1;
  const factory GrandesMontosWatcherState.infoFinanciera2() = _infoFinanciera2;
  const factory GrandesMontosWatcherState.adjuntarDocumentos1(
      List<RequiredFileItem> files) = _adjuntarDocumentos1;
  const factory GrandesMontosWatcherState.loading() = _loading;
  const factory GrandesMontosWatcherState.end() = _end;
  const factory GrandesMontosWatcherState.error(String error) = _error;
}
