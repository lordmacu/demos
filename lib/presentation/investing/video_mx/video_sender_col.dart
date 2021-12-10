import 'dart:async';
import 'dart:io';

import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/buttons/secondary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog_extend.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/router/router.gr.dart';

import 'package:ualet/domain/videosender/i_video_sender_repository.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

import 'package:ualet/presentation/core/misc/toast_helper.dart';

class VideoSenderPageCol extends StatefulWidget {
  final String idFace;
  final String idINE;
  final DashboardGoal goal;
  final bool bankTransfer;
  final double bankTransferValue;
  final BankAccountItem bankAccountItem;
  final bool multiple;
  final List<DashboardGoal> goals;
  final List<double> valuesChosen;
  final bool firstVideo;
  final String filePath;

  const VideoSenderPageCol({
    Key key,
    this.idFace = "TestFlutterFace",
    this.idINE = "TestFlutterINEIFE",
    this.filePath,
    this.goal,
    this.bankTransfer,
    this.bankTransferValue,
    this.bankAccountItem,
    this.multiple,
    this.goals,
    this.valuesChosen,
    this.firstVideo = true,
  }) : super(key: key);

  @override
  _VideoSenderPage createState() {
    return _VideoSenderPage();
  }
}

class _VideoSenderPage extends State<VideoSenderPageCol> {
  CameraController controller;
  String videoPath;

  List<CameraDescription> cameras;
  int selectedCameraIdx;
  Stopwatch watch = Stopwatch();

  Timer timer;
  bool startStop = true;

  bool isRecording = false;

  bool isLoading = false;
  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);

        int seconds = toSeconds(watch.elapsedMilliseconds);

        print("aquii lo segundos  ${seconds}");
        if (seconds == 12) {
          _onStopButtonPressed();
        }
      });
    }
  }

  toSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();

    return seconds;
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Get the listonNewCameraSelected of available cameras.
    // Then set the first camera as selected.
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[1]).then((void v) {});
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            S.of(context).videoFaceAndVoice,
            style: TextStyle(color: AppColors.bgPurple),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: !isRecording ? 100 : 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: !isRecording
                        ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.layoutSpacerL,
                          vertical: AppDimens.layoutHSpacerS),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  action: () {
                                    _startVideoRecording();
                                  },
                                  text: S.of(context).startVideoRecording,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.layoutSpacerL,
                          vertical: AppDimens.layoutHSpacerS),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                      action: () {
                                        _stopVideoRecording().then((_) {
                                          if (mounted) setState(() {});

                                          stopWatch();
                                          watch.reset();

                                          _asyncFileUpload(videoPath);
                                        });
                                      },
                                      text: S.of(context).sendVideo,
                                    ),
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  action: () {
                                    setState(() {
                                      isRecording = false;
                                    });
                                    _stopVideoRecording().then((_) {
                                      print("aquii paro la cosa");

                                      if (mounted) setState(() {});

                                      stopWatch();
                                      watch.reset();

                                      deleteFile(videoPath);
                                    });
                                  },
                                  text:
                                  "${S.of(context).retryVideoRecording}",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      inAsyncCall: isLoading,
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Cargando...',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,
            icon: Icon(_getCameraLensIcon(lensDirection)),
            label: Text(
                "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
      ),
    );
  }

  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.videocam),
              color: Colors.blue,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo
                  ? _onRecordButtonPressed
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              color: Colors.red,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  controller.value.isRecordingVideo
                  ? _onStopButtonPressed
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<int> deleteFile(file) async {
    try {
      file = await File(file);

      await file.delete();

      print("se borro el archivo ${file}");
    } catch (e) {
      return 0;
    }
  }

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        setState(() {
          isRecording = true;
        });

        print('Recording video started');
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      stopWatch();

      setState(() {
        isRecording = true;
      });

      //  _asyncFileUpload(videoPath);

      print('Video recorded to $videoPath');
    });
  }

  Future<String> _startVideoRecording() async {
    setState(() {
      isRecording = true;
    });
    if (!controller.value.isInitialized) {
      print('Please wait');

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    startWatch();

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  _asyncFileUpload(String file) async {
    setState(() {
      isLoading = true;
    });

    stopWatch();

    print("aquii esta el archivo ${videoPath}");

    var repoInvesting =
    getIt<IVideoSenderRepository>().sendVideo(videoPath, elapsedTime);

    repoInvesting.then((value) => {
      value.fold((l) => {errorVideo(l)}, (r) => {successVideo()})
    });
  }

  void successVideo() async {
    deleteFile(videoPath);

    print("aquii el sucess del video");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("videoLoaded", true);

    stopWatch();

    watch.reset();

    setState(() {
      isLoading = false;
    });

    Navigator.pop(context, true);
  }

  void errorVideo(l) {
    deleteFile(videoPath);

    setState(() {
      isLoading = false;
    });

    print(
        "este es el error ${l.map(unexpected: (e) => "Error inesperado  ${e}", fromServer: (e) => "Error: ${e.message}")}");

    ToastHelper.createError(
        message: l.map(
            unexpected: (e) => "Error inesperado  ${e}",
            fromServer: (e) => "Error: ${e.message}"));

    stopWatch();

    watch.reset();

    showDialog(
      context: context,
      builder: (BuildContext context) =>  CustomDialogExtend(
        icon: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Icon(
            Icons.videocam_off,
            color: AppColors.redColor,
            size: 45,
          ),
        ),
        iconColor: AppColors.redColor,
        title: S.of(context).sendVideoErrorTitle,
        description: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(S.of(context).sendVideoError,
                  style: AppTextStyles.normal1.copyWith(
                      color: AppColors.g75Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: PrimaryButton(
                text: S.of(context).recordVideoAgain,
                action: () {
                  watch.reset();

                  _startVideoRecording();
                  ExtendedNavigator.rootNavigator.pop();
                },
              ),
            ),
            SecondaryButton(
              text: S.of(context).cancelVideo,
              action: () {
                ExtendedNavigator.rootNavigator.pop();
                closeWindow();
              },
            )
          ],
        ),
      ),
    );
  }

  void closeWindow() {
    Navigator.pop(context, false);
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      stopWatch();

      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }
}
