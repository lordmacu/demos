import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_failures.freezed.dart';

@freezed
abstract class BaseFailure with _$BaseFailure {
  const factory BaseFailure.unexpected() = Unexpected;
  const factory BaseFailure.fromServer(String message) = FromServer;
}
