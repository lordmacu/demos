// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'withdrawal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$WithdrawalInfo {
  String get phoneNumber;
  List<BankInfo> get banksInfo;
  List<DashboardGoal> get goals;
  double get totaBalance;
  List<DebitInfo> get debits;
  List<BankInfo> get banksInfoDebits;
  bool get showPaint;
  String get validateTransactionMsg;
  DashboardUserItem get userInfo;

  WithdrawalInfo copyWith(
      {String phoneNumber,
      List<BankInfo> banksInfo,
      List<DashboardGoal> goals,
      double totaBalance,
      List<DebitInfo> debits,
      List<BankInfo> banksInfoDebits,
      bool showPaint,
      String validateTransactionMsg,
      DashboardUserItem userInfo});
}

class _$WithdrawalInfoTearOff {
  const _$WithdrawalInfoTearOff();

  _WithdrawalInfo call(
      {@required String phoneNumber,
      @required List<BankInfo> banksInfo,
      @required List<DashboardGoal> goals,
      @required double totaBalance,
      List<DebitInfo> debits,
      List<BankInfo> banksInfoDebits,
      bool showPaint,
      String validateTransactionMsg,
      DashboardUserItem userInfo}) {
    return _WithdrawalInfo(
      phoneNumber: phoneNumber,
      banksInfo: banksInfo,
      goals: goals,
      totaBalance: totaBalance,
      debits: debits,
      banksInfoDebits: banksInfoDebits,
      showPaint: showPaint,
      validateTransactionMsg: validateTransactionMsg,
      userInfo: userInfo,
    );
  }
}

const $WithdrawalInfo = _$WithdrawalInfoTearOff();

class _$_WithdrawalInfo implements _WithdrawalInfo {
  const _$_WithdrawalInfo(
      {@required this.phoneNumber,
      @required this.banksInfo,
      @required this.goals,
      @required this.totaBalance,
      this.debits,
      this.banksInfoDebits,
      this.showPaint,
      this.validateTransactionMsg,
      this.userInfo})
      : assert(phoneNumber != null),
        assert(banksInfo != null),
        assert(goals != null),
        assert(totaBalance != null);

  @override
  final String phoneNumber;
  @override
  final List<BankInfo> banksInfo;
  @override
  final List<DashboardGoal> goals;
  @override
  final double totaBalance;
  @override
  final List<DebitInfo> debits;
  @override
  final List<BankInfo> banksInfoDebits;
  @override
  final bool showPaint;
  @override
  final String validateTransactionMsg;
  @override
  final DashboardUserItem userInfo;

  @override
  String toString() {
    return 'WithdrawalInfo(phoneNumber: $phoneNumber, banksInfo: $banksInfo, goals: $goals, totaBalance: $totaBalance, debits: $debits, banksInfoDebits: $banksInfoDebits, showPaint: $showPaint, validateTransactionMsg: $validateTransactionMsg, userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawalInfo &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.banksInfo, banksInfo) ||
                const DeepCollectionEquality()
                    .equals(other.banksInfo, banksInfo)) &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)) &&
            (identical(other.totaBalance, totaBalance) ||
                const DeepCollectionEquality()
                    .equals(other.totaBalance, totaBalance)) &&
            (identical(other.debits, debits) ||
                const DeepCollectionEquality().equals(other.debits, debits)) &&
            (identical(other.banksInfoDebits, banksInfoDebits) ||
                const DeepCollectionEquality()
                    .equals(other.banksInfoDebits, banksInfoDebits)) &&
            (identical(other.showPaint, showPaint) ||
                const DeepCollectionEquality()
                    .equals(other.showPaint, showPaint)) &&
            (identical(other.validateTransactionMsg, validateTransactionMsg) ||
                const DeepCollectionEquality().equals(
                    other.validateTransactionMsg, validateTransactionMsg)) &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(banksInfo) ^
      const DeepCollectionEquality().hash(goals) ^
      const DeepCollectionEquality().hash(totaBalance) ^
      const DeepCollectionEquality().hash(debits) ^
      const DeepCollectionEquality().hash(banksInfoDebits) ^
      const DeepCollectionEquality().hash(showPaint) ^
      const DeepCollectionEquality().hash(validateTransactionMsg) ^
      const DeepCollectionEquality().hash(userInfo);

  @override
  _$_WithdrawalInfo copyWith({
    Object phoneNumber = freezed,
    Object banksInfo = freezed,
    Object goals = freezed,
    Object totaBalance = freezed,
    Object debits = freezed,
    Object banksInfoDebits = freezed,
    Object showPaint = freezed,
    Object validateTransactionMsg = freezed,
    Object userInfo = freezed,
  }) {
    return _$_WithdrawalInfo(
      phoneNumber:
          phoneNumber == freezed ? this.phoneNumber : phoneNumber as String,
      banksInfo:
          banksInfo == freezed ? this.banksInfo : banksInfo as List<BankInfo>,
      goals: goals == freezed ? this.goals : goals as List<DashboardGoal>,
      totaBalance:
          totaBalance == freezed ? this.totaBalance : totaBalance as double,
      debits: debits == freezed ? this.debits : debits as List<DebitInfo>,
      banksInfoDebits: banksInfoDebits == freezed
          ? this.banksInfoDebits
          : banksInfoDebits as List<BankInfo>,
      showPaint: showPaint == freezed ? this.showPaint : showPaint as bool,
      validateTransactionMsg: validateTransactionMsg == freezed
          ? this.validateTransactionMsg
          : validateTransactionMsg as String,
      userInfo:
          userInfo == freezed ? this.userInfo : userInfo as DashboardUserItem,
    );
  }
}

abstract class _WithdrawalInfo implements WithdrawalInfo {
  const factory _WithdrawalInfo(
      {@required String phoneNumber,
      @required List<BankInfo> banksInfo,
      @required List<DashboardGoal> goals,
      @required double totaBalance,
      List<DebitInfo> debits,
      List<BankInfo> banksInfoDebits,
      bool showPaint,
      String validateTransactionMsg,
      DashboardUserItem userInfo}) = _$_WithdrawalInfo;

  @override
  String get phoneNumber;
  @override
  List<BankInfo> get banksInfo;
  @override
  List<DashboardGoal> get goals;
  @override
  double get totaBalance;
  @override
  List<DebitInfo> get debits;
  @override
  List<BankInfo> get banksInfoDebits;
  @override
  bool get showPaint;
  @override
  String get validateTransactionMsg;
  @override
  DashboardUserItem get userInfo;

  @override
  _WithdrawalInfo copyWith(
      {String phoneNumber,
      List<BankInfo> banksInfo,
      List<DashboardGoal> goals,
      double totaBalance,
      List<DebitInfo> debits,
      List<BankInfo> banksInfoDebits,
      bool showPaint,
      String validateTransactionMsg,
      DashboardUserItem userInfo});
}
