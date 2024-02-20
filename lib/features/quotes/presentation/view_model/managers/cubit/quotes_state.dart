import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';

abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesChangButtomNavState extends QuotesState {}

class QuotesFetchAllQuotesWithImages extends QuotesState {}

class QuotesAddQuotesWithImagesLoading extends QuotesState {}

class QuotesAddQuotesWithImagesSuccess extends QuotesState {}

class QuotesAddQuotesWithImagesFailure extends QuotesState {}

class QuotesFetchAllQuotesRandom extends QuotesState {}

class QuotesFetchAllQuotesToday extends QuotesState {}

class QuotesLoading extends QuotesState {}

class QuotesSuccess extends QuotesState {
  List<QuotesEntity> quote;
  QuotesSuccess({required this.quote});
}

class QuotesFailure extends QuotesState {
  final String error;

  QuotesFailure({required this.error});
}

class QuotesImageLoading extends QuotesState {}

class QuotesImageSuccess extends QuotesState {
  ImageEntity imageQuote;
  QuotesImageSuccess({required this.imageQuote});
}

class QuotesImageFailure extends QuotesState {
  final String error;

  QuotesImageFailure({required this.error});
}

class QuotesRandomLoading extends QuotesState {}

class QuotesRandomSuccess extends QuotesState {
  List<RandomQuoteEntity> quote;
  QuotesRandomSuccess({required this.quote});
}

class QuotesRandomFailure extends QuotesState {
  final String error;

  QuotesRandomFailure({required this.error});
}

class QuotesTodayLoading extends QuotesState {}

class QuotesTodaySuccess extends QuotesState {
  List<TodayQuoteEntity> quote;
  QuotesTodaySuccess({required this.quote});
}

class QuotesTodayFailure extends QuotesState {
  final String error;

  QuotesTodayFailure({required this.error});
}

class QuotesGetDownloadImageCubitMethodLoading extends QuotesState {}

class QuotesGetDownloadImageCubitMethodSuccess extends QuotesState {}

class QuotesGetDownloadImageCubitMethodFailure extends QuotesState {
  final String error;

  QuotesGetDownloadImageCubitMethodFailure({required this.error});
}

class QuotesGetDownloadImageWithTextCubitMethodLoading extends QuotesState {}

class QuotesGetDownloadImageWithTextCubitMethodSuccess extends QuotesState {}

class QuotesGetDownloadImageWithTextCubitMethodFailure extends QuotesState {
  final String error;

  QuotesGetDownloadImageWithTextCubitMethodFailure({required this.error});
}
