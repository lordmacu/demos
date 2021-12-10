import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/widgets/sections/footer_form_inf_redirect/bottom_sheet.dart';
import 'package:ualet/to_be_refactor/widgets/slide_dots_onboarding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class SlideItem extends StatelessWidget {
  final String title;
  final String text;
  final imageUrl;
  final int currentPage;
  final int pages;
  final VoidCallback action;

  const SlideItem(
      {Key key,
      @required this.title,
      @required this.text,
      @required this.imageUrl,
      @required this.currentPage,
      @required this.pages,
      @required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizerUtil().init(viewportConstraints, orientation);
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100.0.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.layoutMarginMS),
                      child: Column(
                        children: <Widget>[
                          _header(context),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          _imgBody(imageUrl),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          _text(title, text, context),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          _sectionDots(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _imgBody(String url) {
    return Image.asset(
      url,
      height: 160,
      fit: BoxFit.contain,
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimens.layoutSpacerHeader),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.iconWhite,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          currentPage < (pages - 1)
              ? InkWell(
                  onTap: action,
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.layoutSpacerS),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            width: 1.3, color: AppColors.whiteColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${S.of(context).onBoardingIndexTitleButtonHeader}",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.caption2.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: AppDimens.layoutSpacerM,
                        ),
                        Icon(
                          Icons.skip_next,
                          size: 23,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _text(String title, String subTitle, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'OpenSans',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: AppColors.g10Color),
        ),
        SizedBox(
          height: 17,
        ),
        Text(subTitle,
            style: AppTextStyles.normalSemiBold.copyWith(fontSize: 15.0.sp)),
      ],
    );
  }

  Widget _sectionDots() {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < pages; i++)
          i <= currentPage
              ? SlideDotsOnBoarding(true)
              : SlideDotsOnBoarding(false)
      ],
    ));
  }
}
