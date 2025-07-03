import 'package:aichat/domain/enum/local_error.dart';

class LocalException implements Exception {
  final LocalError error;

  LocalException(this.error);
}

class LocalCustomException implements Exception {
  final String error;

  LocalCustomException(this.error);
}

class NetworkException implements Exception {
  final String error;

  NetworkException(this.error);
}

class MaxSizePickedImageException extends LocalException {
  MaxSizePickedImageException() : super(LocalError.maxSizeImagePick);
}

class UnsupportedPlatform implements Exception {
  UnsupportedPlatform();
}
