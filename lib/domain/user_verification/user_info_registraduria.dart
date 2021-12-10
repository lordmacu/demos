import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_registraduria.freezed.dart';

@freezed
abstract class UserInfoRegistraduria with _$UserInfoRegistraduria {
  const factory UserInfoRegistraduria({
    int idType,
    String firstName,
    String secondName,
    String surname,
    String secondSurname,
    String id,
    DateTime birthDate,
    int countryId,
    int regionId,
    DateTime expeditionDate,
    int expeditionRegionId,
    int genderId,
    bool blockedAlert
  }) = _UserInfoRegistraduria;

  factory UserInfoRegistraduria.empty() => UserInfoRegistraduria(
        idType: 0,
        firstName: "",
        secondName: "",
        surname: "",
        secondSurname: "",
        birthDate: DateTime.now(),
        countryId: -1,
        regionId: -1,
        expeditionDate: DateTime.now(),
        expeditionRegionId: -1,
        genderId: 0,
        id: "",
        blockedAlert: false
      );
}
