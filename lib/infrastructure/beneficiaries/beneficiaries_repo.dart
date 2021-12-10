import 'package:ualet/domain/beneficiaries/beneficiary_item.dart';
import 'package:ualet/domain/beneficiaries/i_beneficiaries_repo.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:kt_dart/collection.dart';

@LazySingleton(as: IBeneficiariesRepo)
class BeneficiariesRepo implements IBeneficiariesRepo {
  final Dio dio;

  final String getBeneficiariesUrl = '/Enrollment/GetBeneficiaries';
  final String postBeneficiariesUrl = '/Enrollment/AddBeneficiaries';
  final String updateBeneficiariesUrl = '/Enrollment/UpdateBeneficiaries';
  final String deleteBeneficiariesUrl = '/Enrollment/DeleteBeneficiaries';

  BeneficiariesRepo(this.dio);

  @override
  Future<Either<BaseFailure, bool>> postBeneficiaries(
      KtList<BeneficiaryItem> benficiaries,
      KtList<BeneficiaryItem> deleteList) async {
    //ELIMINAR
    for (int i = 0; i < deleteList.size; i++) {
      var element = deleteList[i];
      Map map = {
        "Id": element.id,
        "Name": element.name,
        "PhoneNumber": element.number,
        "Percent": element.percentage,
      };
      var result = await dio.post(deleteBeneficiariesUrl, data: map);
      if (!result.data['Result'])
        return left(BaseFailure.fromServer(result.data['Message']));
    }

    //ACTUALIZAR
    for (int i = 0; i < benficiaries.size; i++) {
      var element = benficiaries[i];
      if (element.id != -1) {
        String url = updateBeneficiariesUrl;
        Map map;
        map = {
          "Id": element.id,
          "Name": element.name,
          "PhoneNumber": element.number,
          "Percent": element.percentage,
        };
        var result = await dio.post(url, data: [map]);
        if (!result.data['Result'])
          return left(BaseFailure.fromServer(result.data['Message']));
      }
    }

    //AGREGAR
    for (int i = 0; i < benficiaries.size; i++) {
      var element = benficiaries[i];
      if (element.id == -1) {
        String url = postBeneficiariesUrl;
        Map map;
        map = {
          "Name": element.name,
          "PhoneNumber": element.number,
          "Percent": element.percentage,
        };
        var result = await dio.post(url, data: [map]);
        if (!result.data['Result'])
          return left(BaseFailure.fromServer(result.data['Message']));
      }
    }

    return right(true);
  }

  @override
  Future<Either<BaseFailure, KtList<BeneficiaryItem>>>
      getBeneficiaries() async {
    List<BeneficiaryItem> items = [];
    var response = await dio.post(getBeneficiariesUrl, data: {});
    print(response.data);
    if (!response.data['Result']) {
      return left(BaseFailure.fromServer(response.data['Message']));
    }
    for (var item in response.data['Data']) {
      items.add(BeneficiaryItem(
          id: item['Id'],
          name: item['Name'],
          number: item['PhoneNumber'],
          percentage: item['Percent']));
    }
    return right(KtList.from(items));
  }
}
