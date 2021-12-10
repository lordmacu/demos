import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/value_objects.dart';

part 'profiling_result.freezed.dart';

@freezed
abstract class ProfilingResult with _$ProfilingResult {
  const factory ProfilingResult(
      {
        @required int id,
        @required String title,
      @required String subtitle,
      @required String description,
      @required String connectedProfileId,
      @required String image}) = _ProfilingResult;
}
