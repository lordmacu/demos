import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomButtonSelected extends HookWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isDisabled;

  CustomButtonSelected(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSelected = useState(false);
    return InkWell(
      splashColor: Colors.transparent,
      onTap: !isDisabled
          ? () {
              isSelected.value = !isSelected.value;
              onPressed();
            }
          : null,
      child: Container(
        height: 45,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimens.dialogBorderRadius,
          ),
          border: Border.all(
            color: isSelected.value
                ? AppColors.primaryColor
                : AppColors.bgButtonDisabled,
          ),
          color: isSelected.value
              ? AppColors.primarySoftColor
              : AppColors.backgroundColor,
        ),
        child: Center(
          child: isSelected.value
              ? Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normal2
                      .copyWith(color: AppColors.primaryColor),
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normal1.copyWith(
                    color: AppColors.bgButtonDisabled,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
