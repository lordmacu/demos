import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'faq_item.dart';

abstract class IFAQRepository {
  Future<Either<BaseFailure, KtList<FAQItem>>> getFAQItems();
  Future<Either<BaseFailure, ProfilingResult>> getProfile();
}
