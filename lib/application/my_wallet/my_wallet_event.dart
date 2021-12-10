part of 'my_wallet_bloc.dart';

@freezed 
abstract class MyWalletEvent with _$MyWalletEvent {
  const factory MyWalletEvent.loadData() = _loadData;
  
}