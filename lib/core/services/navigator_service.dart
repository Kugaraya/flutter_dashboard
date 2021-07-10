import 'package:passo_dashboard/core/base/base_service.dart';
import 'package:passo_dashboard/screens/main/main_screen.dart';
import 'package:seafarer/seafarer.dart';

import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  static final seafarer = Seafarer();
  final GlobalKey<NavigatorState>? navigatorKey = seafarer.navigatorKey;
  final generator = seafarer.generator();

  void createRoutes() {
    seafarer.addRoutes([
      // Just for good measure, we won't explicitly navigate to the InitialPage.
      SeafarerRoute(
        name: "/",
        builder: (context, args, params) {
          return MainScreen();
        },
      ),
    ]);
  }

  void navigateTo<T>(String pageRoute,
      {NavigationType? navigationType,
      Map<String, dynamic>? params,
      Duration? transitionDuration,
      List<SeafarerTransition>? transition,
      Curve? transitionCurve}) async {
    print('navigateTo: pageRoute - $pageRoute');

    seafarer.navigate(pageRoute,
        params: params != null ? params : null,
        transitionDuration: transitionDuration != null
            ? transitionDuration
            : Duration(milliseconds: 600),
        navigationType: navigationType != null ? navigationType : NavigationType.push,
        transitions: transition != null
            ? transition
            : [SeafarerTransition.fade_in, SeafarerTransition.fade_in],
        transitionCurve: transitionCurve != null ? transitionCurve : Curves.ease,
        removeUntilPredicate:
            navigationType == NavigationType.pushAndRemoveUntil
                ? (route) => false
                : null);
  }
}
