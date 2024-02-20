import 'package:hive/hive.dart';

import '../../features/quotes/domain/entities/quotes_entity.dart';
import '../../features/quotes/domain/entities/random_quote.dart';
import '../../features/quotes/domain/entities/today_quote.dart';
import '../utils/constants_manager.dart';

void saveQuote(List<QuotesEntity> book, String boxName) {
  var box = Hive.box<QuotesEntity>(boxName);
  box.addAll(book);
}

addQuoteRandomHive(List<RandomQuoteEntity> book) {
  var box = Hive.box<RandomQuoteEntity>(AppConstants.kQuotesRandomBox);
  box.addAll(book);
}

addQuoteTodayHive(List<TodayQuoteEntity> book) async {
  var box = Hive.box<TodayQuoteEntity>(AppConstants.kQuotesTodayBox);
  box.addAll(book);
}
