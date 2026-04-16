import 'package:flutter/foundation.dart';

import '../Network/error_message_model.dart';
import '../error/exceptions.dart';
import 'http_request.dart';

abstract class ModelValidation {
  String? validate();
}

class GenericRequest<T> {
  T Function(Map<String, dynamic> json) fromMap;
  HttpRequestHandler method;

  GenericRequest({required this.fromMap, required this.method});

  ServerException errorModel(dynamic response, String statusMessage,
          String errorMessage, ExpectType expectType) =>
      ServerException(
          errorMessageModel: ErrorMessageModel.parsing(
        modelName: T.toString(),
        expectType: expectType,
        requestApi: method,
        responseApi: response,
        statusMessage: statusMessage,
        errorMessage: errorMessage,
      ));

  Future<T> getObject({bool printBody = true}) async {
    Map<String, dynamic> response;
    if (method.body?.isNotEmpty ?? false) {
      response = await method.request(printBody: printBody);
    } else {
      response = await method.requestJson(printBody: printBody);
    }
    if (response["data"] is! Map) {
      throw errorModel(response, "data is not compatible with expected data",
          response["errors"]["message"] ?? "", ExpectType.object);
    }
    try {
      T result = fromMap(response["data"]);
      if (T is ModelValidation) {
        String? validateError = (result as ModelValidation).validate();
        if (validateError != null) {
          throw errorModel(response, validateError,
              response["errors"]["message"] ?? "", ExpectType.object);
        }
      }
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw errorModel(response, e.toString(),
          response["errors"]["message"] ?? "", ExpectType.object);
    }
  }

  Future<List<T>> getList({bool printBody = true}) async {
    Map<String, dynamic> response;
    if (method.body?.isNotEmpty ?? false) {
      response = await method.request(printBody: printBody);
    } else {
      response = await method.requestJson(printBody: printBody);
    }
    if (response is List) {
      response = {"data": response};
    }
    if (!(response["data"] is List || response["data"]["data"] is List)) {
      throw errorModel(response, "data is not compatible with expected data",
          response["errors"]["message"] ?? "", ExpectType.list);
    }
    final responseList = (response["data"] is List)
        ? response["data"]
        : response["data"]["data"];
    try {
      List<T> resultList = List<T>.from(responseList.map((e) => fromMap(e)));
      if (T is ModelValidation) {
        for (var item in resultList) {
          String? validateError = (item as ModelValidation).validate();
          if (validateError != null) {
            throw errorModel(response, validateError,
                response["errors"]["message"] ?? "", ExpectType.list);
          }
        }
      }
      return resultList;
    } catch (e) {
      if (kDebugMode) {
        print("ERROR When Get List  >>  ${e.toString()}");
      }
      throw errorModel(response, e.toString(),
          response["errors"]["message"] ?? "", ExpectType.object);
    }
  }

  Future<T> getResponse({bool printBody = true}) async {
    Map<String, dynamic> response;
    if (method.body?.isNotEmpty ?? false) {
      response = await method.request(printBody: printBody);
    } else {
      response = await method.requestJson(printBody: printBody);
    }

    try {
      T result = fromMap(response);
      if (T is ModelValidation) {
        String? validateError = (result as ModelValidation).validate();
        if (validateError != null) {
          throw errorModel(response, validateError,
              response["errors"]["message"] ?? "", ExpectType.other);
        }
      }
      return result;
    } catch (e) {
      throw errorModel(response, e.toString(),
          response["errors"]["message"] ?? "", ExpectType.other);
    }
  }
}
