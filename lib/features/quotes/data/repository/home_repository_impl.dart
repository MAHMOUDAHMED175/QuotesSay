import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/features/quotes/data/data_soutces/home_local_data_source.dart';
import 'package:windowappflutter/features/quotes/data/data_soutces/home_remote_data_source.dart';
import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class HomeRepositoryImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepositoryImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<QuotesEntity>>> getQuotes() async {
    try {
      //كدا هيفضل يجيب داتا واحده مبتتغيرش فى حاله اوفلاين
      //اما لو عايزها تتغير وتجيب داتا اوفلاين احدث حاجه هبدل ال remote مكان ال local وهنا لو يحصل ايرور فى النت  مش هياخد مناللوكال عشان كدا ممكن تديه الداتا فى الاسكرينه علول وتستدعى الفانكشن هناك او الميثود كما يسمونها
      // List<QuotesEntity> quotes = homeLocalDataSource.getQuotes();
      // if (quotes.isNotEmpty) {
      //   return right(quotes);
      // } else {
      //   quotes = await homeRemoteDataSource.getQuotes();
      //   return right(quotes);
      // }
      List<QuotesEntity> quotes = await homeRemoteDataSource.getQuotes();
      if (quotes.isNotEmpty) {
        return right(quotes);
      } else {
        quotes = homeLocalDataSource.getQuotes();
        return right(quotes);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ImageEntity>> getImageQuotes() async {
    try {
      ImageEntity quotes = await homeRemoteDataSource.getImageQuotes();
      return right(quotes);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RandomQuoteEntity>>> getRandomQuote() async {
    try {
      List<RandomQuoteEntity> randomQuotes =
          await homeRemoteDataSource.getRandomQuote();
      if (randomQuotes.isNotEmpty) {
        return right(randomQuotes);
      } else {
        randomQuotes = homeLocalDataSource.getQuotesRandom();
        return right(randomQuotes);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TodayQuoteEntity>>> getTodayQuote() async {
    try {
      List<TodayQuoteEntity> todayQuotes =
          await homeRemoteDataSource.getTodayQuote();
      if (todayQuotes.isNotEmpty) {
        print(
            "sssssssssssssssssssssssssssssssssssssssssss Remoote $todayQuotes");
        return right(todayQuotes);
      } else {
        todayQuotes = homeLocalDataSource.getQuotesToday();
        print(
            "ddddddddddddddddddddddddddddddddddddddddddddddddd  localll $todayQuotes");
        return right(todayQuotes);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadImage(
      String imageUrl, context) async {
    try {
      var downloadImage =
          await homeRemoteDataSource.downloadImage(imageUrl, context);
      return right(downloadImage);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> downloadImageWithText(
      String imageUrl, String text, context) async {
    try {
      var downloadImageWithText = await homeRemoteDataSource
          .downloadImageWithText(imageUrl, text, context);
      return right(downloadImageWithText);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
