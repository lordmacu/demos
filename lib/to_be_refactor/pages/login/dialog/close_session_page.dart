import 'dart:async';

import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/to_be_refactor/pages/login/dialog/close_session_dialog.dart';
import 'package:flutter/material.dart';

class CloseSessionPage extends StatefulWidget {
  CloseSessionPage({Key key}) : super(key: key);

  @override
  _CloseSessionPageState createState() => _CloseSessionPageState();
}

class _CloseSessionPageState extends State<CloseSessionPage> {
  bool redirect = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return CloseSessionDialog(
            redirect: redirect,
          );
        },
      );
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        redirect = true;
      });
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundSplashTopColor,
    );
  }
}
