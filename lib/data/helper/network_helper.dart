import 'dart:io';
import 'package:football/data/helper/ErrorData.dart';
import 'package:football/data/helper/server_error.dart';
import 'package:football/domain/domain.dart';


//consider this boilerplate if this implementation does not work perfectly
//https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me

Future<ResultWrapper<T>> safeApiResult<T>(Future<T> call) async {

  try {
    return ResultWrapper.success(data: await call);
  } on SocketException {
    return ResultWrapper.networkError(message: "No Internet connection");
  }
  catch (error) {
    final errorBody = ServerError.withError(error: error);
    return ResultWrapper.error(error: ErrorData(message: errorBody.getErrorMessage()));
  }
}