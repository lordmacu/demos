part of 'grandes_montos_data_bloc.dart';

@freezed
abstract class GrandesMontosDataEvent with _$GrandesMontosDataEvent {
  const factory GrandesMontosDataEvent.updateCityOfResidence(String cityName) =
      _updateCityOfResidence;
  const factory GrandesMontosDataEvent.updateDireccionResidencia(
      String direccionResidencia) = _updateDireccionResidencia;
  const factory GrandesMontosDataEvent.updateOcupacion(String ocupacion) =
      _updateOcupacion;

  const factory GrandesMontosDataEvent.updateWorkplaceName(String name) =
      _updateWorkplaceName;
  const factory GrandesMontosDataEvent.updateWorkplaceCity(String cityName) =
      _updateWorkplaceCity;
  const factory GrandesMontosDataEvent.updateWorkplaceAddress(String address) =
      _updateWorkplaceAddress;
  const factory GrandesMontosDataEvent.updateWorkplaceTelephone(String phone) =
      _updateWorkplaceTelephone;
  const factory GrandesMontosDataEvent.updateCiiu(String ciiu) = _updateCiiu;
  const factory GrandesMontosDataEvent.updateOrigenFondos(String origenFondos) =
      _updateOrigenFondos;
  const factory GrandesMontosDataEvent.updateIngresosMensuales(
      double ingresosMensuales) = _updateIngresosMensuales;
  const factory GrandesMontosDataEvent.updateEgresosMensuales(
      double egresosMensuales) = _updateEgresosMensuales;
  const factory GrandesMontosDataEvent.updateOtrosIngresos(
      double otrosIngresos) = _updateOtrosIngresos;
  const factory GrandesMontosDataEvent.updateTotalActivos(double totalActivos) =
      _updateTotalActivos;
  const factory GrandesMontosDataEvent.updateTotalPasivos(double totalPasivos) =
      _updateTotalPasivos;
  const factory GrandesMontosDataEvent.updateAdminRecursosPublicos(
      bool adminRecursosPublicos) = _updateAdminRecursosPublicos;
  const factory GrandesMontosDataEvent.updateUserPep(bool userPep) =
      _updateUserPep;
  const factory GrandesMontosDataEvent.updatePartnerPep(bool partnerPep) =
      _updatePartnerPep;

  const factory GrandesMontosDataEvent.updateFinantialAccounts(
      bool finantialAccounts) = _updateFinantialAccounts;

  const factory GrandesMontosDataEvent.updateFamilyPep(bool familyPep) =
      _updateFamilyPep;
  const factory GrandesMontosDataEvent.updateFamilyPepItem(
      PepFamilyMember item, int index) = _updateFamilyPepItem;

  const factory GrandesMontosDataEvent.updateForeignCurrencyItem(
      ForeignCurrencyItem item, int index) = _updateForeignCurrencyItem;
  const factory GrandesMontosDataEvent.addCurrencyItem() = _addCurrencyItem;

  const factory GrandesMontosDataEvent.updateTaxesNotColombia(bool value) =
      _updateTaxesNotColombia;
  const factory GrandesMontosDataEvent.updateTaxesNotColombiaItem(
      PayTaxesNotColombiaItem item, int index) = _updateTaxesNotColombiaItem;
  const factory GrandesMontosDataEvent.addTaxesPage() = _addTaxesPage;

  const factory GrandesMontosDataEvent.updateOperacionesOtraMoneda(
      bool operacionesOtraMoneda) = _updateOperacionesOtraMoneda;
  const factory GrandesMontosDataEvent.updatePagosEEUU(bool pagosEEUU) =
      _updatePagosEEUU;
  const factory GrandesMontosDataEvent.updateFamilyPosition(
      String familyPosition) = _updateFamilyPosition;

  const factory GrandesMontosDataEvent.updateFamilyCountry(
      String familyCountry) = _updateFamilyCountry;

  const factory GrandesMontosDataEvent.updateIngresosPropiedadesEEUU(
      bool ingresosPropiedadesEEUU) = _updateIngresosPropiedadesEEUU;
  const factory GrandesMontosDataEvent.updateDiasEEUU(bool diasEEUU) =
      _updateDiasEEUU;
  const factory GrandesMontosDataEvent.updateCiudadanoEEUU(bool ciudadanoEEUU) =
      _updateCiudadanoEEUU;

  const factory GrandesMontosDataEvent.updateCiudadanoEEUUFamily(
      bool citizenResidentUsFamily) = _updateCiudadanoEEUUFamily;

  const factory GrandesMontosDataEvent.updatePartnerName(String partnerName) =
      _updatePartnerName;

  const factory GrandesMontosDataEvent.updatePartnerType(String partnerType) =
      _updatePartnerType;

  const factory GrandesMontosDataEvent.updatePartnerIdentification(
      String partnerIdentification) = _updatePartnerIdentification;

  const factory GrandesMontosDataEvent.updateCitizenUs(bool value) =
      _updateCitizenUs;

  const factory GrandesMontosDataEvent.addPep() = _addPep;
  const factory GrandesMontosDataEvent.emptyData() = EmptyData;

  const factory GrandesMontosDataEvent.setData(List<OcupationItem> items,
      Map<String, String> cities, Map<String, String> countries) = _setData;

  const factory GrandesMontosDataEvent.setRequiredFiles(
      List<RequiredFileItem> files) = _requiredFiles;
  const factory GrandesMontosDataEvent.setResponseFile(FileResponseItem file) =
      _setResponseFile;
  const factory GrandesMontosDataEvent.deleteFile(int id) = _deleteFile;
  const factory GrandesMontosDataEvent.updateGreencard(bool value) =
      _updateGreencard;
  const factory GrandesMontosDataEvent.setSarlaftData(SarlaftItem item) =
      _setSarlaftData;
}
