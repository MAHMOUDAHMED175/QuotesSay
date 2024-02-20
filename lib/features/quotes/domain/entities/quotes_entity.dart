import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'quotes_entity.g.dart';

@HiveType(typeId: 0)
class QuotesEntity extends HiveObject {
  @HiveField(0)
  final String quote;
  @HiveField(1)
  final String author;

  QuotesEntity({required this.quote, required this.author});
}
