import 'package:freezed_annotation/freezed_annotation.dart';

part 'redirection_item.freezed.dart';
@freezed
abstract class RedirectionItem with _$RedirectionItem {
  const factory RedirectionItem({
    @required bool forceRedirect,
    @required int customerLevel,
    @required String title,
    @required String message,
  }) = _RedirectionItem;

  factory RedirectionItem.empty() => RedirectionItem(
    customerLevel: -2,
    forceRedirect: false,
    message: '',
    title: '',
  );
}
