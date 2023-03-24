import 'dart:io';

class CustomException implements Exception {
  final int code;
  final String message;

  const CustomException(this.code, this.message);

  const CustomException.simpleConstructor(this.code, this.message);
}

class BadRequestException extends CustomException {
  BadRequestException(String message) : super(HttpStatus.badRequest, message);
}

class ConflictException extends CustomException {
  ConflictException(String message) : super(HttpStatus.conflict, message);
}

class UnauthorizedException extends CustomException {
  UnauthorizedException(String message)
      : super(HttpStatus.unauthorized, message);
}

class SessionExpiredException extends CustomException {
  SessionExpiredException(String message)
      : super(HttpStatus.unauthorized, message);
}

class NotFoundException extends CustomException {
  NotFoundException(String message) : super(HttpStatus.notFound, message);
}

class ConnectionException extends CustomException {
  ConnectionException(String message)
      : super(HttpStatus.networkConnectTimeoutError, message);
}

class ConnectivityException extends CustomException {
  ConnectivityException(String message)
      : super(HttpStatus.networkConnectTimeoutError, message);
}
