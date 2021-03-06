import 'package:freezed_annotation/freezed_annotation.dart';

import 'foreign_currency_item.dart';
import 'pay_taxes_not_colombia_item.dart';
import 'pep_family_member.dart';

part 'sarlaft_item.freezed.dart';

@freezed
abstract class SarlaftItem with _$SarlaftItem {
  const factory SarlaftItem({
    @required String address,
    @required int cityResidenceId,
    @required String opccupationId,
    @required String ciiuCode,
    @required int cityWorkId,
    @required String workPlaceName,
    @required String workAddress,
    @required String workPhone,
    @required String foundsOrigin,
    @required double monthlyIncome,
    @required double monthlyOutcome,
    @required double otherIncome,
    @required double totalAssets,
    @required double totalLiability,
    //Page 2
    @required bool partnerPep,
    @required bool managesPublicResources,
    @required bool finantialAcconts,
    @required bool isPep,
    @required bool hasPepRelationships,
    @required List<PepFamilyMember> pepList,
    @required bool manageForeignCurrency,
    @required List<ForeignCurrencyItem> productForeignCurrencyList,
    @required bool ifPayTaxesNotColombia,
    @required List<PayTaxesNotColombiaItem> payTaxesNotColombiaModel,
    @required bool receivePaymentsUs,
    @required bool receiveIncomePropertyUs,
    @required bool permanencyInUs,
    @required bool citizenResidentUs,
    @required String partnerName,
    @required String partnerType,
    @required String partnerIdentification,
    @required String familyPosition,
    @required String familyCountry,
    @required bool citizenResidentUsFamily,
    @required bool itsGreenCard,
  }) = _SarlaftItem;
  factory SarlaftItem.empty() => SarlaftItem(
        address: '',
        cityResidenceId: 0,
        opccupationId: '',
        ciiuCode: '',
        cityWorkId: 0,
        workPlaceName: '',
        workAddress: '',
        familyCountry: '',
        partnerName: '',
        partnerType: '',
        partnerIdentification: '',
        familyPosition: '',
        workPhone: '',
        foundsOrigin: '',
        monthlyIncome: 0,
        monthlyOutcome: 0,
        otherIncome: 0,
        totalAssets: 0,
        totalLiability: 0,
        managesPublicResources: false,
        finantialAcconts: false,
        isPep: false,
        partnerPep: false,
        hasPepRelationships: false,
        pepList: [],
        manageForeignCurrency: false,
        productForeignCurrencyList: [],
        ifPayTaxesNotColombia: false,
        payTaxesNotColombiaModel: [],
        receivePaymentsUs: false,
        receiveIncomePropertyUs: false,
        permanencyInUs: false,
        citizenResidentUs: false,
        citizenResidentUsFamily: false,
        itsGreenCard: false,
      );
}
