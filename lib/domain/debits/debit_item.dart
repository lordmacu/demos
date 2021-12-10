import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/goals/goal_item.dart';

part 'debit_item.freezed.dart';

@freezed
abstract class DebitItem with _$DebitItem {
  const factory DebitItem({
    @required int id,
    @required String debitBank,
    @required String accNumber,
    @required String accountType,
    @required String bankImageUrl,
    @required DashboardGoal linkedGoal,
  }) = _DebitItem;

  factory DebitItem.empty() => DebitItem(
        id: -1,
        debitBank: '',
        accNumber: '',
        accountType: '',
        bankImageUrl: '',
        linkedGoal: DashboardGoal.empty(),
      );

  factory DebitItem.mock() => DebitItem(
        id: 1,
        accNumber: '3200',
        accountType: 'Cuenta de ahorros',
        debitBank: 'Bancolombia',
        bankImageUrl:
            'https://cdn.banlinea.com/banlinea-products/UALET/V2.0/bankLogo/AccendoBanco.jpg',
        linkedGoal: DashboardGoal.mock(),
      );
}
