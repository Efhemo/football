// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://newsapi.org/v2/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<NewsResponse> news(
      {category = "sport", country = "us", apiKey}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'country': country,
      r'apiKey': apiKey
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('top-headlines',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsResponse.fromJson(_result.data);
    return value;
  }
}
