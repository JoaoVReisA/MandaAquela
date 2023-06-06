class ModelResponse {
  ModelResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  dynamic data;
}
