import 'package:ualet/domain/withdrawalMX/debit_info.dart';
import 'package:dartz/dartz.dart';
import 'package:ualet/domain/core/base_failures.dart';

import 'bank_account_item.dart';
import 'my_wallet_data.dart';

abstract class IMyWalletRepository {
  Future<Either<BaseFailure, MyWalletData>> getData();
  Future<Either<BaseFailure, bool>> deleteAccount(BankAccountItem bankAccount);
  Future<Either<BaseFailure, bool>> deleteDebit(DebitInfo debit);
  Future<Either<BaseFailure, bool>> editDebit(DebitInfo debit);
}
