class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class InternalServerError extends AppException {
  InternalServerError([String? message]) : super(message, "Error: ");
}

class UserNotFoundException extends AppException {
  UserNotFoundException([String? message]) : super(message, "user not found: ");
}

class TokenExpireException extends AppException {
  TokenExpireException([String? message]) : super(message, "Token Expired: ");
}
