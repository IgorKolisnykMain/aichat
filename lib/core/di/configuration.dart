import 'package:aichat/core/di/configuration.config.dart';
import 'package:aichat/core/di/locator.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$configureDependencies', preferRelativeImports: true, asExtension: false)
Future<void> configureDependencies(String environment) => $configureDependencies(locator, environment: environment);
