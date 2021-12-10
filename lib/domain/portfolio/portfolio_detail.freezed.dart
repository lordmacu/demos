// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portfolio_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PortfolioDetail {
  String get type;
  String get icon;
  String get description;
  KtList<PortfolioInvestment> get investments;
  String get link;
  KtList<PortfolioDescriptionInvest> get descriptionInvest;

  PortfolioDetail copyWith(
      {String type,
      String icon,
      String description,
      KtList<PortfolioInvestment> investments,
      String link,
      KtList<PortfolioDescriptionInvest> descriptionInvest});
}

class _$PortfolioDetailTearOff {
  const _$PortfolioDetailTearOff();

  _PortfolioDetail call(
      {@required String type,
      @required String icon,
      @required String description,
      @required KtList<PortfolioInvestment> investments,
      @required String link,
      KtList<PortfolioDescriptionInvest> descriptionInvest}) {
    return _PortfolioDetail(
      type: type,
      icon: icon,
      description: description,
      investments: investments,
      link: link,
      descriptionInvest: descriptionInvest,
    );
  }
}

const $PortfolioDetail = _$PortfolioDetailTearOff();

class _$_PortfolioDetail implements _PortfolioDetail {
  const _$_PortfolioDetail(
      {@required this.type,
      @required this.icon,
      @required this.description,
      @required this.investments,
      @required this.link,
      this.descriptionInvest})
      : assert(type != null),
        assert(icon != null),
        assert(description != null),
        assert(investments != null),
        assert(link != null);

  @override
  final String type;
  @override
  final String icon;
  @override
  final String description;
  @override
  final KtList<PortfolioInvestment> investments;
  @override
  final String link;
  @override
  final KtList<PortfolioDescriptionInvest> descriptionInvest;

  @override
  String toString() {
    return 'PortfolioDetail(type: $type, icon: $icon, description: $description, investments: $investments, link: $link, descriptionInvest: $descriptionInvest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortfolioDetail &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.investments, investments) ||
                const DeepCollectionEquality()
                    .equals(other.investments, investments)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.descriptionInvest, descriptionInvest) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionInvest, descriptionInvest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(investments) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(descriptionInvest);

  @override
  _$_PortfolioDetail copyWith({
    Object type = freezed,
    Object icon = freezed,
    Object description = freezed,
    Object investments = freezed,
    Object link = freezed,
    Object descriptionInvest = freezed,
  }) {
    return _$_PortfolioDetail(
      type: type == freezed ? this.type : type as String,
      icon: icon == freezed ? this.icon : icon as String,
      description:
          description == freezed ? this.description : description as String,
      investments: investments == freezed
          ? this.investments
          : investments as KtList<PortfolioInvestment>,
      link: link == freezed ? this.link : link as String,
      descriptionInvest: descriptionInvest == freezed
          ? this.descriptionInvest
          : descriptionInvest as KtList<PortfolioDescriptionInvest>,
    );
  }
}

abstract class _PortfolioDetail implements PortfolioDetail {
  const factory _PortfolioDetail(
          {@required String type,
          @required String icon,
          @required String description,
          @required KtList<PortfolioInvestment> investments,
          @required String link,
          KtList<PortfolioDescriptionInvest> descriptionInvest}) =
      _$_PortfolioDetail;

  @override
  String get type;
  @override
  String get icon;
  @override
  String get description;
  @override
  KtList<PortfolioInvestment> get investments;
  @override
  String get link;
  @override
  KtList<PortfolioDescriptionInvest> get descriptionInvest;

  @override
  _PortfolioDetail copyWith(
      {String type,
      String icon,
      String description,
      KtList<PortfolioInvestment> investments,
      String link,
      KtList<PortfolioDescriptionInvest> descriptionInvest});
}
