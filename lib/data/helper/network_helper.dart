import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:football/domain/model/failure.dart';
import 'package:football/data/helper/server_error.dart';
import 'package:football/domain/domain.dart';


//consider this boilerplate if this implementation does not work perfectly
//https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me

Future<Either<Failure, R>> safeApiResult<R>(Future<R> call) async {

  try {
    final result = await call;
    return Right(result);
  } on SocketException {
    return Left(Failure(message: "No Internet connection"));
  }
  catch (error) {
    final errorBody = ServerError.withError(error: error);
    return Left(Failure(message: errorBody.getErrorMessage()));
  }
}