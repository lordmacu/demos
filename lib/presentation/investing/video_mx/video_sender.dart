import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ualet/domain/customer_level/i_customer_level_repo.dart';
import 'package:ualet/domain/dashboard/dashboard_goal.dart';
import 'package:ualet/domain/my_wallet/bank_account_item.dart';
import 'package:ualet/domain/videosender/i_video_sender_repository.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/infrastructure/customerLevel/customer_level_repo_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/buttons/primary_button.dart';
import 'package:ualet/presentation/core/widgets/dialogs/custom_dialog.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/custom_text_loading_overlay.dart';
import 'package:ualet/presentation/investing/video_mx/rest_signaling.dart';
import 'package:ualet/presentation/investing/widgets/investing_simple_popup.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';

class VideoSenderPage extends StatefulWidget {
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

  const VideoSenderPage({
    Key key,
    this.idFace = "TestFlutterFace",
    this.idINE = "TestFlutterINEIFE",
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
  _VideoSenderPageState createState() => _VideoSenderPageState();
}

class _VideoSenderPageState extends State<VideoSenderPage> {

  final RestSignaling signaling = RestSignaling();
  String iceStatus = "None";
  bool isConnected = false;
  bool showedDialog = false;
  bool isError = false;
  bool isDone = false;
  bool isRecording = false;
  String loadingString = "Conectando\n";
  CameraController controller;
  String imagePath;
  String videoPath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CameraDescription> cameras;
  VideoPlayerController videoController;
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int counter;

  VoidCallback videoPlayerListener;
  bool enableAudio = true;

  @override
  void initState() {
    super.initState();




    WidgetsBinding.instance
        .addPostFrameCallback((_) => InitFunction(context));
  }

  Future initCameras(numberCamera) async{
    cameras = await availableCameras();

    controller = CameraController(cameras[numberCamera], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller.description);
      }
    }
  }


  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: enableAudio,
    );

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {

        print("aqui un error ${controller.value.errorDescription}");

      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print("aqui un error    ${e}");
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onVideoRecordButtonPressed() {

    print("aquiiiestoy manito");
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) showInSnackBar('Saving video to $filePath');
    });
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    print("********************** aquiii hay un errror ${message}  **************************");
  }

  Future<String> startVideoRecording() async {


    if (!controller.value.isInitialized) {

      print('Error: select a camera first.');

      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final _preferenceUser = PreferenceUser();
    String filePath = '$dirPath/${_preferenceUser.ineOrIfeNumber}.mp4';
    if (!widget.firstVideo) {
      filePath= '$dirPath/${_preferenceUser.ineOrIfeNumber}.mp4';
    }

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      print("aqui el error del camera   ${e}");
      return null;
    }
    return filePath;
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((_) {
      if (mounted) setState(() {});

      _asyncFileUpload(videoPath);

      showInSnackBar('Video recorded to: $videoPath');
    });
  }

  InitFunction(context) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getInt('counter');

    if(data!=null){
      prefs.setInt('counter', (data+1));
    }else{
      prefs.setInt('counter', (0));
    }

    if (widget.firstVideo) {
      initCameras(1);

      showDialog(
        context: context,
        builder: (BuildContext context) =>  CustomDialog(
          buttonText:  S.of(context).accept,
          icon: Icons.info_outline,
          iconColor: AppColors.infoColor,
          title:S.of(context).videoFaceAndVoice,
          description: S.of(context).videoFaceSubtitle,
          buttonAction: () {

            ExtendedNavigator.rootNavigator.pop();
            onVideoRecordButtonPressed();
          },
        ),
      );

    } else {
      initCameras(0);

      showDialog(
        context: context,
        builder: (BuildContext context) =>  CustomDialog(
          buttonText:  S.of(context).accept,
          icon: Icons.info_outline,
          iconColor: AppColors.infoColor,
          title:S.of(context).videoINEIFE,
          description: S.of(context).videoINEIFESubtitle,
          buttonAction: () {

            ExtendedNavigator.rootNavigator.pop();
            onVideoRecordButtonPressed();
          },
        ),
      );







    }

  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
    VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imagePath = null;
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  @override
  Widget build(BuildContext context) {
    print("IS CONNECTED ON BUILD");
    print(isConnected);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          AppDimens.layoutMargin,
                        ),
                        child: Text(
                          widget.firstVideo
                              ? S.of(context).videoFaceAndVoice
                              : S.of(context).videoINEIFE,
                          style: AppTextStyles.title4.copyWith(
                            color: AppColors.g25Color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Container(
                      child: controller!=null ? CameraPreview(controller): Container(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.layoutSpacerL,
                          vertical: AppDimens.layoutHSpacerS),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              action: _buttonActivated()
                                  ? () {
                                /*   if (isError) {
                                        _makeCall();
                                      }
                                      if (isDone) {
                                        _stop();
                                      }*/
                                onStopButtonPressed();




                              }
                                  : null,
                              text: isError
                                  ? S.of(context).errorEvidenteButton
                                  : S.of(context).continueButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CustomTextLoadingOverlay(
              isLoading: isConnected,
              text: loadingString,
            ),
          ],
        ),
      ),
    );
  }

  _asyncFileUpload(String file) async{
    final _preferenceUser = PreferenceUser();

    setState(() {
      isConnected=true;
    });

    var request = http.MultipartRequest("POST", Uri.parse("https://test-api.anteia.co/ualet/video"));

    request.fields["userId"] = _preferenceUser.ineOrIfeNumber;
    var pic = await http.MultipartFile.fromPath("file", file);
    request.files.add(pic);
    request.headers.addAll({"api_key":"c289c4bf2b80a566b49beee82db297b5c8505c7ffbb637719985235124e5be88"});
    http.StreamedResponse response = await request.send();

    var responseByteArray = await response.stream.bytesToString();
    final responseJson = json.decode(responseByteArray);


    setState(() {
      isConnected=false;
    });
    if(!responseJson["livenessResponse"]["result"]){

      showDialog(
        context: context,
        builder: (BuildContext context) =>  CustomDialog(
          buttonText:  S.of(context).accept,
          icon: Icons.error_outline,
          iconColor: AppColors.errorToastColor,
          title:S.of(context).recordErrorTitle,
          description: S.of(context).recordError,
          buttonAction: () {
            reintentRecord();

          },
        ),
      );

    }else{

      _navigateToNextPage();

    }

/*
   */


  }

  bool _buttonActivated() {
    if (isConnected) return isDone;
    return true;
  }

  reintentRecord(){
    ExtendedNavigator.rootNavigator.pushReplacementNamed(
      Routes.videoSenderPage,
      arguments: VideoSenderPageArguments(
        goal: widget.goal,
        bankTransfer: widget.bankTransfer,
        bankTransferValue: widget.bankTransferValue,
        bankAccountItem: widget.bankAccountItem,
        goals: widget.goals,
        multiple: widget.multiple,
        valuesChosen: widget.valuesChosen,
        firstVideo: widget.firstVideo ? true : false,
        idFace: widget.idFace,
        idINE: widget.idINE,
      ),
    );
  }

  _navigateToNextPage() async {

    var updateCustomerLvl = await getIt<ICustomerLevelRepoMx>()
        .updateCustomerLevel(CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO);
    print(updateCustomerLvl);
    ExtendedNavigator.rootNavigator.pushReplacementNamed(
      Routes.investingVerificationOverviewMx,
      arguments: InvestingVerificationOverviewMxArguments(
        check1: true,
        check2: true,
        goal: widget.goal,
        bankTransfer: widget.bankTransfer,
        bankTransferValue: widget.bankTransferValue,
        bankAccountItem: widget.bankAccountItem,
        goals: widget.goals,
        multiple: widget.multiple,
        valuesChosen: widget.valuesChosen,
        finishedVerification: true,
      ),
    );
    /*  if (widget.firstVideo) {
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.videoSenderPage,
        arguments: VideoSenderPageArguments(
          goal: widget.goal,
          bankTransfer: widget.bankTransfer,
          bankTransferValue: widget.bankTransferValue,
          bankAccountItem: widget.bankAccountItem,
          goals: widget.goals,
          multiple: widget.multiple,
          valuesChosen: widget.valuesChosen,
          firstVideo: false,
          idFace: widget.idFace,
          idINE: widget.idINE,
        ),
      );
    } else {
      var updateCustomerLvl = await getIt<ICustomerLevelRepoMx>()
          .updateCustomerLevel(CustomerLevelRepository.TU_IDENTIDAD_DOMICILIO);
      print(updateCustomerLvl);
      ExtendedNavigator.rootNavigator.pushReplacementNamed(
        Routes.investingVerificationOverviewMx,
        arguments: InvestingVerificationOverviewMxArguments(
          check1: true,
          check2: true,
          goal: widget.goal,
          bankTransfer: widget.bankTransfer,
          bankTransferValue: widget.bankTransferValue,
          bankAccountItem: widget.bankAccountItem,
          goals: widget.goals,
          multiple: widget.multiple,
          valuesChosen: widget.valuesChosen,
          finishedVerification: true,
        ),
      );
    }*/
  }


  Future stopVideoRecording() async {
    final CameraController cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {


      print("aquiii puede estar el errro -----------------   ${e}");
      return null;
    }
  }



  _makeCall() {
    //_renderer.initialize();
    print("Making call...");




    /*  setState(() {
      isConnected = false;
      isError = false;
    });
    signaling.onLocalStream = (a) {
      isConnected = false;
      _renderer.srcObject = a;
    };
    //ON ICE COMPLETE
    signaling.onIceComplete = () {
      setState(() {
        // isConnected = true;
      });
    };
    //ON RESPONSE
    signaling.onResponse = () {
      setState(() {
        print("Setting onResponse");
        print("=====================================");
        loadingString = "Esperando respuesta del servidor";
      });
    };
    signaling.onConnected = () {
      print("ON Connected");
      print("=====================================");
      isConnected = true;
      Future.delayed(Duration(seconds: 10)).then((value) {
        if (isError) return;
        setState(() {
          isDone = true;
          _stop();
          isConnected = true;
          ToastHelper.createSuccess(
            message: "Vídeo exitoso",
            duration: Duration(
              seconds: 5,
            ),
          ).show(context);

          Future.delayed(Duration(seconds: 3))
              .then((value) => _navigateToNextPage());
        });
      });
    };
    //ON Offer
    signaling.onOffer = () {
      setState(() {
        loadingString = "Esperando respuesta del servidor";
      });
    };
    //ON ERROR
    signaling.onError = (error) {
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print("WebRTC Error: $error");
      ToastHelper.createError(message: error, duration: Duration(seconds: 5))
          .show(context);
      setState(() {
        isConnected = false;
        isError = true;
        _stop();
      });
    };

    //On ice candidate
    signaling.onIceCandidate = () {
      setState(() {});
    };
    String id = widget.idINE;
    if (widget.firstVideo) {
      id = widget.idFace;
    }
    print("__________________________________");
    print("Initializing Call.... with id: $id");
    signaling.makeCall(id);*/
  }

  _stop() {
    setState(() {

      isConnected = false;
    });
  }

  @override
  void dispose() {
    print("Dispose....");

    super.dispose();
  }
}
