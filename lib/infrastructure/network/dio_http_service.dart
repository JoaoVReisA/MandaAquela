import 'dart:io';

import 'package:dio/dio.dart';
import 'package:manda_aquela/infrastructure/auth_token.dart';
import 'package:manda_aquela/infrastructure/network/http_error_handler.dart';

import 'custom_http_response.dart';

abstract class HttpService {
  Future<CustomHttpResponse> get(String url, Map<String, dynamic> queryParams,
      {Map<String, String>? headers});

  Future<CustomHttpResponse> post(String url, dynamic body,
      ContentType contentType, Map<String, dynamic> queryParams);

  Future<CustomHttpResponse> put(String url, dynamic body,
      ContentType contentType, Map<String, dynamic> queryParams);

  Future<CustomHttpResponse> delete(
      String url, dynamic body, Map<String, dynamic> queryParams);
}

class DioHttpService implements HttpService {
  final Dio _client;
  final HttpErrorHandler _errorHandler;

  DioHttpService(this._client, this._errorHandler) {
    _setupResponseUTF8();
    _setupBaseUrl();
    _setupHeaders();
  }

  void _setupHeaders() {
    _client.options.headers[Headers.contentTypeHeader] = ContentType.json;

    if (AuthToken.instance.token.isNotEmpty) {
      _client.options.headers['Authorization'] =
          'Bearer ${AuthToken.instance.token}';
    }
  }

  void _setupResponseUTF8() {
    _client.options.responseType = ResponseType.plain;
  }

  void _setupBaseUrl() {
    _client.options.baseUrl = ''; //TODO: Criar classe para URls ;
  }

  @override
  Future<CustomHttpResponse> get(String url, Map<String, dynamic> queryParams,
      {Map<String, String>? headers}) async {
    try {
      final response = await _client.get(url, queryParameters: queryParams);
      return CustomHttpResponse(
          body: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw await _errorHandler.handleError(e);
    }
  }

  @override
  Future<CustomHttpResponse> delete(
      String url, dynamic body, Map<String, dynamic> queryParams) async {
    try {
      final response = await _client.delete(url, queryParameters: queryParams);
      return CustomHttpResponse(
          body: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw await _errorHandler.handleError(e);
    }
  }

  @override
  Future<CustomHttpResponse> put(String url, dynamic body,
      ContentType contentType, Map<String, dynamic> queryParams) async {
    try {
      final response = await _client.put(
        url,
        data: body,
        queryParameters: queryParams,
      );
      return CustomHttpResponse(
          body: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw await _errorHandler.handleError(e);
    }
  }

  @override
  Future<CustomHttpResponse> post(String url, dynamic body,
      ContentType contentType, Map<String, dynamic> queryParams) async {
    try {
      final response = await _client.post(
        url,
        data: body,
        queryParameters: queryParams,
      );

      return CustomHttpResponse(
          body: response.data, statusCode: response.statusCode);
    } on DioError catch (e) {
      throw await _errorHandler.handleError(e);
    }
  }

  Future<CustomHttpResponse> refreshToken(
      String path, String refreshToken) async {
    final response = await post(path, refreshToken, ContentType.text, {});
    return response;
  }
}
