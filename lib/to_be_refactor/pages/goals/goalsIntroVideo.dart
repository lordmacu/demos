import 'dart:async';
import 'dart:ffi';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:video_player/video_player.dart';

class GoalsIntroVideo extends StatefulWidget {
  @override
  _GoalsIntroVideoState createState() => _GoalsIntroVideoState();
}

class _GoalsIntroVideoState extends State<GoalsIntroVideo> {
  VideoPlayerController _controller;
  ChewieController _chewieController;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://cdn.banlinea.com/banlinea-products/UALET/V2.0/goals/VIDEO_METAS_JUL_28.mp4',
    );

    // _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(false);
    _controller.play();
    _controller.addListener(() {
      if (_controller.value.duration.compareTo(_controller.value.position) ==
          0) {
        ExtendedNavigator.rootNavigator.pushReplacementNamed(Routes.goalsPages,
            arguments: GoalsPagesArguments(
              isFirstGoal: true,
            ));
      }
    });

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        // aspectRatio: _controller.value.aspectRatio,
        aspectRatio: 9 / 16,
        autoPlay: true,
        looping: false,
        allowFullScreen: false,
        autoInitialize: true,
        // customControls: MaterialControl,

        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          bufferedColor: AppColors.primaryColor,
          handleColor: AppColors.primaryColor,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(children: <Widget>[
            Chewie(
              controller: _chewieController,
            ),
            Positioned(
              right: 20,
              top: 0,
              child: InkWell(
                onTap: () {
                  ExtendedNavigator.rootNavigator
                      .pushReplacementNamed(Routes.goalsPages,
                          arguments: GoalsPagesArguments(
                            isFirstGoal: true,
                          ));
                },
                child: Opacity(
                  opacity: 0.70,
                  child: Container(
                    padding: EdgeInsets.zero,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.close,
                        size: 25, color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  Widget build2(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            // aspectRatio: _controller.value.aspectRatio,
            aspectRatio: 9 / 16,
            child: Chewie(
              controller: _chewieController,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
