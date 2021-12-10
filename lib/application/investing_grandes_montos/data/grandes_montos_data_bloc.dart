import 'dart:io';

import 'package:ualet/application/user_verification/user_verification_bloc.dart';
import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/sarlaft/ocupation_item.dart';
import 'package:ualet/domain/sarlaft/foreign_currency_item.dart';
import 'package:ualet/domain/sarlaft/pep_family_member.dart';
import 'package:ualet/domain/sarlaft/required_file_item.dart';
import 'package:ualet/domain/sarlaft/file_response_item.dart';
import 'package:ualet/domain/sarlaft/sarlaft_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/sarlaft/pay_taxes_not_colombia_item.dart';

part 'grandes_montos_data_event.dart';
part 'grandes_montos_data_state.dart';
part 'grandes_montos_data_bloc.freezed.dart';

@injectable
class GrandesMontosDataBloc
    extends Bloc<GrandesMontosDataEvent, GrandesMontosDataState> {
  @override
  GrandesMontosDataState get initialState => GrandesMontosDataState.initial();

  @override
  Stream<GrandesMontosDataState> mapEventToState(
      GrandesMontosDataEvent event) async* {
    yield* event.map(
      setSarlaftData: (value) async* {
        print("SETTING SARLAFT DATA FROM REMOTE");
        bool showWorkStuff = value.item.ciiuCode == getCIIU("Empleado");
        yield state.copyWith(
            showWorkStuff: showWorkStuff,
            sarlaftItem: value.item,
            numPepsExtra: value.item.hasPepRelationships
                ? value.item.pepList.length - 1
                : 0,
            numTaxesExtra: value.item.ifPayTaxesNotColombia
                ? value.item.payTaxesNotColombiaModel.length - 1
                : 0);
      },

      updateWorkplaceAddress: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            workAddress: data.address,
          ),
        );
      },

      updateWorkplaceCity: (data) async* {
        yield state.copyWith(
          companyCityText: data.cityName,
          sarlaftItem: state.sarlaftItem.copyWith(
            cityWorkId: int.parse(getCityId(data.cityName)),
          ),
        );
      },

      updateWorkplaceName: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            workPlaceName: data.name,
          ),
        );
      },

      updateWorkplaceTelephone: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            workPhone: data.phone,
          ),
        );
      },

      updateCityOfResidence: (data) async* {
        yield state.copyWith(
          resCityText: data.cityName,
          sarlaftItem: state.sarlaftItem.copyWith(
            cityResidenceId: int.parse(getCityId(data.cityName)),
          ),
        );
      },

      addTaxesPage: (data) async* {
        var list = state.sarlaftItem.payTaxesNotColombiaModel
          ..add(PayTaxesNotColombiaItem.empty());
        yield state.copyWith(
          numTaxesExtra: state.numTaxesExtra + 1,
          sarlaftItem: state.sarlaftItem.copyWith(
            payTaxesNotColombiaModel: list,
          ),
        );
      },

      addCurrencyItem: (data) async* {
        var list = state.sarlaftItem.productForeignCurrencyList
          ..add(ForeignCurrencyItem.empty());
        yield state.copyWith(
          numCurrencyExtra: state.numCurrencyExtra + 1,
          sarlaftItem: state.sarlaftItem.copyWith(
            productForeignCurrencyList: list,
          ),
        );
      },

      updateCitizenUs: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            citizenResidentUs: data.value,
          ),
        );
      },
      //CurrencyItem
      updateForeignCurrencyItem: (data) async* {
        print("update foreginCurrencyItem ${data.item} index: ${data.index}");
        List<ForeignCurrencyItem> list =
            List.from(state.sarlaftItem.productForeignCurrencyList);
        list[data.index] = data.item;
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          productForeignCurrencyList: list,
        ));
      },
      updateGreencard: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            itsGreenCard: data.value,
          ),
        );
      },
      //Taxes
      updateTaxesNotColombia: (data) async* {
        print("Update Taxes: ${data.value}");
        var lst = state.sarlaftItem.payTaxesNotColombiaModel
          ..add(PayTaxesNotColombiaItem.empty());
        yield state.copyWith(
          numTaxesExtra: data.value ? state.numCurrencyExtra : 0,
          sarlaftItem: state.sarlaftItem.copyWith(
            ifPayTaxesNotColombia: data.value,
            payTaxesNotColombiaModel: data.value ? lst : [],
          ),
        );
      },
      //TaxesItem
      updateTaxesNotColombiaItem: (data) async* {
        print("update foreginCurrencyItem ${data.item} index: ${data.index}");
        List<PayTaxesNotColombiaItem> list = List<PayTaxesNotColombiaItem>.from(
            state.sarlaftItem.payTaxesNotColombiaModel);
        list[data.index] = data.item;
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          payTaxesNotColombiaModel: list,
        ));
      },
      deleteFile: (data) async* {
        print("Filus Deletus");
        var list = state.filesResponse.toMutableList();
        try {
          var item = list.first((e) => e.id == data.id);
          list.remove(item);
        } catch (e) {}

        yield state.copyWith(filesResponse: list.toList());
      },
      setResponseFile: (data) async* {
        print("SET RESPONSE FILE: ${data.file}");
        var list = state.filesResponse.toMutableList();
        try {
          var item = list.first((e) => e.id == data.file.id);
          list.remove(item);
        } catch (e) {}
        list.add(data.file);
        yield state.copyWith(
          filesResponse: list.toList(),
        );
      },
      setRequiredFiles: (data) async* {
        print("SET REQUIRED FILES");
        yield state.copyWith(
          requiredFiles: data.files,
        );
      },
      emptyData: (data) async* {
        print("aquiii esta  la cosa");
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem
              .copyWith(pepList: [], hasPepRelationships: false),
        );
      },
      setData: (data) async* {
        print("SET DATA");
        var ciiuList = data.items.map<String>((item) => item.code).toList();
        yield state.copyWith(
          ocupacionesList: data.items,
          ciuuList: ciiuList,
          cities: data.cities,
          countries: data.countries,
        );
      },
      addPep: (_) async* {
        print("AddPep");
        var list = state.sarlaftItem.pepList..add(PepFamilyMember.empty());
        yield state.copyWith(
          numPepsExtra: state.numPepsExtra + 1,
          sarlaftItem: state.sarlaftItem.copyWith(
            pepList: list,
          ),
        );
        print(list);
      },
      updateDireccionResidencia: (data) async* {
        yield state.copyWith(
          sarlaftItem: state.sarlaftItem.copyWith(
            address: data.direccionResidencia,
          ),
        );
      },
      updateOcupacion: (data) async* {
        print("Ocupacion: " + data.ocupacion);

        yield state.copyWith(
            showWorkStuff: data.ocupacion == "Empleado" ? true : false,
            sarlaftItem: state.sarlaftItem.copyWith(
              opccupationId: getOcupacionId(data.ocupacion),
              ciiuCode: getCIIU(data.ocupacion),
            ));
      },
      updateCiiu: (data) async* {
        var ciiu = data.ciiu.split(" | ");

        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          ciiuCode: ciiu[0],
        ));
      },
      updateOrigenFondos: (data) async* {
        print(data.origenFondos);
        yield state.copyWith(
            sarlaftItem:
                state.sarlaftItem.copyWith(foundsOrigin: data.origenFondos));
      },
      updateIngresosMensuales: (data) async* {
        print("Ingresos ${data.ingresosMensuales}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          monthlyIncome: data.ingresosMensuales,
        ));
      },
      updateEgresosMensuales: (data) async* {
        print("egresos ${data.egresosMensuales}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          monthlyOutcome: data.egresosMensuales,
        ));
      },
      updateOtrosIngresos: (data) async* {
        print("otros ingresos ${data.otrosIngresos}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          otherIncome: data.otrosIngresos,
        ));
      },
      updateTotalActivos: (data) async* {
        print("activos ${data.totalActivos}");
        yield state.copyWith(
            sarlaftItem:
                state.sarlaftItem.copyWith(totalAssets: data.totalActivos));
      },
      updateTotalPasivos: (data) async* {
        print("pasivos ${data.totalPasivos}");
        yield state.copyWith(
            sarlaftItem:
                state.sarlaftItem.copyWith(totalLiability: data.totalPasivos));
      },
      updateAdminRecursosPublicos: (data) async* {
        print("recursos publicos ${data.adminRecursosPublicos}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          managesPublicResources: data.adminRecursosPublicos,
        ));
      },

      updatePartnerPep: (data) async* {
        print("recursos publicos ${data.partnerPep}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          partnerPep: data.partnerPep,
        ));
      },
      updateFinantialAccounts: (data) async* {
        print("recursos publicos ${data.finantialAccounts}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          finantialAcconts: data.finantialAccounts,
        ));
      },

      updateUserPep: (data) async* {
        print("user pep ${data.userPep}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          isPep: data.userPep,
        ));
      },

      updateFamilyPep: (data) async* {
        print("familyPep ${data.familyPep}");
        var list = state.sarlaftItem.pepList..add(PepFamilyMember.empty());
        yield state.copyWith(
            numPepsExtra: data.familyPep ? state.numPepsExtra : 0,
            sarlaftItem: state.sarlaftItem.copyWith(
                hasPepRelationships: data.familyPep,
                pepList: data.familyPep ? list : []));
      },
      //PEP Item
      updateFamilyPepItem: (data) async* {
        print("update pepItem ${data.item} index: ${data.index}");
        List<PepFamilyMember> list = List.from(state.sarlaftItem.pepList);
        list[data.index] = data.item;
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          pepList: list,
        ));
        print(list);
      },
      //Currency
      updateOperacionesOtraMoneda: (data) async* {
        print("operaciones otra moneda ${data.operacionesOtraMoneda}");
        yield state.copyWith(
            numCurrencyExtra:
                data.operacionesOtraMoneda ? state.numCurrencyExtra : 0,
            sarlaftItem: state.sarlaftItem.copyWith(
                manageForeignCurrency: data.operacionesOtraMoneda,
                productForeignCurrencyList: data.operacionesOtraMoneda
                    ? state.sarlaftItem.productForeignCurrencyList
                    : []));
      },
      updatePagosEEUU: (data) async* {
        print("pagos eeuu ${data.pagosEEUU}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          receivePaymentsUs: data.pagosEEUU,
        ));
      },
      updateIngresosPropiedadesEEUU: (data) async* {
        print("propiedades usa ${data.ingresosPropiedadesEEUU}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          receiveIncomePropertyUs: data.ingresosPropiedadesEEUU,
        ));
      },
      updateDiasEEUU: (data) async* {
        print("dias usa ${data.diasEEUU}");
        yield state.copyWith(
            sarlaftItem:
                state.sarlaftItem.copyWith(permanencyInUs: data.diasEEUU));
      },
      updateCiudadanoEEUU: (data) async* {
        print("ciudadano USA ${data.ciudadanoEEUU}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          citizenResidentUs: data.ciudadanoEEUU,
        ));
      },
      updatePartnerName: (data) async* {
        print("ciudadano USA ${data.partnerName}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          partnerName: data.partnerName,
        ));
      },
      updatePartnerType: (data) async* {
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          partnerType: data.partnerType,
        ));
      },

      updateFamilyPosition: (data) async* {
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          familyPosition: data.familyPosition,
        ));
      },

      updateFamilyCountry: (data) async* {
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          familyCountry: data.familyCountry,
        ));
      },
      updatePartnerIdentification: (data) async* {
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          partnerIdentification: data.partnerIdentification,
        ));
      },
      updateCiudadanoEEUUFamily: (data) async* {
        print("ciudadano USA family ${data.citizenResidentUsFamily}");
        yield state.copyWith(
            sarlaftItem: state.sarlaftItem.copyWith(
          citizenResidentUsFamily: data.citizenResidentUsFamily,
        ));
      },
    );
  }

  String getCIIU(String ocupacion) {
    var ciiu = state.ocupacionesList.firstWhere(
        (element) => element.name == ocupacion,
        orElse: () => OcupationItem(code: "0010", id: "1", name: "asalariado"));

    return ciiu.code;
  }

  String getOcupacionId(String ocupacion) {
    var item = state.ocupacionesList.firstWhere(
        (element) => element.name == ocupacion,
        orElse: () => OcupationItem(code: "0010", id: "1", name: "asalariado"));
    return item.id;
  }

  String getCityId(String cityName) {
    for (var c in state.cities.keys) {
      if (state.cities[c] == cityName) return c;
    }
    return '';
  }

  String getCountryId(String countryName) {
    for (var c in state.countries.keys) {
      if (state.countries[c] == countryName) return c;
    }
    return '';
  }

  bool isButtonActivated1() {
    var i = state.sarlaftItem;
    if (i.address != '' &&
        i.ciiuCode != '' &&
        i.cityResidenceId != 0 &&
        i.foundsOrigin != '' &&
        i.monthlyIncome != 0 &&
        i.monthlyOutcome != 0 &&
        i.opccupationId != '' &&
        //i.otherIncome != 0 &&
        i.totalAssets != 0 &&
        i.totalLiability != 0) {
      if (i.ciiuCode.contains("0010")) {
        if (i.workAddress != '' &&
            i.workPhone != '' &&
            i.workPlaceName != '' &&
            i.cityWorkId != 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  bool isButtonActivated2() {
    if (state.sarlaftItem.hasPepRelationships) {
      for (var pep in state.sarlaftItem.pepList) {
        print(pep);
        if (pep.name == '' || pep.lastNames == '' || pep.identification == '')
          return true;
      }
    }
    if (state.sarlaftItem.ifPayTaxesNotColombia) {
      for (var tax in state.sarlaftItem.payTaxesNotColombiaModel) {
        print(tax);
        if (tax.countryId == '' || tax.identification == '' || tax.name == '') {
          return true;
        }
      }
    }
    return true;
  }

  bool isButtonActivated3() {
    var responses = state.filesResponse;
    for (var req in state.requiredFiles) {
      if (req.isRequired) {
        var res = responses.filter((element) => element.id == req.id);
        if (res.size == 0) {
          return false;
        }
      }
    }
    if (responses.size < 2) return false;
    return true;
  }
}
