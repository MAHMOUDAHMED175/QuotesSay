import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<QuotesEntity>>> getQuotes();
  Future<Either<Failure, ImageEntity>> getImageQuotes();
  Future<Either<Failure, List<RandomQuoteEntity>>> getRandomQuote();
  Future<Either<Failure, List<TodayQuoteEntity>>> getTodayQuote();
  Future<Either<Failure, String>> downloadImage(String imageUrl, context);
  Future<Either<Failure, String>> downloadImageWithText(
      String imageUrl, String text, context);
}
