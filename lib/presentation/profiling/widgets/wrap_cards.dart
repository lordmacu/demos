import 'package:flutter/material.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class UnselectedWrapCard extends StatelessWidget {
  const UnselectedWrapCard({
    @required this.option,
    @required this.action,
    Key key,
  }) : super(key: key);

  final ProfilingOption option;
  final Function(String optionId, double score) action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action(option.id, option.score),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(height: AppDimens.layoutSpacerXs),
            Text(
              option.description,
              textAlign: TextAlign.center,
              style: AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedWrapCard extends StatelessWidget {
  const SelectedWrapCard({
    @required this.option,
    @required this.action,
    Key key,
  }) : super(key: key);

  final ProfilingOption option;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.g10Color,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(height: AppDimens.layoutSpacerXs),
            Expanded(
              child: Text(
                option.description,
                textAlign: TextAlign.center,
                style: AppTextStyles.normal2
                    .copyWith(color: AppColors.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
