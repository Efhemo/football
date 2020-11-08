import 'package:football/domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://newsapi.org/v2/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("top-headlines")
  Future<NewsResponse> news({
    @Query("category") String category = "sport",
    @Query("country") String country = "us",
    @Query("apiKey") String apiKey,
  });
}
