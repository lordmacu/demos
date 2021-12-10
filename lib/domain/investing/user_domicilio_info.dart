import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_domicilio_info.freezed.dart';

@freezed
abstract class UserDomicilioInfo with _$UserDomicilioInfo {
  const factory UserDomicilioInfo({
    @required String calle,
    @required String numExt,
    @required String numInt,
    @required String colonia,
    @required String postal,
    @required String estado,
    @required String municipio,
    @required String estado2,
  }) = _UserDomicilioInfo;

  factory UserDomicilioInfo.empty() => UserDomicilioInfo(
        calle: "",
        colonia: "",
        estado2: "",
        estado: "",
        municipio: "",
        numExt: "",
        numInt: "",
        postal: "",
      );
}
