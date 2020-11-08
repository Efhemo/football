
import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:football/data/helper/ErrorData.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_wrapper.freezed.dart';

@freezed
abstract class ResultWrapper<T> with _$ResultWrapper<T> {
  const factory ResultWrapper.success({@required T data}) = Success<T>;
  const factory ResultWrapper.error({@required ErrorData error}) = Error<T>;
  const factory ResultWrapper.networkError({String message}) = NetworkError<T>;
}