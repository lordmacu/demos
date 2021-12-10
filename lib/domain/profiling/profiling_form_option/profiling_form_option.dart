import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option_type_input.dart';

part 'profiling_form_option.freezed.dart';

@freezed
abstract class ProfilingFormOption with _$ProfilingFormOption {
  static const RADIO = 0;
  static const CHECK = 1;

  const factory ProfilingFormOption({
    @required String id,
    @required String description,
    @required int typeInput,
    String descriptionObservation,
    String hintTextObservation,
    @required List<ProfilingFormOptionType> listOptionTypeCheck,
    @required List<ProfilingFormOptionTypeInput> listOptionTypeField,
  }) = _ProfilingQuestion;

  factory ProfilingFormOption.empty() => ProfilingFormOption(
        id: '',
        description: '',
        typeInput: ProfilingFormOption.RADIO,
        descriptionObservation: '',
        hintTextObservation: '',
        listOptionTypeCheck: [],
        listOptionTypeField: []
      );
}
