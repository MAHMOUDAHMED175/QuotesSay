import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:windowappflutter/core/utils/constants_manager.dart';
import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_with_images_hive_entity.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image_with_text.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_image_quotes.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_quotes_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_random_quote_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_today_quote_use_case.dart';
import 'package:windowappflutter/features/quotes/presentation/view/screens/day_quote.dart';
import 'package:windowappflutter/features/quotes/presentation/view/screens/favorites.dart';
import 'package:windowappflutter/features/quotes/presentation/view/screens/quotes.dart';
import 'package:windowappflutter/features/quotes/presentation/view/screens/random_quote.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_state.dart';

import '../../../../domain/entities/random_quote.dart';
import '../../../../domain/entities/today_quote.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit({
    required this.getImageQuotesUseCase,
    required this.getRandomQuoteUseCase,
    required this.getTodayQuoteUseCase,
    required this.getQuotesUseCase,
    required this.getDownloadImageUseCase,
    required this.getDownloadImageWithTextUseCase,
  }) : super(QuotesInitial());

  static QuotesCubit get(context) => BlocProvider.of(context);

  List<RandomQuoteEntity> randomQuotes = [];
  List<TodayQuoteEntity> todayQuotes = [];

  List<QuotesWithImagesHiveEntity>? quotesWithImages = [];
  fetchAllQuotesWithImages() async {
    var noteBox =
        Hive.box<QuotesWithImagesHiveEntity>(AppConstants.kQuotesWithImagesBox);
    quotesWithImages = noteBox.values.toList();
    emit(QuotesFetchAllQuotesWithImages());
  }

  addQuoteWithImage(
      QuotesWithImagesHiveEntity quotesWithImagesHiveEntity) async {
    emit(QuotesAddQuotesWithImagesLoading());
    try {
      var noteBox = Hive.box<QuotesWithImagesHiveEntity>(
          AppConstants.kQuotesWithImagesBox);
      await noteBox.add(quotesWithImagesHiveEntity);
      emit(QuotesAddQuotesWithImagesSuccess());
    } catch (error) {
      print(error.toString());
      emit(QuotesAddQuotesWithImagesFailure());
    }
  }

  ImageEntity imageQuote = ImageEntity(
      image:
          "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/space-galaxy-background-sololos.jpg");
  List<QuotesEntity> quotes = [];

  int currentIndex = 0;
  List<Widget> screen = [
    DayQuote(),
    Quotess(),
    RandomQuote(),
    const Favorites(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(QuotesChangButtomNavState());
  }

  final GetQuotesUseCase getQuotesUseCase;
  final GetImageQuotesUseCase getImageQuotesUseCase;
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  final GetTodayQuoteUseCase getTodayQuoteUseCase;
  final GetDownloadImageUseCase getDownloadImageUseCase;
  final GetDownloadImageWithTextUseCase getDownloadImageWithTextUseCase;

  Future<void> getQuotes() async {
    emit(QuotesLoading());

    var result = await getQuotesUseCase.call();
    result.fold((failure) {
      emit(QuotesFailure(error: failure.message.toString()));
    }, (quotes) {
      emit(QuotesSuccess(quote: quotes));
    });
  }

  Future<void> getImageForQuote() async {
    emit(QuotesImageLoading());
    var result = await getImageQuotesUseCase.call();
    result.fold((failure) {
      emit(QuotesImageFailure(error: failure.message.toString()));
    }, (imagesQuotes) {
      emit(QuotesImageSuccess(imageQuote: imagesQuotes));
    });
  }

  Future<void> getRandomQuote() async {
    emit(QuotesRandomLoading());

    var result = await getRandomQuoteUseCase.call();
    result.fold((failure) {
      emit(QuotesRandomFailure(error: failure.message.toString()));
    }, (randomQuotes) {
      emit(QuotesRandomSuccess(quote: randomQuotes));
    });
  }

  Future<void> getTodayQuote() async {
    emit(QuotesTodayLoading());
    var result = await getTodayQuoteUseCase.call();
    result.fold((failure) {
      emit(QuotesTodayFailure(error: failure.message.toString()));
    }, (todayQuotes) {
      emit(QuotesTodaySuccess(quote: todayQuotes));
    });
  }

  Future<void> shareImageWithText(String imageUrl, text, context) async {
    var filePath =
        await downloadImageWithTextCubitMethod(imageUrl, text, context);
    Share.shareXFiles([XFile(filePath)], text: text);
  }

  Future<void> shareImage(String imageUrl, context) async {
    var filePath = await downloadImageCubitMethod(imageUrl, context);
    Share.shareXFiles(
      [XFile(filePath)],
    );
  }

  Future<String> downloadImageCubitMethod(imageUrl, context) async {
    var string = "";
    emit(QuotesGetDownloadImageCubitMethodLoading());
    var result = await getDownloadImageUseCase
        .call(DownloadImageParams(imageUrl: imageUrl, context: context));
    result.fold((failure) {
      emit(QuotesGetDownloadImageCubitMethodFailure(
          error: failure.message.toString()));
    }, (value) {
      string = value;
      emit(QuotesGetDownloadImageCubitMethodSuccess());
    });
    return string;
  }

  Future<String> downloadImageWithTextCubitMethod(
      imageUrl, text, context) async {
    var string = "";
    emit(QuotesGetDownloadImageWithTextCubitMethodLoading());
    var result = await getDownloadImageWithTextUseCase.call(
        DownloadImageWithTextParams(
            imageUrl: imageUrl, text: text, context: context));
    result.fold((failure) {
      emit(QuotesGetDownloadImageWithTextCubitMethodFailure(
          error: failure.message.toString()));
    }, (value) {
      string = value;
      emit(QuotesGetDownloadImageWithTextCubitMethodSuccess());
    });
    return string;
  }
}
