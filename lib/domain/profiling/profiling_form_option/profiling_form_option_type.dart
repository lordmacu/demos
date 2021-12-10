import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiling_form_option_type.freezed.dart';

@freezed
abstract class ProfilingFormOptionType with _$ProfilingFormOptionType {
  const factory ProfilingFormOptionType(
      {@required String id,
      @required String value,
      @required bool isObservation,
      @required double score}) = _ProfilingFormOptionType;

  factory ProfilingFormOptionType.empty() => ProfilingFormOptionType(
      id: '', value: '', isObservation: false, score: 0.0);
}
