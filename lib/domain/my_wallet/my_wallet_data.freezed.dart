// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'my_wallet_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$MyWalletData {
  KtList<DebitInfo> get debitsList;
  KtList<DashboardGoal> get goalsList;
  KtList<BankAccountItem> get accountsList;
  bool get showPaint;

  MyWalletData copyWith(
      {KtList<DebitInfo> debitsList,
      KtList<DashboardGoal> goalsList,
      KtList<BankAccountItem> accountsList,
      bool showPaint});
}

class _$MyWalletDataTearOff {
  const _$MyWalletDataTearOff();

  _MyWalletData call(
      {@required KtList<DebitInfo> debitsList,
      @required KtList<DashboardGoal> goalsList,
      @required KtList<BankAccountItem> accountsList,
      @required bool showPaint}) {
    return _MyWalletData(
      debitsList: debitsList,
      goalsList: goalsList,
      accountsList: accountsList,
      showPaint: showPaint,
    );
  }
}

const $MyWalletData = _$MyWalletDataTearOff();

class _$_MyWalletData implements _MyWalletData {
  const _$_MyWalletData(
      {@required this.debitsList,
      @required this.goalsList,
      @required this.accountsList,
      @required this.showPaint})
      : assert(debitsList != null),
        assert(goalsList != null),
        assert(accountsList != null),
        assert(showPaint != null);

  @override
  final KtList<DebitInfo> debitsList;
  @override
  final KtList<DashboardGoal> goalsList;
  @override
  final KtList<BankAccountItem> accountsList;
  @override
  final bool showPaint;

  @override
  String toString() {
    return 'MyWalletData(debitsList: $debitsList, goalsList: $goalsList, accountsList: $accountsList, showPaint: $showPaint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyWalletData &&
            (identical(other.debitsList, debitsList) ||
                const DeepCollectionEquality()
                    .equals(other.debitsList, debitsList)) &&
            (identical(other.goalsList, goalsList) ||
                const DeepCollectionEquality()
                    .equals(other.goalsList, goalsList)) &&
            (identical(other.accountsList, accountsList) ||
                const DeepCollectionEquality()
                    .equals(other.accountsList, accountsList)) &&
            (identical(other.showPaint, showPaint) ||
                const DeepCollectionEquality()
                    .equals(other.showPaint, showPaint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(debitsList) ^
      const DeepCollectionEquality().hash(goalsList) ^
      const DeepCollectionEquality().hash(accountsList) ^
      const DeepCollectionEquality().hash(showPaint);

  @override
  _$_MyWalletData copyWith({
    Object debitsList = freezed,
    Object goalsList = freezed,
    Object accountsList = freezed,
    Object showPaint = freezed,
  }) {
    return _$_MyWalletData(
      debitsList: debitsList == freezed
          ? this.debitsList
          : debitsList as KtList<DebitInfo>,
      goalsList: goalsList == freezed
          ? this.goalsList
          : goalsList as KtList<DashboardGoal>,
      accountsList: accountsList == freezed
          ? this.accountsList
          : accountsList as KtList<BankAccountItem>,
      showPaint: showPaint == freezed ? this.showPaint : showPaint as bool,
    );
  }
}

abstract class _MyWalletData implements MyWalletData {
  const factory _MyWalletData(
      {@required KtList<DebitInfo> debitsList,
      @required KtList<DashboardGoal> goalsList,
      @required KtList<BankAccountItem> accountsList,
      @required bool showPaint}) = _$_MyWalletData;

  @override
  KtList<DebitInfo> get debitsList;
  @override
  KtList<DashboardGoal> get goalsList;
  @override
  KtList<BankAccountItem> get accountsList;
  @override
  bool get showPaint;

  @override
  _MyWalletData copyWith(
      {KtList<DebitInfo> debitsList,
      KtList<DashboardGoal> goalsList,
      KtList<BankAccountItem> accountsList,
      bool showPaint});
}
