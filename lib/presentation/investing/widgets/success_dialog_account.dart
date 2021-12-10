import 'package:ualet/infrastructure/core/core_current_env.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button_small.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class SuccessDialogAccount extends StatelessWidget {
  final Function acceptCallBack;
  final Function undoCallback;
  final int type;
  final int typePopUp;

  const SuccessDialogAccount(
      {Key key,
      this.acceptCallBack,
      this.undoCallback,
      this.type,
      this.typePopUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimens.dialogBorderRadius,
          ),
        ),
      ),
      content: Container(
        margin: EdgeInsets.all(0),
        child: typePopUp == 1 // Cuenta Nueva - "Pendiente"
            ? _showContentNotSelectAccount(context)
            : typePopUp == 2 ? _showContentSelectAccount(context) : Container(),
      ),
    );
  }

  Widget _showContentSelectAccount(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _header(context),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        Text(
          S.of(context).editDebitDialogText1,
          style: AppTextStyles.normal1.copyWith(
            color: AppColors.g75Color,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(S.of(context).addMoneySubtitle,
                        style: AppTextStyles.normal2.copyWith(
                          color: AppColors.g75Color,
                        )),
                  ),
                  Container(
                    child: Text(S.of(context).twoDays,
                        style: AppTextStyles.normal2.copyWith(
                            color: AppColors.g75Color,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.all(10),
                child: PrimaryButtonSmall(
                  text: S.of(context).understand,
                  action: acceptCallBack,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _showContentNotSelectAccount(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _header(context),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        Text(
          getIt<IEnv>().isColombia() ? S.of(context).rememberDialogFinish : S.of(context).rememberDialogFinishMx,
          style: AppTextStyles.normal1.copyWith(
            color: AppColors.g75Color,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        typePopUp == 1
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(S.of(context).registerBankAccount,
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              )),
                        ),
                        Container(
                          child: Text(S.of(context).threeDays,
                              style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(S.of(context).addMoneySubtitle,
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              )),
                        ),
                        Container(
                          child: Text(S.of(context).twoDays,
                              style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(S.of(context).total,
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              )),
                        ),
                        Container(
                          child: Text(S.of(context).fiveDays,
                              style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(S.of(context).addMoneySubtitle,
                              style: AppTextStyles.normal2.copyWith(
                                color: AppColors.g75Color,
                              )),
                        ),
                        Container(
                          child: Text(S.of(context).twoDays,
                              style: AppTextStyles.normal2.copyWith(
                                  color: AppColors.g75Color,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.all(10),
                child: PrimaryButtonSmall(
                  text: S.of(context).understand,
                  action: acceptCallBack,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            S.of(context).addAccountDialogTitle,
            style: AppTextStyles.title2.copyWith(
              color: AppColors.g25Color,
            ),
          ),
        ),
        Icon(Icons.monetization_on, color: AppColors.successColor2, size: 40),
      ],
    );
  }
}
