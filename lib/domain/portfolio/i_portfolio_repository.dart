

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/portfolio/portfolio_detail.dart';

abstract class IPortfolioRepository {
  Future<Either<BaseFailure, KtList<PortfolioDetail>>> getDetails();
}