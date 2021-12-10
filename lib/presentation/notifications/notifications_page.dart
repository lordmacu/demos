import 'package:ualet/application/notifications/notifications_bloc.dart';
import 'package:ualet/domain/notifications/notification_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:intl/intl.dart';
import 'package:ualet/domain/dashboard/i_dashbboard_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final formater = DateFormat.yMd('es_MX');

  double maximunInvestment=0.0;

  formatedNumber(number) {
    var formatCurrency;
    formatCurrency =
    new NumberFormat.simpleCurrency(locale: 'es_Mx', decimalDigits: 2);

    if (getIt<IEnv>().isColombia()) {
      formatCurrency = new NumberFormat.currency(
          customPattern: "\u00A4#,##0.00\u00A0",
          symbol: "\$",
          decimalDigits: 0,
          locale: "es");
    }


    return formatCurrency.format(number);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    var repoDashboard = getIt<IDashboardRepository>();

    repoDashboard.GetMaximumInvesment().then((value) {


      setState(() {
        maximunInvestment=value;

      });
      print("aquii el maxiumunasdf sadf asdf a ${maximunInvestment}");

    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsBloc>(
      create: (context) =>
          getIt<NotificationsBloc>()..add(NotificationsEvent.loadData()),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return state.maybeMap(
              loading: (_) => Stack(
                    children: <Widget>[
                      Container(
                        color: AppColors.primaryColor,
                      ),
                      LoadingInProgressOverlay(isLoading: true),
                    ],
                  ),
              initial: (_) => Container(),
              loadFailure: (error) => Container(
                    child: Text("Error :c"),
                  ),
              loadSuccess: (data) => _buildRoot(context, data.data),
              orElse: () => Container());
        },
      ),
    );
  }

  _buildRoot(BuildContext context, KtList<NotificationItem> notifications) {
    if (notifications.size > 0) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              _header(context),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildNotifications(notifications),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: AppDimens.layoutSpacerS,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: AppColors.primaryColor,
                      iconSize: 24.0,
                      onPressed: () {
                        ExtendedNavigator.rootNavigator.pop();
                        ExtendedNavigator.rootNavigator.pushReplacementNamed(
                          Routes.homePage,
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutMargin,
                      ),
                      child: Text(
                        S.of(context).notifications,
                        style: AppTextStyles.title2.copyWith(
                          color: AppColors.g25Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutSpacerM,
                ),
                margin: EdgeInsets.only(top: AppDimens.layoutSpacerXL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "😅",
                      style: TextStyle(fontSize: 40.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppDimens.layoutSpacerM,
                    ),
                    Text(
                      S.of(context).noNotificationsTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitle1.copyWith(
                          color: AppColors.g50Color,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _header(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.primaryColor,
            iconSize: 24.0,
            onPressed: () {
              ExtendedNavigator.rootNavigator.pop();
              ExtendedNavigator.rootNavigator.pushReplacementNamed(
                Routes.homePage,
              );
            },
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                S.of(context).notifications,
                style: AppTextStyles.title2.copyWith(
                  color: AppColors.g25Color,
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> buildNotifications(KtList<NotificationItem> notifications) {
    Map<String, List<Widget>> map = {};
    var formater2 = DateFormat.MMMM('es_Mx');
    for (var item in notifications.asList()) {
      String month = formater2.format(item.date);
      String monthCap =
          month.substring(0, 1).toUpperCase() + month.substring(1);
      String year = item.date.year.toString();
      String key = "$monthCap $year";
      bool first = false;
      if (!map.containsKey(key)) {
        map[key] = [];
        first = true;
      }
      if (!first) map[key].add(Divider());
      map[key].add(buildNotificationCard(item));
    }

    List<Widget> lst = [];
    List mapkeys = map.keys.toList()..sort();
    DateTime now = DateTime.now();

    if(maximunInvestment>0){
      lst.add(Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(AppDimens.layoutMarginS),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius:
              BorderRadius.circular(AppDimens.dialogBorderRadius),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    offset: Offset(0, 4),
                    spreadRadius: 0.5,
                    blurRadius: 8.0)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Text("Invierte este mes hasta ${formatedNumber(maximunInvestment)}",  style: AppTextStyles.normal8.copyWith(
                        fontWeight: FontWeight.bold,
                      ),),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: null,
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Color(0xFF41CF69),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "${now.day}/${now.month}/${now.year}",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.g101Color
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text("Por normas regulatorias puedes invertir hasta ${formatedNumber(maximunInvestment)} mensualmente \n\nTe invitamos a realizar el máximo disponible y el próximo mes, invertir más dinero.",  style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.g101Color
                  ),),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppDimens.layoutSpacerL,
          ),
        ],
      ),
    ));
    }

    for (var month in mapkeys) {
      lst.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Text(
                    month,
                    style:
                    AppTextStyles.subtitle2.copyWith(color: AppColors.g75Color),
                  ),

                ],
              ),
              SizedBox(
                height: AppDimens.layoutSpacerS,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(AppDimens.layoutMarginS),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppDimens.dialogBorderRadius),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        offset: Offset(0, 4),
                        spreadRadius: 0.5,
                        blurRadius: 8.0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: map[month],
                ),
              ),
              SizedBox(
                height: AppDimens.layoutSpacerL,
              ),
            ],
          ),
        ),
      );
    }
    return lst;
  }

  Widget buildNotificationCard(NotificationItem notification) {
    final theme = Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        accentColor: AppColors.g50Color,
        unselectedWidgetColor: AppColors.g50Color);
    return Theme(
      data: theme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text(
                notification.name,
                textAlign: TextAlign.start,
                style: AppTextStyles.normal8.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
             ],
          ),
          Text(
            formater.format(notification.date),
            textAlign: TextAlign.start,
            style: AppTextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.g101Color
            ),
          ),

          SizedBox(
            height: AppDimens.layoutSpacerXs,
          ),
          Text(
            notification.description,
            textAlign: TextAlign.start,
            style: AppTextStyles.caption1.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.g75Color,
            ),
          ),
          Row(
            children: [
              Text(
                notification.transactionStateName,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.g75Color,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
