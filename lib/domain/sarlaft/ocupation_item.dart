import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocupation_item.freezed.dart';
@freezed
abstract class OcupationItem with _$OcupationItem {
  const factory OcupationItem({
    @required String id,
    @required String name,
    @required String code,
  }) = _OcupationItem;
}
