import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends InheritedWidget {
  final AppConfig config;

  const AppConfigProvider({super.key, required this.config, required super.child});

  static AppConfigProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfigProvider>();
  }

  @override
  bool updateShouldNotify(AppConfigProvider oldWidget) {
    return config != oldWidget.config;
  }
}
