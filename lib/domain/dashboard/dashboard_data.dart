

import 'package:ualet/domain/dashboard/dashboard_investing_success.dart';
import 'package:ualet/domain/myaccount/user_info.dart';
import 'package:ualet/domain/notifications/notification_item_valid_read.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:ualet/domain/dashboard/dashboard_user_item.dart';

import 'dashboard_fund.dart';
import 'dashboard_goal.dart';

part 'dashboard_data.freezed.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    @required KtList<DashboardFund> funds,
    @required KtList<DashboardGoal> goals,
    @required DashboardUserItem user,
    @required DashboardTotalApprovedTransactionsItem approvedTransactions,
    bool verifyUserUpdateSarlaft,
    UserInfo userSarlaft,
    Map video,
    NotificationValidRead validNotification,
    String VerifyTheInvestmentUserFirsts
  }) = _DashboardData;

  factory DashboardData.empty() => DashboardData(
    funds: KtList.empty(),
    goals: KtList.empty(),
    user: DashboardUserItem.empty(),
    approvedTransactions: DashboardTotalApprovedTransactionsItem.empty(),
    verifyUserUpdateSarlaft: false,
    userSarlaft: UserInfo.empty(),
    video: {},
    validNotification: NotificationValidRead.empty(),
      VerifyTheInvestmentUserFirsts: ""
    );
}