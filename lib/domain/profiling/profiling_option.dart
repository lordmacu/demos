import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiling_option.freezed.dart';

@freezed
abstract class ProfilingOption with _$ProfilingOption {
  const factory ProfilingOption(
      {@required String id,
      @required String emoji,
      @required String description,
      @required double score,
      @required double value}) = _ProfilingQuestion;

  factory ProfilingOption.empty() =>
      ProfilingOption(id: '', emoji: '', description: '', value: 0, score: 0);
}
