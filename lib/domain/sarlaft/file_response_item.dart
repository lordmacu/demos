import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_response_item.freezed.dart';

@freezed
abstract class FileResponseItem with _$FileResponseItem {
  const factory FileResponseItem({
    @required File file,
    @required int id,
  }) = _FileResponseItem;
}
