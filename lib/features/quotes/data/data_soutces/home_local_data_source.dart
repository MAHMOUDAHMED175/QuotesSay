import 'package:hive/hive.dart';
import 'package:windowappflutter/core/utils/constants_manager.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';

abstract class HomeLocalDataSource {
  List<QuotesEntity> getQuotes();
  List<RandomQuoteEntity> getQuotesRandom();
  List<TodayQuoteEntity> getQuotesToday();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<QuotesEntity> getQuotes() {
    var box = Hive.box<QuotesEntity>(AppConstants.kQuotesBox);
    return box.values.toList();
  }

  @override
  List<RandomQuoteEntity> getQuotesRandom() {
    var box = Hive.box<RandomQuoteEntity>(AppConstants.kQuotesRandomBox);
    return box.values.toList();
  }

  @override
  List<TodayQuoteEntity> getQuotesToday() {
    var box = Hive.box<TodayQuoteEntity>(AppConstants.kQuotesTodayBox);
    return box.values.toList();
  }

  ///
}
