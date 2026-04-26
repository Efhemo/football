import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:football/domain/domain.dart';
import 'package:football/data/helper/server_error.dart';

Future<Either<Failure, R>> safeApiResult<R>(Future<R> call) async {
  try {
    final result = await call;
    return Right(result);
  } on SocketException {
    return Left(Failure(message: "No Internet connection"));
  } on DioException catch (error) {
    final errorBody = ServerError.withError(error: error);
    return Left(Failure(message: errorBody.getErrorMessage()));
  } catch (error) {
    return Left(Failure(message: error.toString()));
  }
}
