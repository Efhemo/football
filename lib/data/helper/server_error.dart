import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:football/data/helper/ErrorData.dart';

class ServerError implements Exception {
  String _errorMessage = "";

  ServerError.withError({@required  DioError error}) {
    _handleError(error);
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.DEFAULT:
        _errorMessage =
        "Connection failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.RESPONSE:
        _errorMessage = "Unknown Error";
        final errorBody = extractErrorBody(error);
        if( errorBody != null){ _errorMessage = errorBody.message;}
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = "Receive timeout in send request";
        break;
    }
    return _errorMessage;
  }

  ErrorData extractErrorBody(DioError error){
    try {
      return ErrorData.fromJson(error.response.data);
    } catch (e){
      return null;
    }
  }
}