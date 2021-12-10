part of 'my_wallet_bloc.dart';

@freezed 
abstract class MyWalletState with _$MyWalletState {
  const factory MyWalletState.initial() = _initial;
  const factory MyWalletState.loading() = _loading;
  const factory MyWalletState.loadSuccess(MyWalletData data) = _loadSuccess;
  const factory MyWalletState.loadFailure(BaseFailure failure) = _loadFailure;
}