import 'package:freezed_annotation/freezed_annotation.dart';

part 'required_file_item.freezed.dart';

@freezed
abstract class RequiredFileItem with _$RequiredFileItem {
  const factory RequiredFileItem({
    @required int id,
    @required String name,
    @required bool isRequired,
    @required int maxSizeKB,
  }) = _RequiredFileItem;

  factory RequiredFileItem.empty() =>
      RequiredFileItem(id: -1, name: '', isRequired: false, maxSizeKB: 20000);
}
