import 'package:flutter/material.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class UnselectedListCard extends StatelessWidget {
  const UnselectedListCard({
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
        margin: EdgeInsets.only(bottom: AppDimens.layoutSpacerS),
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(width: AppDimens.layoutSpacerS),
            Expanded(
              child: Text(
                option.description,
                textAlign: TextAlign.left,
                style:
                    AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedListCard extends StatelessWidget {
  const SelectedListCard({
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
        margin: EdgeInsets.only(bottom: AppDimens.layoutSpacerS),
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.g10Color,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(height: AppDimens.layoutSpacerS),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  option.description,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MultiSelectedListCard extends StatefulWidget {
  final ProfilingOption option;
  final Function(String optionId, double score) action;
  const MultiSelectedListCard({
    @required this.option,
    @required this.action,
    Key key,
  }) : super(key: key);
  @override
  _MultiSelectedListCardState createState() => _MultiSelectedListCardState();
}

class _MultiSelectedListCardState extends State<MultiSelectedListCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        widget.action(widget.option.id, widget.option.score);
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimens.layoutSpacerS),
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.g10Color,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(widget.option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(height: AppDimens.layoutSpacerS),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.option.description,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UnselectedFormListCard extends StatelessWidget {
  const UnselectedFormListCard({
    @required this.option,
    @required this.action,
    Key key,
  }) : super(key: key);

  final ProfilingOption option;
  final Function(
          String optionId, String isValueCheck, String valueFieldObservation)
      action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action(option.id, '', ''),
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimens.layoutSpacerS),
        padding: const EdgeInsets.all(AppDimens.layoutMargin),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppDimens.emojiSizeM.height,
              child: Text(option.emoji,
                  style: AppTextStyles.title2.copyWith(fontSize: 30.0)),
            ),
            const SizedBox(width: AppDimens.layoutSpacerS),
            Expanded(
              child: Text(
                option.description,
                textAlign: TextAlign.left,
                style:
                    AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
