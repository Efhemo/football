// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'result_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ResultWrapperTearOff {
  const _$ResultWrapperTearOff();

  Success<T> success<T>({@required T data}) {
    return Success<T>(
      data: data,
    );
  }

  Error<T> error<T>({@required ErrorData error}) {
    return Error<T>(
      error: error,
    );
  }

  NetworkError<T> networkError<T>({String message}) {
    return NetworkError<T>(
      message: message,
    );
  }
}

// ignore: unused_element
const $ResultWrapper = _$ResultWrapperTearOff();

mixin _$ResultWrapper<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result error(ErrorData error),
    @required Result networkError(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result error(ErrorData error),
    Result networkError(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result error(Error<T> value),
    @required Result networkError(NetworkError<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result error(Error<T> value),
    Result networkError(NetworkError<T> value),
    @required Result orElse(),
  });
}

abstract class $ResultWrapperCopyWith<T, $Res> {
  factory $ResultWrapperCopyWith(
          ResultWrapper<T> value, $Res Function(ResultWrapper<T>) then) =
      _$ResultWrapperCopyWithImpl<T, $Res>;
}

class _$ResultWrapperCopyWithImpl<T, $Res>
    implements $ResultWrapperCopyWith<T, $Res> {
  _$ResultWrapperCopyWithImpl(this._value, this._then);

  final ResultWrapper<T> _value;
  // ignore: unused_field
  final $Res Function(ResultWrapper<T>) _then;
}

abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

class _$SuccessCopyWithImpl<T, $Res>
    extends _$ResultWrapperCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Success<T>(
      data: data == freezed ? _value.data : data as T,
    ));
  }
}

class _$Success<T> with DiagnosticableTreeMixin implements Success<T> {
  const _$Success({@required this.data}) : assert(data != null);

  @override
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResultWrapper<$T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResultWrapper<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result error(ErrorData error),
    @required Result networkError(String message),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return success(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result error(ErrorData error),
    Result networkError(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result error(Error<T> value),
    @required Result networkError(NetworkError<T> value),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result error(Error<T> value),
    Result networkError(NetworkError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements ResultWrapper<T> {
  const factory Success({@required T data}) = _$Success<T>;

  T get data;
  $SuccessCopyWith<T, Success<T>> get copyWith;
}

abstract class $ErrorCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) then) =
      _$ErrorCopyWithImpl<T, $Res>;
  $Res call({ErrorData error});
}

class _$ErrorCopyWithImpl<T, $Res> extends _$ResultWrapperCopyWithImpl<T, $Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(Error<T> _value, $Res Function(Error<T>) _then)
      : super(_value, (v) => _then(v as Error<T>));

  @override
  Error<T> get _value => super._value as Error<T>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Error<T>(
      error: error == freezed ? _value.error : error as ErrorData,
    ));
  }
}

class _$Error<T> with DiagnosticableTreeMixin implements Error<T> {
  const _$Error({@required this.error}) : assert(error != null);

  @override
  final ErrorData error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResultWrapper<$T>.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResultWrapper<$T>.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ErrorCopyWith<T, Error<T>> get copyWith =>
      _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result error(ErrorData error),
    @required Result networkError(String message),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result error(ErrorData error),
    Result networkError(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result error(Error<T> value),
    @required Result networkError(NetworkError<T> value),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result error(Error<T> value),
    Result networkError(NetworkError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ResultWrapper<T> {
  const factory Error({@required ErrorData error}) = _$Error<T>;

  ErrorData get error;
  $ErrorCopyWith<T, Error<T>> get copyWith;
}

abstract class $NetworkErrorCopyWith<T, $Res> {
  factory $NetworkErrorCopyWith(
          NetworkError<T> value, $Res Function(NetworkError<T>) then) =
      _$NetworkErrorCopyWithImpl<T, $Res>;
  $Res call({String message});
}

class _$NetworkErrorCopyWithImpl<T, $Res>
    extends _$ResultWrapperCopyWithImpl<T, $Res>
    implements $NetworkErrorCopyWith<T, $Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError<T> _value, $Res Function(NetworkError<T>) _then)
      : super(_value, (v) => _then(v as NetworkError<T>));

  @override
  NetworkError<T> get _value => super._value as NetworkError<T>;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(NetworkError<T>(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$NetworkError<T>
    with DiagnosticableTreeMixin
    implements NetworkError<T> {
  const _$NetworkError({this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResultWrapper<$T>.networkError(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResultWrapper<$T>.networkError'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NetworkError<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $NetworkErrorCopyWith<T, NetworkError<T>> get copyWith =>
      _$NetworkErrorCopyWithImpl<T, NetworkError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T data),
    @required Result error(ErrorData error),
    @required Result networkError(String message),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T data),
    Result error(ErrorData error),
    Result networkError(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result error(Error<T> value),
    @required Result networkError(NetworkError<T> value),
  }) {
    assert(success != null);
    assert(error != null);
    assert(networkError != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result error(Error<T> value),
    Result networkError(NetworkError<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError<T> implements ResultWrapper<T> {
  const factory NetworkError({String message}) = _$NetworkError<T>;

  String get message;
  $NetworkErrorCopyWith<T, NetworkError<T>> get copyWith;
}
