import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/models/extracts/extract_model.dart';
import 'package:ualet/to_be_refactor/services/extracts/extracts_service.dart';
import 'package:ualet/to_be_refactor/utils/bubble_indication_painter.dart';

class ExtractsPageOldOld extends StatefulWidget {
  @override
  _ExtractsPageOldState createState() => _ExtractsPageOldState();
}

class _ExtractsPageOldState extends State<ExtractsPageOldOld> {
  PageController _pageController;
  Color left = AppColors.primaryColor;
  Color right = AppColors.g25Color;
  final data = [];
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getExtracts();
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

  _getExtracts() async {
    getIt<ExtractsService>().getExtracts().then((value) {
      print(value);
      for (var item in value.data) {
        data.add(item);
      }
    }).catchError((e) {
      print("error: ${e.error}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: _media.width * 1.0,
                height: _media.height * 1.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _header(_media),
                    _textDescriptionExtract(),
                    Container(
                      child: _buildMenuBar(),
                    ),
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
                          ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildExtracts(),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildCertifications(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  returnPop() {
    return Navigator.of(context).pop();
  }

  Widget _header(media) {
    return Container(
      width: media.width * 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: AppDimens.buttonBack.height,
            ),
            onPressed: () {
              ExtendedNavigator.rootNavigator
                  .pushReplacementNamed(Routes.homePage);
            },
          ),
          Container(
              padding: EdgeInsets.only(left: AppDimens.layoutSpacerHeader),
              child: Text(S.of(context).extract,
                  style: AppTextStyles.title2
                      .copyWith(color: AppColors.g25Color))),
        ],
      ),
    );
  }

  Widget _textDescriptionExtract() {
    return Container(
      margin: EdgeInsets.only(
          left: AppDimens.layoutMarginS,
          right: AppDimens.layoutMarginS,
          top: AppDimens.layoutMarginS,
          bottom: AppDimens.layoutMarginS),
      child: Text(S.of(context).extractDescription,
          style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color)),
    );
  }

  Widget _buildSectionExtract() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutSpacerS,
                vertical: AppDimens.layoutSpacerS),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimens.layoutMarginS)),
            child: Column(
              children:_buildExtractsDetail(),
            ),
          ),
          const SizedBox(height: AppDimens.layoutMargin),
          Container(
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    S.of(context).seeMore,
                    style: AppTextStyles.normalUnder1
                        .copyWith(color: AppColors.primaryColor),
                  )))
        ],
      ),
    );
  }

  Widget _buildSectionCertifications() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.layoutSpacerS,
                vertical: AppDimens.layoutSpacerS),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimens.layoutMarginS)),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Marzo de 2020",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.email,
                          color: AppColors.successColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Febrero de 2020",
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.email,
                          color: AppColors.successColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.layoutMargin),
          Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      S.of(context).seeMore,
                      style: AppTextStyles.normalUnder1
                          .copyWith(color: AppColors.primaryColor),
                    )),
                const SizedBox(height: AppDimens.layoutMargin),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          child: CustomDialog(
                            buttonText: S.of(context).createPasswordButton,
                            icon: Icons.insert_drive_file,
                            iconColor: AppColors.successColor,
                            title: S.of(context).titleModalExtract,
                            buttonAction: returnPop,
                            description: S.of(context).descriptionModalExtract,
                          ));
                    },
                    child: Text(
                      S.of(context).moreInformation,
                      style: AppTextStyles.normalUnder1
                          .copyWith(color: AppColors.primaryColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuBar() {
    return Container(
      width: AppDimens.layoutSpacerX * 3.0,
      height: AppDimens.layoutSpacerS * 5.0,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.layoutMarginS))),
      child: CustomPaint(
        painter:
            TabIndicationPainter(pageController: _pageController, radius: 21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(S.of(context).extract,
                    style: AppTextStyles.normal2.copyWith(color: left)),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: (_onSignUpButtonPress),
                child: Text(S.of(context).controlCertifications,
                    style: AppTextStyles.normal2.copyWith(color: right)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtracts() {
    return Container(
      padding: EdgeInsets.only(top: AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          data == null ? _extractsNotFound() : _buildSectionExtract()
        ],
      ),
    );
  }

  Widget _extractsNotFound() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Text(S.of(context).extractsNotFound,
              style:
                  AppTextStyles.subtitle2.copyWith(color: AppColors.g50Color),
              textAlign: TextAlign.center),
          const SizedBox(height: AppDimens.layoutMarginS),
          Text(S.of(context).extractsNotFoundDescription,
              style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _documentsNotFound() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.layoutMarginS),
      child: Column(
        children: <Widget>[
          Text(S.of(context).documentsNotFound,
              style:
                  AppTextStyles.subtitle2.copyWith(color: AppColors.g50Color),
              textAlign: TextAlign.center),
          const SizedBox(height: AppDimens.layoutMarginS),
          Text(S.of(context).documentsNotFoundDescription,
              style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildCertifications() {
    return Container(
      padding: EdgeInsets.only(top: AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          data != null ? _documentsNotFound() : _buildSectionCertifications()
        ],
      ),
    );
  }

  List<Widget> _buildExtractsDetail() {
    var row = List<Widget>();
    for (var item in data) {
      row.add(  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${item.monthName} de ${item.monthName}",
                style:
                    AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
              ),
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: AppColors.successColor,
                ),
                onPressed: () {},
              )
            ],
          ),
       
      );
      row.add(Divider());
    }
    if (data.length == 0) row.add(Container());

    return  row;
  }
}
