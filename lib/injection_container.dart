import 'package:football/data/datasource/news_local_data_source.dart';
import 'package:football/data/datasource/news_remote_data_source.dart';
import 'package:football/data/retrofit/api_service.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:football/domain/domain.dart';


import 'data/repository/news_repository_imp.dart';
import 'domain/datasource/news_remote_datasource.dart';

final injector = GetIt.instance;

Future<void> init() async {

  //provide ApiService
  injector.registerLazySingleton(() => ApiService.create());

  //NewsRemoteDataSourceImpl
  injector.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(apiService: injector.get()));
  //NewsRemoteDataSourceImpl
  injector.registerLazySingleton<NewsLocalDataSourceImpl>(() => NewsLocalDataSourceImpl());
  //NewsRepository
  injector.registerLazySingleton<NewsRepository>(() => NewsRepositoryImp(injector.get(), injector.get()));

  injector.registerFactory<NewsProvider>(() => NewsProvider(newsRepository: injector.get()));
}
