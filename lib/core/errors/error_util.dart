import 'failure.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'Authorization failure';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Authentication failure';
const String NETWORK_FAILURE_MESSAGE = 'Network failure';
const String EMPTY_INPUT_FAILURE_MESSAGE = 'Empty Input - Enter a Valid Login';
const String TOKEN_EXPIRATION_FAILURE_MESSAGE = 'Session has been Expired';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Empty Input - Enter a Valid Login';
const String Incorrect_Email_OR_Password = 'Incorrect Email OR Password';

class ErrorUtils {
  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NetworkFailure:
        return NETWORK_FAILURE_MESSAGE;
      case TokenExpirationFailure:
        return TOKEN_EXPIRATION_FAILURE_MESSAGE;
      case InvalidInputFailure:
        return INVALID_INPUT_FAILURE_MESSAGE;
      case UnauthorizedFailure:
        return Incorrect_Email_OR_Password;
      default:
        return "Unexpected error";
    }
  }
}
