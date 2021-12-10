import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_popup_type_info.freezed.dart';

@freezed
abstract class ResponsePopUpTypeInfo with _$ResponsePopUpTypeInfo {
  const factory ResponsePopUpTypeInfo({@required int popUpType}) =
      _ResponsePopUpTypeInfo;

  factory ResponsePopUpTypeInfo.empty() =>
      ResponsePopUpTypeInfo(popUpType: 0);
}
