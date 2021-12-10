part of 'beneficiaries_bloc.dart';

@freezed
abstract class BeneficiariesState with _$BeneficiariesState {
  const factory BeneficiariesState({
    @required KtList<BeneficiaryItem> benficiaries,
    @required bool isLoading,
    @required String error,
    @required Option<Either<BaseFailure, bool>> postOrFailure,
    @required bool isUpdate,
    @required KtList<BeneficiaryItem> deleted,
  }) = _BeneficiariesState;

  factory BeneficiariesState.initial() => BeneficiariesState(
        benficiaries: KtList.empty(),
        isLoading: false,
        error: '',
        postOrFailure: none(),
        isUpdate: false,
        deleted: KtList.empty(),
      );
}
