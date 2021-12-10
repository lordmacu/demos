// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portfolio_description_invest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PortfolioDescriptionInvest {
  String get title;
  String get subTitle;

  PortfolioDescriptionInvest copyWith({String title, String subTitle});
}

class _$PortfolioDescriptionInvestTearOff {
  const _$PortfolioDescriptionInvestTearOff();

  _PortfolioDescriptionInvest call(
      {@required String title, @required String subTitle}) {
    return _PortfolioDescriptionInvest(
      title: title,
      subTitle: subTitle,
    );
  }
}

const $PortfolioDescriptionInvest = _$PortfolioDescriptionInvestTearOff();

class _$_PortfolioDescriptionInvest implements _PortfolioDescriptionInvest {
  const _$_PortfolioDescriptionInvest(
      {@required this.title, @required this.subTitle})
      : assert(title != null),
        assert(subTitle != null);

  @override
  final String title;
  @override
  final String subTitle;

  @override
  String toString() {
    return 'PortfolioDescriptionInvest(title: $title, subTitle: $subTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortfolioDescriptionInvest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subTitle, subTitle) ||
                const DeepCollectionEquality()
                    .equals(other.subTitle, subTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subTitle);

  @override
  _$_PortfolioDescriptionInvest copyWith({
    Object title = freezed,
    Object subTitle = freezed,
  }) {
    return _$_PortfolioDescriptionInvest(
      title: title == freezed ? this.title : title as String,
      subTitle: subTitle == freezed ? this.subTitle : subTitle as String,
    );
  }
}

abstract class _PortfolioDescriptionInvest
    implements PortfolioDescriptionInvest {
  const factory _PortfolioDescriptionInvest(
      {@required String title,
      @required String subTitle}) = _$_PortfolioDescriptionInvest;

  @override
  String get title;
  @override
  String get subTitle;

  @override
  _PortfolioDescriptionInvest copyWith({String title, String subTitle});
}
