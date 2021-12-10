// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$UserInfo {
  String get fullName;
  String get firstName;
  String get email;
  String get phoneNumber;
  SarlaftItem get sarlaftItem;
  bool get hasSarlaft;
  double get balance;

  UserInfo copyWith(
      {String fullName,
      String firstName,
      String email,
      String phoneNumber,
      SarlaftItem sarlaftItem,
      bool hasSarlaft,
      double balance});
}

class _$UserInfoTearOff {
  const _$UserInfoTearOff();

  _UserInfo call(
      {@required String fullName,
      String firstName,
      @required String email,
      @required String phoneNumber,
      @required SarlaftItem sarlaftItem,
      @required bool hasSarlaft,
      double balance}) {
    return _UserInfo(
      fullName: fullName,
      firstName: firstName,
      email: email,
      phoneNumber: phoneNumber,
      sarlaftItem: sarlaftItem,
      hasSarlaft: hasSarlaft,
      balance: balance,
    );
  }
}

const $UserInfo = _$UserInfoTearOff();

class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {@required this.fullName,
      this.firstName,
      @required this.email,
      @required this.phoneNumber,
      @required this.sarlaftItem,
      @required this.hasSarlaft,
      this.balance})
      : assert(fullName != null),
        assert(email != null),
        assert(phoneNumber != null),
        assert(sarlaftItem != null),
        assert(hasSarlaft != null);

  @override
  final String fullName;
  @override
  final String firstName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final SarlaftItem sarlaftItem;
  @override
  final bool hasSarlaft;
  @override
  final double balance;

  @override
  String toString() {
    return 'UserInfo(fullName: $fullName, firstName: $firstName, email: $email, phoneNumber: $phoneNumber, sarlaftItem: $sarlaftItem, hasSarlaft: $hasSarlaft, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInfo &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.sarlaftItem, sarlaftItem) ||
                const DeepCollectionEquality()
                    .equals(other.sarlaftItem, sarlaftItem)) &&
            (identical(other.hasSarlaft, hasSarlaft) ||
                const DeepCollectionEquality()
                    .equals(other.hasSarlaft, hasSarlaft)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(sarlaftItem) ^
      const DeepCollectionEquality().hash(hasSarlaft) ^
      const DeepCollectionEquality().hash(balance);

  @override
  _$_UserInfo copyWith({
    Object fullName = freezed,
    Object firstName = freezed,
    Object email = freezed,
    Object phoneNumber = freezed,
    Object sarlaftItem = freezed,
    Object hasSarlaft = freezed,
    Object balance = freezed,
  }) {
    return _$_UserInfo(
      fullName: fullName == freezed ? this.fullName : fullName as String,
      firstName: firstName == freezed ? this.firstName : firstName as String,
      email: email == freezed ? this.email : email as String,
      phoneNumber:
          phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      sarlaftItem: sarlaftItem == freezed
          ? this.sarlaftItem
          : sarlaftItem as SarlaftItem,
      hasSarlaft: hasSarlaft == freezed ? this.hasSarlaft : hasSarlaft as bool,
      balance: balance == freezed ? this.balance : balance as double,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {@required String fullName,
      String firstName,
      @required String email,
      @required String phoneNumber,
      @required SarlaftItem sarlaftItem,
      @required bool hasSarlaft,
      double balance}) = _$_UserInfo;

  @override
  String get fullName;
  @override
  String get firstName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  SarlaftItem get sarlaftItem;
  @override
  bool get hasSarlaft;
  @override
  double get balance;

  @override
  _UserInfo copyWith(
      {String fullName,
      String firstName,
      String email,
      String phoneNumber,
      SarlaftItem sarlaftItem,
      bool hasSarlaft,
      double balance});
}
