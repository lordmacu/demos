import 'package:dio/dio.dart';

extension ResponseX on Response {
  bool get getResult => data['Result'];
  dynamic get getData => data['Data'];
  String get getMessage => data['Message'];
}
