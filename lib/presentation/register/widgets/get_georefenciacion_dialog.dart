import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:get_ip/get_ip.dart';
import 'package:http/http.dart' as http;

class GetGeoreferencing extends StatelessWidget {
  const GetGeoreferencing({
    Key key,
    this.buttonAction,
  }) : super(key: key);

  final Function buttonAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
      ),
      content: Container(
        // width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    S.of(context).geoReferencingDialogTitle,
                    style: AppTextStyles.title33
                        .copyWith(color: AppColors.g50Color, fontSize: 16),
                  ),
                ),
                Icon(
                  Icons.place,
                  color: AppColors.infoColor,
                  size: 35,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                S.of(context).geoReferencingDialogDescription,
                style: AppTextStyles.normal1.copyWith(
                    color: AppColors.g50Color, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
              text: S.of(context).goalsRecalculatedButtonUnderstood,
              action: () async {
                print("OnAccept");
                buttonAction();
                ExtendedNavigator.rootNavigator.pop("a");
                //Se obtiene la ip
                String ipAddress = await GetIp.ipAddress;

                var resp =
                    await http.get('http://ip-api.com/json/' + ipAddress);
                print(resp.body);
              },
            ),
          ],
        ),
      ),
    );
  }
}
