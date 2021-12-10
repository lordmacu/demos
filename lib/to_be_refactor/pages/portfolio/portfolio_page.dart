import 'package:ualet/application/faq/faq_bloc.dart';
import 'package:ualet/presentation/help/widgets/support_help_page.dart';
import 'package:ualet/presentation/profile/widgets/faq_profile_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/application/dashboard/dashboard_bloc.dart';
import 'package:ualet/application/portfolio/portfolio_bloc.dart';
import 'package:ualet/domain/dashboard/dashboard_data.dart';
import 'package:ualet/domain/dashboard/dashboard_fund.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/dashboard/dashboard_user_item.dart';
import 'package:ualet/domain/portfolio/portfolio_detail.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/models/portfolio/slider_portfolio.dart';
import 'package:ualet/to_be_refactor/pages/home/widgets/fundOverviewWidget.dart';
import 'package:ualet/to_be_refactor/pages/portfolio/widgets/portfolio_widget.dart';
import 'package:ualet/to_be_refactor/pages/portfolio/widgets/portfolio_widget_mx.dart';
import 'package:ualet/to_be_refactor/widgets/profile_faq_widget.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots_portfolio.dart';

class PortfolioPage extends StatefulWidget {
  final int selectedFundIndex;

  PortfolioPage({Key key, this.selectedFundIndex}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState(selectedFundIndex);
}

class _PortfolioPageState extends State<PortfolioPage> {
  final int selectedFundIndex;
  _PortfolioPageState(this.selectedFundIndex);

  int _currentPage = 0;
  PageController _pageController;

  int _numPages = 0;
  bool isLeft = true;
  @override
  void initState() {
    _currentPage = selectedFundIndex;
    _pageController = PageController(initialPage: selectedFundIndex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _pageController = PageController(initialPage: index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PortfolioBloc>(
          create: (context) =>
              getIt<PortfolioBloc>()..add(PortfolioEvent.getInformation()),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) =>
              getIt<DashboardBloc>()..add(DashboardEvent.getInformation()),
        ),
        BlocProvider<FAQBloc>(
          create: (context) => getIt<FAQBloc>()..add(FAQEvent.getFAQItems()),
        )
      ],
      child: Scaffold(body:
          //Portfolio Bloc
          BlocBuilder<PortfolioBloc, PortfolioState>(builder: (context, state) {
        return state.maybeMap(
          loading: (_) => Stack(
            children: <Widget>[
              Container(
                color: AppColors.primaryColor,
              ),
              LoadingInProgressOverlay(isLoading: true),
            ],
          ),
          loadFailure: (state) {
            return Text('error :c');
          },
          loadSuccess: (statePortfolio) {
            //Dashboard Bloc
            return BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, stateDashboard) {
                return stateDashboard.maybeMap(
                  orElse: () => Text('wth :c'),
                  initial: (s) => Text('initial'),
                  loadFail: (s) => Text('otro error :c'),
                  loading: (s) => Stack(
                    children: <Widget>[
                      Container(
                        color: AppColors.primaryColor,
                      ),
                      LoadingInProgressOverlay(isLoading: true),
                    ],
                  ),
                  loadSuccess: (dashboardData) {
                    print("DashboardFundsSize");
                    print(dashboardData.data.funds.size);
                    return BlocBuilder<FAQBloc, FAQState>(
                      builder: (context, state) {
                        return state.map(
                            initial: (_) => Container(),
                            loadInProgress: (_) => Stack(
                                  children: <Widget>[
                                    Container(
                                      color: AppColors.backgroundColor,
                                    ),
                                    LoadingInProgressOverlay(isLoading: true)
                                  ],
                                ),
                            loadSuccess: (state) {
                              List faq = new List();
                              List support = new List();
                              String name = state.faqItems.asList()[0].name;
                              state.faqItems.asList().forEach((element) {
                                if (element.type == "Portfolio") {
                                  faq.add(element.faq);
                                } else if (element.type == "Support") {
                                  support.add(element.faq);
                                }
                              });
                              _numPages = dashboardData.data.funds.size;
                              return buildRoot(statePortfolio.details,
                                  dashboardData.data, faq, support, name);
                            },
                            loadFailure: (state) => Container());
                      },
                    );
                  },
                );
              },
            );
          },
          orElse: () => Container(),
        );
      })),
    );
  }

  Container buildRoot(KtList<PortfolioDetail> details,
      DashboardData dashboardData, faq, support, name) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: ListView(
          primary: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _header(),
            _roboadvisorDisclamer(),
            SizedBox(height: 10.0),
            _sectionSliderFoundInversion(dashboardData, details),
            SizedBox(height: 30.0),

            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _profileFaq(context, faq, support, name),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textDinamic(String text, Color color, String font, double fontSize) {
    return Text(text,
        style:
            TextStyle(color: color, fontFamily: '$font', fontSize: fontSize));
  }

  Widget _header() {
    var _media = MediaQuery.of(context).size;
    return Container(
      width: _media.width * 1.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    ExtendedNavigator.rootNavigator.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                    size: 25.0,
                  ),
                ),
                Text(
                  S.of(context).knowYourPortfolio,
                  style: TextStyle(
                      color: AppColors.g75Color,
                      fontFamily: 'open-sans-semi-bold',
                      fontSize: 18.0),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 25.0,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.notificationsPage);
            },
          )
        ],
      ),
    );
  }

  Widget _roboadvisorDisclamer() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          S.of(context).roboAdvisorDisclamer,
          style: AppTextStyles.normal4,
        ));
  }

  Widget _sectionSliderFoundInversion(
      DashboardData dashboardData, KtList<PortfolioDetail> details) {
    var _media = MediaQuery.of(context).size;

    return Container(
      height: _media.height * 1.2,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: dashboardData.funds.size,
        itemBuilder: (ctx, i) => SliderPortfolioItem(
          dots: _sectionDots(dashboardData),
          dData: dashboardData,
          index: i,
          details: details,
        ),
      ),
    );
   /* return Container(
      height: _media.height * 1.1,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: dashboardData.funds.size,
        itemBuilder: (ctx, i) => SliderPortfolioItem(
          dots: _sectionDots(dashboardData),
          dData: dashboardData,
          index: i,
          details: details,
        ),
      ),
    );*/
  }

  Widget _sectionDots(DashboardData dData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < dData.funds.size; i++)
            if (i == _currentPage)
              SlideDotsPortfolio(true)
            else
              SlideDotsPortfolio(false)
        ],
      ),
    );
  }

  Widget _profileFaq(context, faq, support, name) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: 500,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    S.of(context).knowAllYourPortfolio,
                    style: AppTextStyles.subtitle2
                        .copyWith(color: AppColors.g75Color),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(
                height: AppDimens.layoutSpacerM,
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      setState(() {
                        isLeft = true;
                      });
                    } else if (i == 1) {
                      setState(() {
                        isLeft = false;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: FAQProfilePage(
                        items: faq,
                        name: name,
                        namePage: 'portafolio',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
