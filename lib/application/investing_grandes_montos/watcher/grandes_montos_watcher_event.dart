part of 'grandes_montos_watcher_bloc.dart';

@freezed
abstract class GrandesMontosWatcherEvent with _$GrandesMontosWatcherEvent {
  const factory GrandesMontosWatcherEvent.toInfoFinanciera1() = _toInfoFinanciera1;
  const factory GrandesMontosWatcherEvent.toInfoFinanciera2() = _toInfoFinanciera2;
  const factory GrandesMontosWatcherEvent.toAdjuntarDocumentos1() = _toAdjuntarDocumentos1;
}