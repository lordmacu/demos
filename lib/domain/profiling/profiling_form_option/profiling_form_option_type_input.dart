import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiling_form_option_type_input.freezed.dart';

@freezed
abstract class ProfilingFormOptionTypeInput
    with _$ProfilingFormOptionTypeInput {
  static const MONEY = 0;
  static const DATE = 1;
  static const TEXT = 2;
  static const TEXT_NUMBER = 5;
  static const TEXT_LONG = 3;
  static const MULTI_CHECK = 4;

  const factory ProfilingFormOptionTypeInput(
      {@required String id,
      @required String hintTextInput,
      @required int typeInput,
      @required String valueInput,
      @required List<String> options //solo si tipo 4
      }) = _ProfilingFormOptionTypeInput;

  factory ProfilingFormOptionTypeInput.empty() => ProfilingFormOptionTypeInput(
      id: '',
      hintTextInput: '',
      typeInput: ProfilingFormOptionTypeInput.MONEY,
      options: List.empty(),
      valueInput: '');
}
