import 'dart:convert';
import 'dart:io';

import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/sarlaft/Quanto/quanto_credit_history_item.dart';
import 'package:ualet/domain/sarlaft/file_response_item.dart';
import 'package:ualet/domain/sarlaft/i_sarlaft_repository.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mimeManager;

@LazySingleton(as: ISarlaftRepository)
class SarlaftRepository implements ISarlaftRepository {
  final Dio _dio;
  final countriesApi = "/GenericData/AllCountries";
  final String sendSarlafApi = '/Enrollment/CreateForm';

  final String updateSarlaftApi = '/Enrollment/UpdateForm';

  final String sendFileApi = '/File/UploadFile?configFileId=';

  final String sendQuantoApi = '/User/GetCreditHystoryPlus';

  SarlaftRepository(this._dio);
  @override
  Future<Either<BaseFailure, Map<String, String>>> getCountries() async {
    try {
      var result = await _dio.get(countriesApi);
      if (!result.data['Result'])
        return left(BaseFailure.fromServer(result.data['Message']));
      else {
        Map<String, String> r = {};
        for (var c in result.data['Data']) {
          r[c['Value']] = c['Text'];
        }
        return right(r);
      }
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> postSarlaft(SarlaftItem item) async {
    print("este es el parent  ${item.pepList}");

    try {
      var map = {
        "finantialAcconts": item.finantialAcconts, //falta
        "address": item.address,
        "cityResidenceId": item.cityResidenceId,
        "occupationId": item.opccupationId,
        "ciiuCode": item.ciiuCode,
        "cityWorkId": item.cityWorkId,
        "workPlaceName": item.workPlaceName,
        "workAddress": item.workAddress,
        "workPhone": item.workPhone,
        "foundsOrigin": item.foundsOrigin,
        "monthlyIncome": item.monthlyIncome,
        "monthlyOutcome": item.monthlyOutcome,
        "othersIncome": item.otherIncome,
        "totalAssets": item.totalAssets,
        "totalLiabilities": item.totalLiability,
        "managesPublicResources": item.managesPublicResources,
        "isPep": item.isPep, //ok
        "partnerPep": item.partnerPep,
        "partner": {
          /// falta
          "name": item.partnerName,

          /// falta
          "parentType": item.partnerType,

          /// falta
          "identification": item.partnerIdentification,

          /// falta
        },
        "hasPepRelationships": item.hasPepRelationships,

        ///ok
        "pepList": item.pepList
            .map((e) => {
                  "name": e.name, //ok
                  "lastNames": e.lastNames,
                  "identification": e.identification,
                  "identificationType": e.identificationType,
                  "parentType": e.parentType,///falta
                  "country": e.country,
                  "pepType": e.pepType,
                  "position": "none"
                })
            .toList(),
        "manageForeignCurrency": item.manageForeignCurrency,

        ///ok
        "productForeignCurrencyList": item.productForeignCurrencyList
            .map((e) => {
                  "productName": e.productName,
                  "productType": e.productType,
                  "clientIdentification": e.clientIdentification,
                  "entity": e.entity,
                  "amount": e.amount,
                  "countryCode": e.countryCode,
                  "countryName": e.countryName,
                  "cityCode": e.cityCode,
                  "currencyType": e.currencyType,
                })
            .toList(),
        "ifPayTaxesNotColombia": item.ifPayTaxesNotColombia,

        ///ok
        "payTaxesNotColombiaModel": item.payTaxesNotColombiaModel
            .map((e) => {
                  "countryId": e.countryId,
                  "countryName": e.countryName,
                  "name": e.name,
                  "identification": e.identification
                })
            .toList(),
        "receivePaymentsUs": item.receivePaymentsUs,

        /// ok
        "receiveIncomePropertyUs": item.receiveIncomePropertyUs,

        ///ok
        "permanencyInUs": item.permanencyInUs,

        ///ok
        "citizenResidentUs": item.citizenResidentUs,

        ///ok
        "citizenResidentUsFamily": item.citizenResidentUsFamily, // falta
        "familyforeign": {/// falta
          "position": item.familyPosition, // falta
          "country": item.familyCountry

          /// falta
        },
        "itsGreenCard": item.itsGreenCard,
      };

      print("esta es la data  ${map}");

      var response = await _dio.post(sendSarlafApi, data: json.encode(map));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data['Message']));
      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> postCreditHystoryPLus(
      QuantoCreditHistoryItem item) async {
    try {
      var requestMap = {
        "solicitud": {
          "clave": item.clave,
          "identificacion": item.identificacion,
          "primerApellido": item.primerApellido,
          "producto": item.producto,
          "tipoIdentificacion": item.tipoIdentificacion,
          "usuario": item.usuario,
          "ingress": item.ingress,
          "egress": item.egress
        }
      };

      var response =
          await _dio.post(sendQuantoApi, data: json.encode(requestMap));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data['Message']));
      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> updateSarlaft(SarlaftItem item) async {

    try {
      var map = {
        "address": item.address,
        "cityResidenceId": item.cityResidenceId,
        "occupationId": item.opccupationId,
        "ciiuCode": item.ciiuCode,
        "cityWorkId": item.cityWorkId,
        "workPlaceName": item.workPlaceName,
        "workAddress": item.workAddress,
        "workPhone": item.workPhone,
        "foundsOrigin": item.foundsOrigin,
        "monthlyIncome": item.monthlyIncome,
        "monthlyOutcome": item.monthlyOutcome,
        "othersIncome": item.otherIncome,
        "totalAssets": item.totalAssets,
        "totalLiabilities": item.totalLiability,
        "managesPublicResources": item.managesPublicResources,
        "isPep": item.isPep,
        "hasPepRelationships": item.hasPepRelationships,
        "pepList": item.pepList
            .map((e) => {
                  "name": e.name,

                  "lastNames": e.lastNames,
                  "identification": e.identification,
                  "identificationType": e.identificationType,
                  "pepType": e.pepType,
                  "position": e.position,


          "parentType": e.parentType,

          ///falta
          "country": e.country,

                })
            .toList(),
        "manageForeignCurrency": item.manageForeignCurrency,
        "productForeignCurrencyList": item.productForeignCurrencyList
            .map((e) => {
                  "productName": e.productName,
                  "productType": e.productType,
                  "clientIdentification": e.clientIdentification,
                  "entity": e.entity,
                  "amount": e.amount,
                  "countryCode": e.countryCode,
                  "countryName": e.countryName,
                  "cityCode": e.cityCode,
                  "currencyType": e.currencyType,
                })
            .toList(),
        "ifPayTaxesNotColombia": item.ifPayTaxesNotColombia,
        "payTaxesNotColombiaModel": item.payTaxesNotColombiaModel
            .map((e) => {
                  "countryId": e.countryId,
                  "countryName": e.countryName,
                  "name": e.name,
                  "identification": e.identification
                })
            .toList(),
        "receivePaymentsUs": item.receivePaymentsUs,
        "receiveIncomePropertyUs": item.receiveIncomePropertyUs,
        "permanencyInUs": item.permanencyInUs,
        "citizenResidentUs": item.citizenResidentUs,
        "citizenResidentUsFamily": item.citizenResidentUsFamily, // falta
        "familyforeign": {
          /// falta
          "position": item.familyPosition, // falta
          "country": item.familyCountry

          /// falta
        },
        "partner": {
          /// falta
          "name": item.partnerName,

          /// falta
          "parentType": item.partnerType,

          /// falta
          "identification": item.partnerIdentification,

          /// falta
        },
        "finantialAcconts": item.finantialAcconts, //falta

        "itsGreenCard": item.itsGreenCard,
      };

      var response = await _dio.post(updateSarlaftApi, data: json.encode(map));
      if (!response.data["Result"])
        return left(BaseFailure.fromServer(response.data['Message']));
      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, bool>> sendFiles(
      List<FileResponseItem> files) async {
    try {
      for (var element in files) {
        var f = await MultipartFile.fromFile(element.file.path,
            filename: element.file.path.split("/").last);
        var data = FormData.fromMap({
          "configFileId": f
          // filename: element.file.path.split("/").last)
          // contentType: ContentType.parse(mimeManager.lookupMimeType(element.file.path))
          ,
        });
        var response = await _dio.post(
          "$sendFileApi"+"1",
          data: data,
          // options: Options(
          //     contentType: mimeManager.lookupMimeType(element.file.path))
        );

        if (!response.data['Result'])
          return left(BaseFailure.fromServer(response.data['Message']));
      }

      return right(true);
    } catch (e) {
      return left(BaseFailure.unexpected());
    }
  }
}
