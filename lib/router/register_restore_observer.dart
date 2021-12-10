import 'package:ualet/generated/l10n.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/to_be_refactor/preferences/preference.dart';
import 'package:flutter/cupertino.dart';

class RegisterRestoreObserver extends NavigatorObserver {
  final _preferenceUser = PreferenceUser();
  static const RestoringRoutes = [
    Routes.sendEmailRegisterPage,
    Routes.sendOTPRegisterPage
  ];

  RegisterRestoreObserver() {
    _preferenceUser.init();
  }

  static Locale locale = Locale.fromSubtags(languageCode: 'es', countryCode: 'MX');

  static bool CheckRestore(String routeName) {
    return RestoringRoutes.contains(routeName);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    print("Push: $route");
    S.load(locale);
    if (!CheckRestore(route.settings.name)) return;
    _preferenceUser.activeRoute = route.settings.name;
    _preferenceUser.activeRouteParams = route.settings.arguments;
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print("Pop: $route");
    S.load(locale);
    if (previousRoute == null) return;
    if (!CheckRestore(previousRoute.settings.name)) return;
    if(previousRoute == null) return;
    if(!CheckRestore(previousRoute.settings.name)) return;
    if(previousRoute.settings.name == _preferenceUser.activeRoute) {
      _preferenceUser.activeRoute = null;
      _preferenceUser.activeRouteParams = null;
      return;
    }
    _preferenceUser.activeRoute = previousRoute.settings.name;
    _preferenceUser.activeRouteParams = previousRoute.settings.arguments;
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    print("Replace: $newRoute");
    S.load(locale);
    if (!CheckRestore(newRoute.settings.name)) return;
    _preferenceUser.activeRoute = newRoute.settings.name;
    _preferenceUser.activeRouteParams = newRoute.settings.arguments;
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    print("Remove: $route");
    S.load(locale);
    if (previousRoute == null) return;
    if (!CheckRestore(previousRoute.settings.name)) return;
    _preferenceUser.activeRoute = previousRoute.settings.name;
    _preferenceUser.activeRouteParams = previousRoute.settings.arguments;
  }
}
