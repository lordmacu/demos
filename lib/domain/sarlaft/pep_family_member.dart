import 'package:freezed_annotation/freezed_annotation.dart';

part 'pep_family_member.freezed.dart';

@freezed
abstract class PepFamilyMember with _$PepFamilyMember {
  const factory PepFamilyMember({
    @required String name,
    @required String lastNames,
    @required String identification,
    @required String position,
    @required int identificationType,
    @required int pepType,
    String documentType,
    String parentType,
    String country,
  }) = _PepFamiliMember;

  factory PepFamilyMember.empty() => PepFamilyMember(
      name: '',
      lastNames: '',
      identification: '',
      position: '',
      identificationType: 0,
      documentType: '',
      parentType:  '',
      country:   '',
      pepType: 0);
}
