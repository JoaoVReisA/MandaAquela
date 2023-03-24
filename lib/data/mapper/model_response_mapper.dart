import 'dart:convert';
import 'dart:io';

import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/data/mapper/response_mapper.dart';
import 'package:manda_aquela/data/models/model_response.dart';

class ModelResponseMapper extends ResponseMapper<ModelResponse> {
  @override
  ModelResponse fromResponse(String responseBody) {
    if (responseBody.isEmpty) {
      throw const CustomException(
          HttpStatus.notImplemented, "Empty response body");
    }

    final jsonMap = json.decode(responseBody);

    return ModelResponse(
      code: jsonMap["code"],
      message: jsonMap["message"],
      data: jsonMap["data"],
    );
  }
}
