import 'package:football/data/datasource/datasource.dart';
import 'package:football/data/datasource/footbal/football_local_data_source.dart';
import 'package:football/data/datasource/footbal/football_remote_data_source_imp.dart';
import 'package:football/data/repository/football_repository_imp.dart';
import 'package:football/data/retrofit/api_service.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/data.dart';


import 'data/repository/news_repository_imp.dart';
import 'data/datasource/footbal/news_remote_datasource.dart';

final injector = GetIt.instance;

Future<void> init() async {

  //provide secret keys
  injector.registerSingleton<SecretLoader>(SecretLoader(secretPath: "secrets.json") );

  //provide ApiService
  final SecretLoader secretLoader = injector.get();
  final apikey = await secretLoader.load();
  injector.registerLazySingleton(() => ApiService.create(apikey.footballApiKey));

  //NewsRemoteDataSourceImpl
  injector.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(apiService: injector.get()));
  //NewsRemoteDataSourceImpl
  injector.registerLazySingleton<NewsLocalDataSourceImpl>(() => NewsLocalDataSourceImpl());
  //NewsRepository
  injector.registerLazySingleton<NewsRepository>(() => NewsRepositoryImp(injector.get(), injector.get(), injector.get()));

  //FootballRemoteDataSourceImpl
  injector.registerLazySingleton<FootballRemoteDataSource>(() => FootballRemoteDataSourceImpl(apiService: injector.get()));
  //FootballRemoteDataSourceImpl
  injector.registerLazySingleton<FootballLocalDataSourceImpl>(() => FootballLocalDataSourceImpl());
  //FootballRepository
  injector.registerLazySingleton<FootballRepository>(() => FootballRepositoryImp(injector.get(), injector.get()));


  injector.registerFactory<NewsProvider>(() => NewsProvider(newsRepository: injector.get()));
  injector.registerFactory<FootballProvider>(() => FootballProvider(injector.get()));
}
