import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ualet/domain/profiling/profiling_result.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

class ProfilingProfilePage extends StatelessWidget {
  final ProfilingResult result;
  static final String cdn = '${EnvironmentConfig.cdnUrl}/profiling/';
  const ProfilingProfilePage({Key key, @required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String descChanged = result.description.replaceAll("\\n", "\n");
    print(descChanged);
    return Container(
      // height: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(AppDimens.layoutMargin),
      child: Column(
        children: <Widget>[
          Text(
            result.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle2.copyWith(color: AppColors.g50Color),
          ),
          const SizedBox(
            height: AppDimens.layoutSpacerM,
          ),
          CachedNetworkImage(
            imageUrl: "$cdn${result.image}",
            height: AppDimens.emojiSizeL.height,
          ),
          const SizedBox(height: AppDimens.layoutSpacerM),
          Text(
            result.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.normal2.copyWith(color: AppColors.g75Color),
          ),
          const SizedBox(height: AppDimens.layoutSpacerM),
          Text(
            descChanged,
            textAlign: TextAlign.center,
            style: AppTextStyles.normal1.copyWith(color: AppColors.g75Color),
          )
        ],
      ),
    );
  }
}
