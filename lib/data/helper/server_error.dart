import 'package:dio/dio.dart' hide Headers;
import 'package:football/domain/model/failure.dart';

class ServerError implements Exception {
  String _errorMessage = "";

  ServerError.withError({required DioException error}) {
    _handleError(error);
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioExceptionType.badResponse:
        _errorMessage = "Unknown Error";
        final errorBody = extractErrorBody(error);
        if (errorBody != null) {
          _errorMessage = errorBody.message;
        }
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      default:
        _errorMessage = "An unexpected error occurred";
        break;
    }
    return _errorMessage;
  }

  Failure? extractErrorBody(DioException error) {
    try {
      return Failure.fromJson(error.response?.data);
    } catch (e) {
      return null;
    }
  }
}
