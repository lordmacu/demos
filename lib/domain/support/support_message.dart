import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_message.freezed.dart';

@freezed
abstract class SupportMessage with _$SupportMessage {
  const factory SupportMessage({
    @required String message,
    File file,
    String typology
  }) = _SupportMessage;

  factory SupportMessage.empty() => SupportMessage(
        message: "",
        typology: ""
      );
}
