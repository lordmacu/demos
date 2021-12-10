// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'balance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BalanceItem {
  double get balance;
  String get profileName;

  BalanceItem copyWith({double balance, String profileName});
}

class _$BalanceItemTearOff {
  const _$BalanceItemTearOff();

  _BalanceItem call({double balance, String profileName}) {
    return _BalanceItem(
      balance: balance,
      profileName: profileName,
    );
  }
}

const $BalanceItem = _$BalanceItemTearOff();

class _$_BalanceItem implements _BalanceItem {
  const _$_BalanceItem({this.balance, this.profileName});

  @override
  final double balance;
  @override
  final String profileName;

  @override
  String toString() {
    return 'BalanceItem(balance: $balance, profileName: $profileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BalanceItem &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.profileName, profileName) ||
                const DeepCollectionEquality()
                    .equals(other.profileName, profileName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(profileName);

  @override
  _$_BalanceItem copyWith({
    Object balance = freezed,
    Object profileName = freezed,
  }) {
    return _$_BalanceItem(
      balance: balance == freezed ? this.balance : balance as double,
      profileName:
          profileName == freezed ? this.profileName : profileName as String,
    );
  }
}

abstract class _BalanceItem implements BalanceItem {
  const factory _BalanceItem({double balance, String profileName}) =
      _$_BalanceItem;

  @override
  double get balance;
  @override
  String get profileName;

  @override
  _BalanceItem copyWith({double balance, String profileName});
}
