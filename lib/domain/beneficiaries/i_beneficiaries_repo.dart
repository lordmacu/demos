import 'package:ualet/domain/core/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'beneficiary_item.dart';

abstract class IBeneficiariesRepo {
  Future<Either<BaseFailure, bool>> postBeneficiaries(
      KtList<BeneficiaryItem> benficiaries, KtList<BeneficiaryItem> deleteList);
  Future<Either<BaseFailure, KtList<BeneficiaryItem>>> getBeneficiaries(); 
}
