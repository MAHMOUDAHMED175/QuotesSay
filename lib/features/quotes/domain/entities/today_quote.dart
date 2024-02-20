import 'package:hive/hive.dart';

part 'today_quote.g.dart';

@HiveType(typeId: 3)
class TodayQuoteEntity {
  @HiveField(0)
  final String quote;
  @HiveField(1)
  final String author;

  TodayQuoteEntity({required this.quote, required this.author});
}
