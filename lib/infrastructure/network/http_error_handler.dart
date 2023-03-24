import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../core/custom_exceptions.dart';

abstract class HttpErrorHandler {
  Future<Exception> handleError(dynamic error);
}

class DioHttpErrorHandler extends HttpErrorHandler {
  @override
  Future<Exception> handleError(dynamic error) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      return ConnectivityException('');
    }

    if (error?.response?.statusCode == HttpStatus.notFound) {
      return NotFoundException(
        error.response.statusCode.toString(),
      );
    }

    if (error?.response?.statusCode == HttpStatus.badRequest) {
      return BadRequestException(
        error.response.statusCode.toString(),
      );
    }

    if (error?.response?.statusCode == HttpStatus.conflict) {
      final Map<String, dynamic> map = jsonDecode(error?.response.data);
      return ConflictException(
        map['message'] ?? '',
      );
    }

    if (error?.response?.statusCode == HttpStatus.unauthorized) {
      return UnauthorizedException(error.response.statusCode.toString());
    }

    if (error?.error == DioErrorType.connectionError) {
      return ConnectionException(
          'Request to ${error.requestOptions.path} timed out');
    }

    return Exception(error.message);
  }
}
