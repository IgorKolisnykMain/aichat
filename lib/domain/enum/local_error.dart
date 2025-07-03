import 'package:flutter/widgets.dart';
import 'package:aichat/core/extensions/build_context_extensions.dart';

enum LocalError { defaultError, noInternetConnection, maxSizeImagePick, serverError }

extension ErrorExt on LocalError {
  String toMessage(BuildContext context) {
    switch (this) {
      case LocalError.defaultError:
        return context.l10n.defaultError;
      case LocalError.noInternetConnection:
        return context.l10n.noInternetConnection;
      case LocalError.maxSizeImagePick:
        return context.l10n.defaultError;
      case LocalError.serverError:
        return context.l10n.serverError;
    }
  }
}
