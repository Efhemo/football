import 'package:football/data/model/games_response.dart';
import 'package:football/domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:football/data/data.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.football-data.org/v2/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create( String footballApiKey) {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.options.headers["X-Auth-Token"] = footballApiKey;
    return ApiService(dio);
  }

  @GET("http://newsapi.org/v2/top-headlines")
  Future<NewsResponse> news({
    @Query("category") String category = "sport",
    @Query("country") String country = "us",
    @Query("apiKey") String apiKey,
  });

  @GET("competitions/{id}/standings")
  Future<TableResponse> standings ( @Path("id") int leagueId);

  @GET("competitions/{id}/matches")
  Future<GamesResponse> games (
      @Path("id") int leagueId,
      @Query("dateFrom") String dateFrom,
      @Query("dateTo") String dateTo
      );
}
