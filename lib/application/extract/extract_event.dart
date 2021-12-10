part of 'extract_bloc.dart';

@freezed
abstract class ExtractEvent with _$ExtractEvent {
  const factory ExtractEvent.getExtractItems() = _GetExtractItems;
  const factory ExtractEvent.extractItemsReceived(
          Either<BaseFailure, KtList<ExtractItem>> failureOrItems,
          Either<BaseFailure, KtList<ExtractItem>> failureOrItemsCertificate) =
      _ExtractItemsReceived;
  const factory ExtractEvent.generateExtract(String year, String month) =
      _GenerateExtract;
  const factory ExtractEvent.generateCertificate(String year, String month) =
      _GenerateCertificate;
}
