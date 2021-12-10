// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dashboard_fund.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$DashboardFund {
  String get name;
  double get participationPercentage;
  String get logo;
  KtList<PortfolioInvestment> get assetType;
  double get balance;
  Color get color;
  int get id;
  int get titulos;
  String get description;

  DashboardFund copyWith(
      {String name,
      double participationPercentage,
      String logo,
      KtList<PortfolioInvestment> assetType,
      double balance,
      Color color,
      int id,
      int titulos,
      String description});
}

class _$DashboardFundTearOff {
  const _$DashboardFundTearOff();

  _DashboardFund call(
      {@required String name,
      @required double participationPercentage,
      @required String logo,
      @required KtList<PortfolioInvestment> assetType,
      @required double balance,
      @required Color color,
      @required int id,
      int titulos,
      String description}) {
    return _DashboardFund(
      name: name,
      participationPercentage: participationPercentage,
      logo: logo,
      assetType: assetType,
      balance: balance,
      color: color,
      id: id,
      titulos: titulos,
      description: description,
    );
  }
}

const $DashboardFund = _$DashboardFundTearOff();

class _$_DashboardFund implements _DashboardFund {
  const _$_DashboardFund(
      {@required this.name,
      @required this.participationPercentage,
      @required this.logo,
      @required this.assetType,
      @required this.balance,
      @required this.color,
      @required this.id,
      this.titulos,
      this.description})
      : assert(name != null),
        assert(participationPercentage != null),
        assert(logo != null),
        assert(assetType != null),
        assert(balance != null),
        assert(color != null),
        assert(id != null);

  @override
  final String name;
  @override
  final double participationPercentage;
  @override
  final String logo;
  @override
  final KtList<PortfolioInvestment> assetType;
  @override
  final double balance;
  @override
  final Color color;
  @override
  final int id;
  @override
  final int titulos;
  @override
  final String description;

  @override
  String toString() {
    return 'DashboardFund(name: $name, participationPercentage: $participationPercentage, logo: $logo, assetType: $assetType, balance: $balance, color: $color, id: $id, titulos: $titulos, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardFund &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(
                    other.participationPercentage, participationPercentage) ||
                const DeepCollectionEquality().equals(
                    other.participationPercentage, participationPercentage)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.assetType, assetType) ||
                const DeepCollectionEquality()
                    .equals(other.assetType, assetType)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.titulos, titulos) ||
                const DeepCollectionEquality()
                    .equals(other.titulos, titulos)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(participationPercentage) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(assetType) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(titulos) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$_DashboardFund copyWith({
    Object name = freezed,
    Object participationPercentage = freezed,
    Object logo = freezed,
    Object assetType = freezed,
    Object balance = freezed,
    Object color = freezed,
    Object id = freezed,
    Object titulos = freezed,
    Object description = freezed,
  }) {
    return _$_DashboardFund(
      name: name == freezed ? this.name : name as String,
      participationPercentage: participationPercentage == freezed
          ? this.participationPercentage
          : participationPercentage as double,
      logo: logo == freezed ? this.logo : logo as String,
      assetType: assetType == freezed
          ? this.assetType
          : assetType as KtList<PortfolioInvestment>,
      balance: balance == freezed ? this.balance : balance as double,
      color: color == freezed ? this.color : color as Color,
      id: id == freezed ? this.id : id as int,
      titulos: titulos == freezed ? this.titulos : titulos as int,
      description:
          description == freezed ? this.description : description as String,
    );
  }
}

abstract class _DashboardFund implements DashboardFund {
  const factory _DashboardFund(
      {@required String name,
      @required double participationPercentage,
      @required String logo,
      @required KtList<PortfolioInvestment> assetType,
      @required double balance,
      @required Color color,
      @required int id,
      int titulos,
      String description}) = _$_DashboardFund;

  @override
  String get name;
  @override
  double get participationPercentage;
  @override
  String get logo;
  @override
  KtList<PortfolioInvestment> get assetType;
  @override
  double get balance;
  @override
  Color get color;
  @override
  int get id;
  @override
  int get titulos;
  @override
  String get description;

  @override
  _DashboardFund copyWith(
      {String name,
      double participationPercentage,
      String logo,
      KtList<PortfolioInvestment> assetType,
      double balance,
      Color color,
      int id,
      int titulos,
      String description});
}
