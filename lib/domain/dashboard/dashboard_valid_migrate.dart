import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_valid_migrate.freezed.dart';

@freezed
abstract class ValidateIntroductoryMigrate with _$ValidateIntroductoryMigrate {
  const factory ValidateIntroductoryMigrate({
    @required bool validate
  }) = _ValidateIntroductoryMigrate;

  factory ValidateIntroductoryMigrate.empty() => ValidateIntroductoryMigrate(validate: false);
}
