// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.football-data.org/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewsResponse> news(
      {category = "sport", country = "us", required String apiKey}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'country': country,
      r'apiKey': apiKey
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://newsapi.org/v2/top-headlines',
        queryParameters: queryParameters,
        options: Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra),
        data: _data);
    final value = NewsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TableResponse> standings(leagueId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'competitions/$leagueId/standings',
        queryParameters: queryParameters,
        options: Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra),
        data: _data);
    final value = TableResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GamesResponse> games(leagueId, dateFrom, dateTo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'dateFrom': dateFrom,
      r'dateTo': dateTo
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'competitions/$leagueId/matches',
        queryParameters: queryParameters,
        options: Options(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra),
        data: _data);
    final value = GamesResponse.fromJson(_result.data!);
    return value;
  }
}
