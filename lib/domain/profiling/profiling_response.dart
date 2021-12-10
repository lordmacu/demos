import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/core/value_objects.dart';

part 'profiling_response.freezed.dart';

@freezed
abstract class ProfilingResponse with _$ProfilingResponse {
  const factory ProfilingResponse(
      {@required String questionId, 
      @required String responseId,
      @required ValueObject<String> value,
      @required double score,
      String isValueCheck,
      String valueFieldObservation}) = _ProfilingResponse;
}
