import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';

part 'profiling_item.freezed.dart';

@freezed
abstract class ProfilingItem with _$ProfilingItem {
  const factory ProfilingItem({
    @required String id,
    @required String title,
    @required String type,
    @required String description,
    @required List<ProfilingOption> questions,
    @required List<ProfilingFormOption> formQuestions,
  }) = _ProfilingItem;

  factory ProfilingItem.empty() => ProfilingItem(
      id: '', title: '', type: '', description: '', questions: [], formQuestions: []);
}
