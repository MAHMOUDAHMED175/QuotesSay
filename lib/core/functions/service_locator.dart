import 'package:get_it/get_it.dart';
import 'package:windowappflutter/core/network/remote/dioHelper.dart';
import 'package:windowappflutter/features/quotes/data/data_soutces/home_local_data_source.dart';
import 'package:windowappflutter/features/quotes/data/data_soutces/home_remote_data_source.dart';
import 'package:windowappflutter/features/quotes/data/repository/home_repository_impl.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image_with_text.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_image_quotes.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_quotes_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_random_quote_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_today_quote_use_case.dart';

final gitLocator = GetIt.instance;

void serviceLocator() {
  //api
  gitLocator.registerLazySingleton<ApiService>(() => ApiService());
//ndkVersion "25.1.8937393"
  //DataRemoteSourceImpl
  gitLocator.registerLazySingleton<HomeRemoteDataSourceImpl>(
      () => HomeRemoteDataSourceImpl(apiService: gitLocator.get<ApiService>()));
  //DataRemoteSourceImpl
  gitLocator.registerLazySingleton<HomeLocalDataSourceImpl>(
      () => HomeLocalDataSourceImpl());

  //homeRepositoryImpl
  gitLocator.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl(
        homeRemoteDataSource: gitLocator.get<HomeRemoteDataSourceImpl>(),
        homeLocalDataSource: gitLocator.get<HomeLocalDataSourceImpl>(),
      ));

  //useCase
  gitLocator.registerLazySingleton<GetQuotesUseCase>(() => GetQuotesUseCase(
        homeRepo: gitLocator.get<HomeRepositoryImpl>(),
      ));
  gitLocator
      .registerLazySingleton<GetImageQuotesUseCase>(() => GetImageQuotesUseCase(
            homeRepo: gitLocator.get<HomeRepositoryImpl>(),
          ));
  gitLocator
      .registerLazySingleton<GetRandomQuoteUseCase>(() => GetRandomQuoteUseCase(
            homeRepo: gitLocator.get<HomeRepositoryImpl>(),
          ));
  gitLocator
      .registerLazySingleton<GetTodayQuoteUseCase>(() => GetTodayQuoteUseCase(
            homeRepo: gitLocator.get<HomeRepositoryImpl>(),
          ));
  gitLocator.registerLazySingleton<GetDownloadImageUseCase>(
      () => GetDownloadImageUseCase(
            homeRepo: gitLocator.get<HomeRepositoryImpl>(),
          ));
  gitLocator.registerLazySingleton<GetDownloadImageWithTextUseCase>(
      () => GetDownloadImageWithTextUseCase(
            homeRepo: gitLocator.get<HomeRepositoryImpl>(),
          ));
}
