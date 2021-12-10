// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portfolio_investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PortfolioInvestment {
  String get title;
  String get distribution;

  PortfolioInvestment copyWith({String title, String distribution});
}

class _$PortfolioInvestmentTearOff {
  const _$PortfolioInvestmentTearOff();

  _PortfolioInvestment call(
      {@required String title, @required String distribution}) {
    return _PortfolioInvestment(
      title: title,
      distribution: distribution,
    );
  }
}

const $PortfolioInvestment = _$PortfolioInvestmentTearOff();

class _$_PortfolioInvestment implements _PortfolioInvestment {
  const _$_PortfolioInvestment(
      {@required this.title, @required this.distribution})
      : assert(title != null),
        assert(distribution != null);

  @override
  final String title;
  @override
  final String distribution;

  @override
  String toString() {
    return 'PortfolioInvestment(title: $title, distribution: $distribution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortfolioInvestment &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.distribution, distribution) ||
                const DeepCollectionEquality()
                    .equals(other.distribution, distribution)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(distribution);

  @override
  _$_PortfolioInvestment copyWith({
    Object title = freezed,
    Object distribution = freezed,
  }) {
    return _$_PortfolioInvestment(
      title: title == freezed ? this.title : title as String,
      distribution:
          distribution == freezed ? this.distribution : distribution as String,
    );
  }
}

abstract class _PortfolioInvestment implements PortfolioInvestment {
  const factory _PortfolioInvestment(
      {@required String title,
      @required String distribution}) = _$_PortfolioInvestment;

  @override
  String get title;
  @override
  String get distribution;

  @override
  _PortfolioInvestment copyWith({String title, String distribution});
}
