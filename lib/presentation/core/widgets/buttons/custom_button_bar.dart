import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';

class CustomButtonBar extends StatelessWidget {
  final String textA;
  final VoidCallback actionA;
  final String textB;
  final VoidCallback actionB;
  final Axis axisDirection;

  const CustomButtonBar(
      {Key key,
      this.textA = '',
      this.actionA,
      this.textB = '',
      this.actionB,
      this.axisDirection = Axis.horizontal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (axisDirection == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: OutlineButton(
              textTheme: ButtonTextTheme.accent,
              onPressed: actionA,
              borderSide: BorderSide(color: AppColors.primaryColor),
              child: Text(
                textA,
                style: AppTextStyles.normal2
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          const SizedBox(width: AppDimens.layoutSpacerS),
          Expanded(
            child: RaisedButton(
              onPressed: actionB,
              child: Text(textB,
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.whiteColor)),
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SecondaryButton(text: textA, action: actionA),
          const SizedBox(height: AppDimens.layoutSpacerXs),
          PrimaryButton(text: textB, action: actionB),
        ],
      );
    }
  }
}
