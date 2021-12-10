import 'dart:math';
import 'dart:ui';

import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_images.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender.dart';
import 'package:ualet/presentation/investing/video_mx/video_sender_col.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class VideoSenderIntroPageCol extends StatefulWidget {
  final String idVideoFace;
  final String idVideoINEIFE;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;

  VideoSenderIntroPageCol({
    Key key,
    this.idVideoFace = "userFace",
    this.goal,
    this.idVideoINEIFE = "userID",
    this.bankTransfer,
    this.bankTransferValue,
    this.bankAccountItem,
    this.multiple,
    this.goals,
    this.valuesChosen,
  });

  @override
  _VideoSenderIntroPage createState() => _VideoSenderIntroPage();
}

class _VideoSenderIntroPage extends State<VideoSenderIntroPageCol> {
  CameraController controller;
  List<CameraDescription> cameras;
  String filePath;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => InitFunction(context));
  }

  InitFunction(context) async {
    await initCameras(1);
    await Future.delayed(Duration(seconds: 1));
    StartRecord(controller);
  }

  Future initCameras(numberCamera) async {
    cameras = await availableCameras();

    controller = CameraController(cameras[numberCamera], ResolutionPreset.low);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future StartRecord(controller) async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_tesdt';
    await Directory(dirPath).create(recursive: true);
    Random random = new Random();

    int randomNumber = random.nextInt(900) + 10;
    String filePaths = '$dirPath/video_${randomNumber}.mp4';

    await controller.startVideoRecording(filePaths);
    await Future.delayed(Duration(seconds: 1));

    await controller.stopVideoRecording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: button(context),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(500)),
                        color: Color(0xff2bbd55)),
                    child: Icon(
                      Icons.video_call,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      S.of(context).videoValidation,
                      style: TextStyle(
                          color: Color(0xff5ecc7f),
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                              child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: S.of(context).textHelperSecutiryVideo1,
                              style: TextStyle(
                                  color: AppColors.txtColorGrey, fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                  text: S.of(context).textHelperSecutiryVideo2,
                                  style: TextStyle(
                                      color: AppColors.txtColorGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Image.asset(
                                  "assets/images/documentsides.png"),
                              width: 30,
                              margin: EdgeInsets.only(right: 10)),
                          Expanded(
                            child: Container(
                                child: RichText(
                              text: TextSpan(
                                text: S.of(context).stepOneVideo,
                                style: TextStyle(
                                    color: AppColors.txtColorGrey,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: S.of(context).stepOneVideoText,
                                    style: TextStyle(
                                        color: AppColors.txtColorGrey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Image.asset("assets/images/face.png"),
                              width: 30,
                              margin: EdgeInsets.only(right: 10)),
                          Expanded(
                            child: Container(
                                child: RichText(
                              text: TextSpan(
                                text: S.of(context).stepTwoVideo,
                                style: TextStyle(
                                    color: AppColors.txtColorGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: S.of(context).stepTwoVideoText,
                                    style: TextStyle(
                                        color: AppColors.txtColorGrey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 50, right: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: PrimaryButton(
              text: S.of(context).registerVideo,
              action: () async {
                final Directory appDirectory =
                    await getApplicationDocumentsDirectory();
                final String videoDirectory = '${appDirectory.path}/Videos';
                await Directory(videoDirectory).create(recursive: true);
                final String currentTime =
                    DateTime.now().millisecondsSinceEpoch.toString();
                String filePath = '$videoDirectory/${currentTime}.mp4';

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoSenderPageCol(
                            filePath: filePath,
                            firstVideo: true,
                          )),
                );

                Navigator.pop(context, result);
              },
            ),
          ),
          Container(
            child: InkWell(
              child: Text(
                S.of(context).cancelVideo,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.txtColorPurple),
              ),
              onTap: () => {Navigator.pop(context, false)},
            ),
          )
        ],
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: 167,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppDimens.dialogBorderRadius,
                  ),
                ),
              ),
              padding: EdgeInsets.all(
                AppDimens.layoutMargin,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).regulationTextVideoRecordingTitle,
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.layoutSpacerS,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.layoutHSpacerS,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            AppImages.cameraOutline,
                          ),
                          height: 60,
                        ),
                        Image(
                          image: AssetImage(
                            "assets/images/3lines.png",
                          ),
                          height: 27,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.g25Color,
              ),
              child: Center(
                child: Text(
                  "3",
                  style: AppTextStyles.subtitle2
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      S.of(context).instructions,
      style: AppTextStyles.title2.copyWith(
        color: AppColors.successColor,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

  Padding subtitle1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        S.of(context).videoVerificationDesc1,
        style: AppTextStyles.normal4.copyWith(
          color: AppColors.g50Color,
        ),
      ),
    );
  }

  Padding subtitle2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        S.of(context).videoVerificationDesc2,
        style: AppTextStyles.normal4.copyWith(
          color: AppColors.g50Color,
        ),
      ),
    );
  }

  Padding subtitle3(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        S.of(context).videoVerificationDesc3,
        style: AppTextStyles.normal4.copyWith(
          color: AppColors.g50Color,
        ),
      ),
    );
  }
}
