
import 'dart:io';
import 'dart:math';

import 'package:ualet/router/register_restore_observer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ualet/presentation/core/design/app_theme.dart';
import 'package:ualet/router/router.gr.dart' as r;
import 'package:ualet/to_be_refactor/providers/controller/sqliteHelper.dart';
import 'package:flutter/services.dart';

import 'generated/l10n.dart';
import 'package:sizer/sizer.dart';


class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    RegisterRestoreObserver routerObserver = new RegisterRestoreObserver();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SqliteHelper())],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: LayoutBuilder(                           //return LayoutBuilder
          builder: (context, constraints) {
            return OrientationBuilder(                  //return OrientationBuilder
              builder: (context, orientation) {
                //initialize SizerUtil()
                SizerUtil().init(constraints, orientation);  //initialize SizerUtil
                return MaterialApp(
                  title: 'UALET',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.primaryTheme,
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  builder: ExtendedNavigator<r.Router>(
                    router: r.Router(),
                    observers: [routerObserver],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


