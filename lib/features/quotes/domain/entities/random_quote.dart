import 'package:hive/hive.dart';

part 'random_quote.g.dart';

@HiveType(typeId: 2)
class RandomQuoteEntity {
  @HiveField(0)
  final String quote;
  @HiveField(1)
  final String author;

  RandomQuoteEntity({required this.quote, required this.author});
}
