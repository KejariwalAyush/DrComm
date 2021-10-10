import '../../data.dart';

class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  ApiException([this.message, this.prefix, this.url]);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url) {
    KErrorToast(msg: 'Bad Request Exception!');

    // Get.find<AnalyticsService>()
    //     .logApiError(message: message ?? 'Bad Request', link: url ?? 'No Link');
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url) {
    KErrorToast(msg: 'Unable to process');

    // Get.find<AnalyticsService>().logApiError(
    //     message: message ?? 'Fetch Data Exception', link: url ?? 'No Link');
  }
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not Responded', url) {
    KErrorToast(msg: 'Server Error: Api Not Responding!');
    // Get.find<AnalyticsService>().logApiError(
    //     message: message ?? 'Api Not Responding', link: url ?? 'No Link');
  }
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorised Request', url) {
    KErrorToast(msg: 'UnAuthorised Request');
    // Get.find<AnalyticsService>().logUnAuthorized(link: url ?? 'No Link Found');
  }
}
