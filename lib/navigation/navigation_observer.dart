import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyNavigatorObserver extends NavigatorObserver {
  final PublishSubject<String?> _routeNameSubject = PublishSubject<String?>();

  Stream<String?> get routeNameStream => _routeNameSubject.stream;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeNameSubject.add(route.settings.name);
    if (kDebugMode) {
      print("Did push route: ${route.settings.name}");
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print("Did pop route: ${route.settings.name}");
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (kDebugMode) {
      print("Did remove route: ${route.settings.name}");
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (kDebugMode) {
      print("Did replace route: ${newRoute?.settings.name}");
    }
  }
}
