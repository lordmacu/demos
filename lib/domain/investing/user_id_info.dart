import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id_info.freezed.dart';

@freezed
abstract class UserIdInfo with _$UserIdInfo {
  const factory UserIdInfo({
    @required String id,
    @required String docType,
    @required String curp,
    @required String names,
    @required String firstLastname,
    @required String secondLastname,
    @required String birthDate,
    @required String gender,
    @required String expedDate,
    @required String cityState,
    String mz1,
    String docTypeForm
  }) = _UserIdInfo;

  factory UserIdInfo.empty() => UserIdInfo(
    id: "",
        birthDate: "",
        curp: "",
        docType: "",
        firstLastname: "",
        gender: "",
        names: "",
        secondLastname: "",
        expedDate: '',
        mz1: '',
        cityState: "",
        docTypeForm: ""
      );
}
