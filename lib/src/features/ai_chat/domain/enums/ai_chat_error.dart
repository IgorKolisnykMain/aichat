enum AiChatError {
  rateLimitExceeded,
  authenticationFailed,
  serverError,
  requestError,
  noInternetConnection,
  unknown,
}

extension AiChatErrorExtension on AiChatError {
  //todo add localizable messages
  String get message {
    switch (this) {
      case AiChatError.rateLimitExceeded:
        return 'Rate limit exceeded. Please try again later.';
      case AiChatError.authenticationFailed:
        return 'Authentication failed. Please check your API key.';
      case AiChatError.serverError:
        return 'Server error occurred. Please try again.';
      case AiChatError.requestError:
        return 'Request error occurred. Please check your request.';
      case AiChatError.noInternetConnection:
        return 'No internet connection. Please check your network.';
      case AiChatError.unknown:
        return 'An unknown error occurred.';
    }
  }
}
