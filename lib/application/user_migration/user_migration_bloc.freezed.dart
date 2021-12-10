// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_migration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$UserMigrationState {
  UserMigrationInfo get items;
  KtList<UserMigrationItem> get mensuales;
  KtList<UserMigrationItem> get trimestrales;
  KtList<UserMigrationItem> get quincenales;
  bool get mensualesDone;
  bool get quincenalesDone;
  bool get trimestralesDone;
  bool get pseDone;
  DashboardGoal get goalMensuales;
  DashboardGoal get goalQuincenales;
  DashboardGoal get goalTrimestrales;
  DashboardGoal get goalPse;
  bool get isLoading;
  bool get isPosted;
  Option<Either<BaseFailure, bool>> get fOrSuccess;
  Option<Either<BaseFailure, KtList<UserMigrationItem>>> get dataOrFailure;
  BalanceItem get balance;

  UserMigrationState copyWith(
      {UserMigrationInfo items,
      KtList<UserMigrationItem> mensuales,
      KtList<UserMigrationItem> trimestrales,
      KtList<UserMigrationItem> quincenales,
      bool mensualesDone,
      bool quincenalesDone,
      bool trimestralesDone,
      bool pseDone,
      DashboardGoal goalMensuales,
      DashboardGoal goalQuincenales,
      DashboardGoal goalTrimestrales,
      DashboardGoal goalPse,
      bool isLoading,
      bool isPosted,
      Option<Either<BaseFailure, bool>> fOrSuccess,
      Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure,
      BalanceItem balance});
}

class _$UserMigrationStateTearOff {
  const _$UserMigrationStateTearOff();

  _UserMigrationState call(
      {@required UserMigrationInfo items,
      @required KtList<UserMigrationItem> mensuales,
      @required KtList<UserMigrationItem> trimestrales,
      @required KtList<UserMigrationItem> quincenales,
      @required bool mensualesDone,
      @required bool quincenalesDone,
      @required bool trimestralesDone,
      @required bool pseDone,
      @required DashboardGoal goalMensuales,
      @required DashboardGoal goalQuincenales,
      @required DashboardGoal goalTrimestrales,
      @required DashboardGoal goalPse,
      @required bool isLoading,
      bool isPosted,
      @required Option<Either<BaseFailure, bool>> fOrSuccess,
      Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure,
      BalanceItem balance}) {
    return _UserMigrationState(
      items: items,
      mensuales: mensuales,
      trimestrales: trimestrales,
      quincenales: quincenales,
      mensualesDone: mensualesDone,
      quincenalesDone: quincenalesDone,
      trimestralesDone: trimestralesDone,
      pseDone: pseDone,
      goalMensuales: goalMensuales,
      goalQuincenales: goalQuincenales,
      goalTrimestrales: goalTrimestrales,
      goalPse: goalPse,
      isLoading: isLoading,
      isPosted: isPosted,
      fOrSuccess: fOrSuccess,
      dataOrFailure: dataOrFailure,
      balance: balance,
    );
  }
}

const $UserMigrationState = _$UserMigrationStateTearOff();

class _$_UserMigrationState
    with DiagnosticableTreeMixin
    implements _UserMigrationState {
  const _$_UserMigrationState(
      {@required this.items,
      @required this.mensuales,
      @required this.trimestrales,
      @required this.quincenales,
      @required this.mensualesDone,
      @required this.quincenalesDone,
      @required this.trimestralesDone,
      @required this.pseDone,
      @required this.goalMensuales,
      @required this.goalQuincenales,
      @required this.goalTrimestrales,
      @required this.goalPse,
      @required this.isLoading,
      this.isPosted,
      @required this.fOrSuccess,
      this.dataOrFailure,
      this.balance})
      : assert(items != null),
        assert(mensuales != null),
        assert(trimestrales != null),
        assert(quincenales != null),
        assert(mensualesDone != null),
        assert(quincenalesDone != null),
        assert(trimestralesDone != null),
        assert(pseDone != null),
        assert(goalMensuales != null),
        assert(goalQuincenales != null),
        assert(goalTrimestrales != null),
        assert(goalPse != null),
        assert(isLoading != null),
        assert(fOrSuccess != null);

  @override
  final UserMigrationInfo items;
  @override
  final KtList<UserMigrationItem> mensuales;
  @override
  final KtList<UserMigrationItem> trimestrales;
  @override
  final KtList<UserMigrationItem> quincenales;
  @override
  final bool mensualesDone;
  @override
  final bool quincenalesDone;
  @override
  final bool trimestralesDone;
  @override
  final bool pseDone;
  @override
  final DashboardGoal goalMensuales;
  @override
  final DashboardGoal goalQuincenales;
  @override
  final DashboardGoal goalTrimestrales;
  @override
  final DashboardGoal goalPse;
  @override
  final bool isLoading;
  @override
  final bool isPosted;
  @override
  final Option<Either<BaseFailure, bool>> fOrSuccess;
  @override
  final Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure;
  @override
  final BalanceItem balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationState(items: $items, mensuales: $mensuales, trimestrales: $trimestrales, quincenales: $quincenales, mensualesDone: $mensualesDone, quincenalesDone: $quincenalesDone, trimestralesDone: $trimestralesDone, pseDone: $pseDone, goalMensuales: $goalMensuales, goalQuincenales: $goalQuincenales, goalTrimestrales: $goalTrimestrales, goalPse: $goalPse, isLoading: $isLoading, isPosted: $isPosted, fOrSuccess: $fOrSuccess, dataOrFailure: $dataOrFailure, balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMigrationState'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('mensuales', mensuales))
      ..add(DiagnosticsProperty('trimestrales', trimestrales))
      ..add(DiagnosticsProperty('quincenales', quincenales))
      ..add(DiagnosticsProperty('mensualesDone', mensualesDone))
      ..add(DiagnosticsProperty('quincenalesDone', quincenalesDone))
      ..add(DiagnosticsProperty('trimestralesDone', trimestralesDone))
      ..add(DiagnosticsProperty('pseDone', pseDone))
      ..add(DiagnosticsProperty('goalMensuales', goalMensuales))
      ..add(DiagnosticsProperty('goalQuincenales', goalQuincenales))
      ..add(DiagnosticsProperty('goalTrimestrales', goalTrimestrales))
      ..add(DiagnosticsProperty('goalPse', goalPse))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isPosted', isPosted))
      ..add(DiagnosticsProperty('fOrSuccess', fOrSuccess))
      ..add(DiagnosticsProperty('dataOrFailure', dataOrFailure))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserMigrationState &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.mensuales, mensuales) ||
                const DeepCollectionEquality()
                    .equals(other.mensuales, mensuales)) &&
            (identical(other.trimestrales, trimestrales) ||
                const DeepCollectionEquality()
                    .equals(other.trimestrales, trimestrales)) &&
            (identical(other.quincenales, quincenales) ||
                const DeepCollectionEquality()
                    .equals(other.quincenales, quincenales)) &&
            (identical(other.mensualesDone, mensualesDone) ||
                const DeepCollectionEquality()
                    .equals(other.mensualesDone, mensualesDone)) &&
            (identical(other.quincenalesDone, quincenalesDone) ||
                const DeepCollectionEquality()
                    .equals(other.quincenalesDone, quincenalesDone)) &&
            (identical(other.trimestralesDone, trimestralesDone) ||
                const DeepCollectionEquality()
                    .equals(other.trimestralesDone, trimestralesDone)) &&
            (identical(other.pseDone, pseDone) ||
                const DeepCollectionEquality()
                    .equals(other.pseDone, pseDone)) &&
            (identical(other.goalMensuales, goalMensuales) ||
                const DeepCollectionEquality()
                    .equals(other.goalMensuales, goalMensuales)) &&
            (identical(other.goalQuincenales, goalQuincenales) ||
                const DeepCollectionEquality()
                    .equals(other.goalQuincenales, goalQuincenales)) &&
            (identical(other.goalTrimestrales, goalTrimestrales) ||
                const DeepCollectionEquality()
                    .equals(other.goalTrimestrales, goalTrimestrales)) &&
            (identical(other.goalPse, goalPse) ||
                const DeepCollectionEquality()
                    .equals(other.goalPse, goalPse)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isPosted, isPosted) ||
                const DeepCollectionEquality()
                    .equals(other.isPosted, isPosted)) &&
            (identical(other.fOrSuccess, fOrSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.fOrSuccess, fOrSuccess)) &&
            (identical(other.dataOrFailure, dataOrFailure) ||
                const DeepCollectionEquality()
                    .equals(other.dataOrFailure, dataOrFailure)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(mensuales) ^
      const DeepCollectionEquality().hash(trimestrales) ^
      const DeepCollectionEquality().hash(quincenales) ^
      const DeepCollectionEquality().hash(mensualesDone) ^
      const DeepCollectionEquality().hash(quincenalesDone) ^
      const DeepCollectionEquality().hash(trimestralesDone) ^
      const DeepCollectionEquality().hash(pseDone) ^
      const DeepCollectionEquality().hash(goalMensuales) ^
      const DeepCollectionEquality().hash(goalQuincenales) ^
      const DeepCollectionEquality().hash(goalTrimestrales) ^
      const DeepCollectionEquality().hash(goalPse) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isPosted) ^
      const DeepCollectionEquality().hash(fOrSuccess) ^
      const DeepCollectionEquality().hash(dataOrFailure) ^
      const DeepCollectionEquality().hash(balance);

  @override
  _$_UserMigrationState copyWith({
    Object items = freezed,
    Object mensuales = freezed,
    Object trimestrales = freezed,
    Object quincenales = freezed,
    Object mensualesDone = freezed,
    Object quincenalesDone = freezed,
    Object trimestralesDone = freezed,
    Object pseDone = freezed,
    Object goalMensuales = freezed,
    Object goalQuincenales = freezed,
    Object goalTrimestrales = freezed,
    Object goalPse = freezed,
    Object isLoading = freezed,
    Object isPosted = freezed,
    Object fOrSuccess = freezed,
    Object dataOrFailure = freezed,
    Object balance = freezed,
  }) {
    return _$_UserMigrationState(
      items: items == freezed ? this.items : items as UserMigrationInfo,
      mensuales: mensuales == freezed
          ? this.mensuales
          : mensuales as KtList<UserMigrationItem>,
      trimestrales: trimestrales == freezed
          ? this.trimestrales
          : trimestrales as KtList<UserMigrationItem>,
      quincenales: quincenales == freezed
          ? this.quincenales
          : quincenales as KtList<UserMigrationItem>,
      mensualesDone:
          mensualesDone == freezed ? this.mensualesDone : mensualesDone as bool,
      quincenalesDone: quincenalesDone == freezed
          ? this.quincenalesDone
          : quincenalesDone as bool,
      trimestralesDone: trimestralesDone == freezed
          ? this.trimestralesDone
          : trimestralesDone as bool,
      pseDone: pseDone == freezed ? this.pseDone : pseDone as bool,
      goalMensuales: goalMensuales == freezed
          ? this.goalMensuales
          : goalMensuales as DashboardGoal,
      goalQuincenales: goalQuincenales == freezed
          ? this.goalQuincenales
          : goalQuincenales as DashboardGoal,
      goalTrimestrales: goalTrimestrales == freezed
          ? this.goalTrimestrales
          : goalTrimestrales as DashboardGoal,
      goalPse: goalPse == freezed ? this.goalPse : goalPse as DashboardGoal,
      isLoading: isLoading == freezed ? this.isLoading : isLoading as bool,
      isPosted: isPosted == freezed ? this.isPosted : isPosted as bool,
      fOrSuccess: fOrSuccess == freezed
          ? this.fOrSuccess
          : fOrSuccess as Option<Either<BaseFailure, bool>>,
      dataOrFailure: dataOrFailure == freezed
          ? this.dataOrFailure
          : dataOrFailure
              as Option<Either<BaseFailure, KtList<UserMigrationItem>>>,
      balance: balance == freezed ? this.balance : balance as BalanceItem,
    );
  }
}

abstract class _UserMigrationState implements UserMigrationState {
  const factory _UserMigrationState(
      {@required UserMigrationInfo items,
      @required KtList<UserMigrationItem> mensuales,
      @required KtList<UserMigrationItem> trimestrales,
      @required KtList<UserMigrationItem> quincenales,
      @required bool mensualesDone,
      @required bool quincenalesDone,
      @required bool trimestralesDone,
      @required bool pseDone,
      @required DashboardGoal goalMensuales,
      @required DashboardGoal goalQuincenales,
      @required DashboardGoal goalTrimestrales,
      @required DashboardGoal goalPse,
      @required bool isLoading,
      bool isPosted,
      @required Option<Either<BaseFailure, bool>> fOrSuccess,
      Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure,
      BalanceItem balance}) = _$_UserMigrationState;

  @override
  UserMigrationInfo get items;
  @override
  KtList<UserMigrationItem> get mensuales;
  @override
  KtList<UserMigrationItem> get trimestrales;
  @override
  KtList<UserMigrationItem> get quincenales;
  @override
  bool get mensualesDone;
  @override
  bool get quincenalesDone;
  @override
  bool get trimestralesDone;
  @override
  bool get pseDone;
  @override
  DashboardGoal get goalMensuales;
  @override
  DashboardGoal get goalQuincenales;
  @override
  DashboardGoal get goalTrimestrales;
  @override
  DashboardGoal get goalPse;
  @override
  bool get isLoading;
  @override
  bool get isPosted;
  @override
  Option<Either<BaseFailure, bool>> get fOrSuccess;
  @override
  Option<Either<BaseFailure, KtList<UserMigrationItem>>> get dataOrFailure;
  @override
  BalanceItem get balance;

  @override
  _UserMigrationState copyWith(
      {UserMigrationInfo items,
      KtList<UserMigrationItem> mensuales,
      KtList<UserMigrationItem> trimestrales,
      KtList<UserMigrationItem> quincenales,
      bool mensualesDone,
      bool quincenalesDone,
      bool trimestralesDone,
      bool pseDone,
      DashboardGoal goalMensuales,
      DashboardGoal goalQuincenales,
      DashboardGoal goalTrimestrales,
      DashboardGoal goalPse,
      bool isLoading,
      bool isPosted,
      Option<Either<BaseFailure, bool>> fOrSuccess,
      Option<Either<BaseFailure, KtList<UserMigrationItem>>> dataOrFailure,
      BalanceItem balance});
}

mixin _$UserMigrationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  });
}

class _$UserMigrationEventTearOff {
  const _$UserMigrationEventTearOff();

  _getData getData() {
    return const _getData();
  }

  _loadData loadData(UserMigrationInfo item) {
    return _loadData(
      item,
    );
  }

  _saveGoal saveGoal(DashboardGoal goal, bool isPse) {
    return _saveGoal(
      goal,
      isPse,
    );
  }

  _postGoals postGoals() {
    return const _postGoals();
  }

  UpdateIntroductoryMigrate updateIntroductoryMigrate(bool valueParameter) {
    return UpdateIntroductoryMigrate(
      valueParameter,
    );
  }
}

const $UserMigrationEvent = _$UserMigrationEventTearOff();

class _$_getData with DiagnosticableTreeMixin implements _getData {
  const _$_getData();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationEvent.getData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserMigrationEvent.getData'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _getData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return getData();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getData != null) {
      return getData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return getData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _getData implements UserMigrationEvent {
  const factory _getData() = _$_getData;
}

class _$_loadData with DiagnosticableTreeMixin implements _loadData {
  const _$_loadData(this.item) : assert(item != null);

  @override
  final UserMigrationInfo item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationEvent.loadData(item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMigrationEvent.loadData'))
      ..add(DiagnosticsProperty('item', item));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _loadData &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(item);

  @override
  _$_loadData copyWith({
    Object item = freezed,
  }) {
    return _$_loadData(
      item == freezed ? this.item : item as UserMigrationInfo,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return loadData(item);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadData != null) {
      return loadData(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _loadData implements UserMigrationEvent {
  const factory _loadData(UserMigrationInfo item) = _$_loadData;

  UserMigrationInfo get item;

  _loadData copyWith({UserMigrationInfo item});
}

class _$_saveGoal with DiagnosticableTreeMixin implements _saveGoal {
  const _$_saveGoal(this.goal, this.isPse)
      : assert(goal != null),
        assert(isPse != null);

  @override
  final DashboardGoal goal;
  @override
  final bool isPse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationEvent.saveGoal(goal: $goal, isPse: $isPse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMigrationEvent.saveGoal'))
      ..add(DiagnosticsProperty('goal', goal))
      ..add(DiagnosticsProperty('isPse', isPse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _saveGoal &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.isPse, isPse) ||
                const DeepCollectionEquality().equals(other.isPse, isPse)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(isPse);

  @override
  _$_saveGoal copyWith({
    Object goal = freezed,
    Object isPse = freezed,
  }) {
    return _$_saveGoal(
      goal == freezed ? this.goal : goal as DashboardGoal,
      isPse == freezed ? this.isPse : isPse as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return saveGoal(goal, isPse);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveGoal != null) {
      return saveGoal(goal, isPse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return saveGoal(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveGoal != null) {
      return saveGoal(this);
    }
    return orElse();
  }
}

abstract class _saveGoal implements UserMigrationEvent {
  const factory _saveGoal(DashboardGoal goal, bool isPse) = _$_saveGoal;

  DashboardGoal get goal;
  bool get isPse;

  _saveGoal copyWith({DashboardGoal goal, bool isPse});
}

class _$_postGoals with DiagnosticableTreeMixin implements _postGoals {
  const _$_postGoals();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationEvent.postGoals()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMigrationEvent.postGoals'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _postGoals);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return postGoals();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postGoals != null) {
      return postGoals();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return postGoals(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (postGoals != null) {
      return postGoals(this);
    }
    return orElse();
  }
}

abstract class _postGoals implements UserMigrationEvent {
  const factory _postGoals() = _$_postGoals;
}

class _$UpdateIntroductoryMigrate
    with DiagnosticableTreeMixin
    implements UpdateIntroductoryMigrate {
  const _$UpdateIntroductoryMigrate(this.valueParameter)
      : assert(valueParameter != null);

  @override
  final bool valueParameter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMigrationEvent.updateIntroductoryMigrate(valueParameter: $valueParameter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'UserMigrationEvent.updateIntroductoryMigrate'))
      ..add(DiagnosticsProperty('valueParameter', valueParameter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateIntroductoryMigrate &&
            (identical(other.valueParameter, valueParameter) ||
                const DeepCollectionEquality()
                    .equals(other.valueParameter, valueParameter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(valueParameter);

  @override
  _$UpdateIntroductoryMigrate copyWith({
    Object valueParameter = freezed,
  }) {
    return _$UpdateIntroductoryMigrate(
      valueParameter == freezed ? this.valueParameter : valueParameter as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getData(),
    @required Result loadData(UserMigrationInfo item),
    @required Result saveGoal(DashboardGoal goal, bool isPse),
    @required Result postGoals(),
    @required Result updateIntroductoryMigrate(bool valueParameter),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return updateIntroductoryMigrate(valueParameter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getData(),
    Result loadData(UserMigrationInfo item),
    Result saveGoal(DashboardGoal goal, bool isPse),
    Result postGoals(),
    Result updateIntroductoryMigrate(bool valueParameter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateIntroductoryMigrate != null) {
      return updateIntroductoryMigrate(valueParameter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getData(_getData value),
    @required Result loadData(_loadData value),
    @required Result saveGoal(_saveGoal value),
    @required Result postGoals(_postGoals value),
    @required Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
  }) {
    assert(getData != null);
    assert(loadData != null);
    assert(saveGoal != null);
    assert(postGoals != null);
    assert(updateIntroductoryMigrate != null);
    return updateIntroductoryMigrate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getData(_getData value),
    Result loadData(_loadData value),
    Result saveGoal(_saveGoal value),
    Result postGoals(_postGoals value),
    Result updateIntroductoryMigrate(UpdateIntroductoryMigrate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (updateIntroductoryMigrate != null) {
      return updateIntroductoryMigrate(this);
    }
    return orElse();
  }
}

abstract class UpdateIntroductoryMigrate implements UserMigrationEvent {
  const factory UpdateIntroductoryMigrate(bool valueParameter) =
      _$UpdateIntroductoryMigrate;

  bool get valueParameter;

  UpdateIntroductoryMigrate copyWith({bool valueParameter});
}
