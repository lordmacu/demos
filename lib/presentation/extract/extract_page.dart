import 'package:ualet/application/extract/extract_bloc.dart';
import 'package:ualet/domain/extract/Extract_item.dart';
import 'package:ualet/domain/extract/i_extract_repository.dart';
import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/bubble_indication_painter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/generated/l10n.dart';

import '../../injection.dart';
import 'widgets/indication_painter_extract.dart';

class ExtractPage extends StatefulWidget {
  ExtractPage({Key key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  PageController _pageController;
  Color left = AppColors.primaryColor;
  Color right = AppColors.g25Color;
  bool isLeft = true;
  bool showMoreExtracts;
  bool showMoreCertificates;
  List<ExtractItem> data = [];
  List<ExtractItem> dataCertificates = [];
  bool isLoading = false;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    showMoreExtracts = false;
    showMoreCertificates = false;
    _pageController = PageController();
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ExtractBloc>(
            create: (context) =>
                getIt<ExtractBloc>()..add(ExtractEvent.getExtractItems()),
          ),
        ],
        child: BlocBuilder<ExtractBloc, ExtractState>(
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
                  data.clear();
                  dataCertificates.clear();

                  //Listado de extractos
                  for (var item in state.extractItems.asList()) {
                    data.add(item);
                  }
                  data.sort((a, b) => a.order.compareTo(b.order));

                  //Listado de certificaciones
                  for (var item in state.extractItemsCertificate.asList()) {
                    dataCertificates.add(item);
                  }
                  return _body(context);
                },
                loadFailure: (state) => Container());
          },
        ));
  }

  Widget _body(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.layoutMargin,
                    vertical: AppDimens.layoutMarginXS),
                child: Container(
                  width: _media.width * 1.0,
                  height: _media.height * 1.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _return(),
                      _title(),
                      _textDescriptionExtract(),
                      _buildMenuBar(),
                      Expanded(
                        flex: 2,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (i) {
                            if (i == 0) {
                              setState(() {
                                right = AppColors.g25Color;
                                left = AppColors.primaryColor;
                              });
                            } else if (i == 1) {
                              setState(() {
                                right = AppColors.primaryColor;
                                left = AppColors.g25Color;
                              });
                            }
                          },
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                              children: [
                                _buildExtracts(context),
                              ],
                            ),
                            ListView(
                              shrinkWrap: true,
                              children: [
                                _buildCertifications(context),
                              ],
                            ),
                            // ConstrainedBox(
                            //   constraints: const BoxConstraints.expand(),
                            //   child: _buildCertifications(),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LoadingInProgressOverlay(isLoading: isLoading),
          ],
        ),
      ),
    );
  }

  returnPop() {
    return Navigator.of(context).pop();
  }

  Widget _return() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryColor,
        size: AppDimens.buttonBackS.height,
      ),
      onPressed: () {
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.homePage);
      },
    );
  }

  Widget _title() {
    return Container(
        padding: EdgeInsets.only(left: AppDimens.layoutSpacerHeader),
        child: Text(S.of(context).extract,
            style: AppTextStyles.title2.copyWith(color: AppColors.g25Color)));
  }

  Widget _textDescriptionExtract() {
    return Container(
        padding: EdgeInsets.only(
            left: AppDimens.layoutSpacerHeader,
            top: AppDimens.layoutSpacerML,
            bottom: AppDimens.layoutSpacerML),
        child: Text(S.of(context).extractDescription,
            textAlign: TextAlign.left, style: AppTextStyles.normal4));
  }

  Widget _buildMenuBar() {
    return Center(
      child: Container(
        width: AppDimens.layoutSpacerX * 3.4,
        // height: AppDimens.layoutSpacerS * 5.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  offset: Offset(0, 4),
                  spreadRadius: 0.5,
                  blurRadius: 8.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.dialogBorderRadius),
            ),
            color: AppColors.whiteColor),
        child: CustomPaint(
          painter: TabIndicationPainter(
              pageController: _pageController, radius: 21.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: _onSignInButtonPress,
                  child: Text(S.of(context).extract,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.normal2
                          .copyWith(color: left, fontSize: 12)),
                ),
              ),
              Expanded(
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: (_onSignUpButtonPress),
                  child: Text(S.of(context).controlCertifications,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.normal2
                          .copyWith(color: right, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExtracts(BuildContext context) {
    return Container(
      width: AppDimens.layoutSpacerX * 3.6,
      padding: EdgeInsets.only(top: AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          data == null || data.length == 0
              ? _extractsNotFound()
              : _buildSectionExtract(context)
        ],
      ),
    );
  }

  List<Widget> _buildExtractsDetail(BuildContext context) {
    var row = List<Widget>();
    int maxInitialSize = 4;
    int limit = 0;
    if (data.length <= maxInitialSize) {
      limit = data.length;
    } else {
      limit = showMoreExtracts ? data.length : maxInitialSize;
    }
    for (int i = 0; i < limit; i++) {
      var item = data[i];
      row.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${item.monthName} de ${item.year}",
                style:
                    AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              ),
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: AppColors.successColor,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  getIt<IFireBaseEventLogger>()
                      .extracts(item.monthName, item.year.toString());

                  var response = await getIt<IExtractsRepository>()
                      .requestExtracts(
                          item.year.toString(), item.month.toString())
                      .first;
                  setState(() {
                    isLoading = false;
                  });

                  ToastHelper.createSuccess(
                          message: S.of(context).successExtract)
                      .show(context);

                  response.fold(
                      (l) => () {
                            ToastHelper.createError(
                                message: l.map(
                                    unexpected: (e) =>
                                        "Ocurrio un error al enviar el extracto",
                                    fromServer: (e) =>
                                        "Ocurrio un error al enviar el extracto")).show(
                                context);
                          },
                      (r) => () {
                            ToastHelper.createSuccess(
                                    message: S.of(context).successExtract)
                                .show(context);
                          });
                },
              )
            ],
          ),
        ),
      );
      if (i != limit - 1) row.add(Divider());
    }
    if (data.length == 0) row.add(Container());

    return row;
  }

  List<Widget> _buildCertificatesDetail(BuildContext context) {
    var row = List<Widget>();
    int maxInitialSize = 4;
    int limit = 0;
    if (dataCertificates.length <= maxInitialSize) {
      limit = dataCertificates.length;
    } else {
      limit = showMoreCertificates ? dataCertificates.length : maxInitialSize;
    }
    for (int i = 0; i < limit; i++) {
      var item = dataCertificates[i];
      row.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${item.year}",
                style:
                    AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              ),
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: AppColors.successColor,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  getIt<IFireBaseEventLogger>()
                      .certifications(item.monthName, item.year.toString());

                  var response = await getIt<IExtractsRepository>()
                      .requestCertifications(
                          item.year.toString(), item.month.toString())
                      .first;

                  setState(() {
                    isLoading = false;
                  });

                  ToastHelper.createSuccess(
                          message: S.of(context).successCertification)
                      .show(context);

                  response.fold(
                      (l) => () {
                            ToastHelper.createError(
                                message: l.map(
                                    unexpected: (e) =>
                                        "Ocurrio un error al enviar el certificado",
                                    fromServer: (e) =>
                                        "Ocurrio un error al enviar el certificado")).show(
                                context);
                          },
                      (r) => () {
                            ToastHelper.createSuccess(message: r).show(context);
                          });
                },
              )
            ],
          ),
        ),
      );
      if (i != limit - 1) row.add(Divider());
    }
    if (dataCertificates.length == 0) row.add(Container());

    return row;
  }

  Widget _extractsNotFound() {
    return Padding(
      padding: EdgeInsets.only(top: AppDimens.layoutSpacerM),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
        child: Column(
          children: <Widget>[
            Text(
              "😅",
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.layoutMarginS),
            Text(S.of(context).extractsNotFound,
                style: AppTextStyles.subtitle2.copyWith(
                    color: AppColors.g50Color, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
            const SizedBox(height: AppDimens.layoutMarginS),
            Text(S.of(context).extractsNotFoundDescription,
                style: AppTextStyles.normal4, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionExtract(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimens.layoutSpacerML),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginXS),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutSpacerS,
                  vertical: AppDimens.layoutSpacerS),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        offset: Offset(0, 4),
                        spreadRadius: 0.5,
                        blurRadius: 8.0),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimens.dialogBorderRadius),
                  ),
                  color: AppColors.whiteColor),
              child: Column(
                children: _buildExtractsDetail(context),
              ),
            ),
            const SizedBox(height: AppDimens.layoutMargin),
            Container(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        showMoreExtracts = !showMoreExtracts;
                      });
                    },
                    child: Text(
                      showMoreExtracts
                          ? S.of(context).seeLess
                          : S.of(context).seeMore,
                      style: AppTextStyles.normalUnder1
                          .copyWith(color: AppColors.primaryColor),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _buildCertifications(BuildContext context) {
    return Container(
      width: AppDimens.layoutSpacerX * 3.6,
      padding: EdgeInsets.only(top: AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          dataCertificates == null || dataCertificates.length == 0
              ? _documentsNotFound()
              : _buildSectionCertifications()
        ],
      ),
    );
  }

  Widget _documentsNotFound() {
    return Padding(
      padding: EdgeInsets.only(top: AppDimens.layoutSpacerM),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMargin),
        child: Column(
          children: <Widget>[
            Text(
              "😅",
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.layoutMarginS),
            Text(S.of(context).documentsNotFound,
                style: AppTextStyles.subtitle2.copyWith(
                    color: AppColors.g50Color, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
            const SizedBox(height: AppDimens.layoutMarginS),
            Text(S.of(context).documentsNotFoundDescription,
                style: AppTextStyles.normal4, textAlign: TextAlign.center),
            const SizedBox(height: AppDimens.layoutMarginM),
            getIt<IEnv>().isColombia() ? _buttonMoreInformation() : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCertifications() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimens.layoutSpacerML),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginXS),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.layoutSpacerS,
                  vertical: AppDimens.layoutSpacerS),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        offset: Offset(0, 4),
                        spreadRadius: 0.5,
                        blurRadius: 8.0),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimens.dialogBorderRadius),
                  ),
                  color: AppColors.whiteColor),
              child: Column(
                children: _buildCertificatesDetail(context),
              ),
            ),
            const SizedBox(height: AppDimens.layoutMargin),
            Container(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        showMoreCertificates = !showMoreCertificates;
                      });
                    },
                    child: Text(
                      showMoreCertificates
                          ? S.of(context).seeLess
                          : S.of(context).seeMore,
                      style: AppTextStyles.normalUnder1
                          .copyWith(color: AppColors.primaryColor),
                    ))),
            const SizedBox(height: AppDimens.layoutMargin),
            getIt<IEnv>().isColombia() ? _buttonMoreInformation() : Container(),
            const SizedBox(height: AppDimens.layoutMargin),
          ],
        ),
      ),
    );
  }

  Widget _buttonMoreInformation() {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context)=>CustomDialog(
                buttonText: S.of(context).createPasswordButton,
                icon: Icons.insert_drive_file,
                iconColor: AppColors.successColor,
                title: S.of(context).titleModalExtract,
                subTitle: S.of(context).textSecundaryModalExtract,
                buttonAction: returnPop,
                description: S.of(context).descriptionModalExtract,
              )
                );
        },
        child: Text(
          S.of(context).moreInformation,
          style: AppTextStyles.normalUnder1
              .copyWith(color: AppColors.primaryColor),
        ));
  }
}
