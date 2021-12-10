import 'dart:async';

import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EntrevistaWebView extends StatefulWidget {
  final String url;

  const EntrevistaWebView({Key key, @required this.url}) : super(key: key);

  @override
  _EntrevistaWebViewState createState() => _EntrevistaWebViewState();
}

class _EntrevistaWebViewState extends State<EntrevistaWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool loading;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: AppColors.backgroundColor,
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: FutureBuilder<WebViewController>(
                      builder: (context, snapshot) {
                        return WebView(
                          debuggingEnabled: true,
                          initialUrl: widget.url,
                          javascriptMode: JavascriptMode.unrestricted,

                          onWebResourceError: (_) {
                            ToastHelper.createError(
                                    message: "Error",
                                    duration: Duration(seconds: 10))
                                .show(context);
                          },
                          onPageStarted: (url) {
                            setState(() {
                              loading = true;
                            });
                          },
                          onPageFinished: (url) {
                            setState(() {
                              loading = false;
                            });
                          },
                          onWebViewCreated: (WebViewController controller) {
                            setState(() {
                              // loading = false;
                            });
                            _controller.complete(controller);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            LoadingInProgressOverlay(
              isLoading: loading,
            ),
          ]),
        ),
      ),
      onWillPop: () {},
    );
  }
}
