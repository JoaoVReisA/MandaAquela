class CustomHttpResponse {
  final int? statusCode;

  final String body;

  CustomHttpResponse({
    required this.body,
    required this.statusCode,
  });
}
