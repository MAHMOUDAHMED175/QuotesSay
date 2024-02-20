import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'quotes_with_images_hive_entity.g.dart';

@HiveType(typeId: 1)
class QuotesWithImagesHiveEntity extends HiveObject {
  @HiveField(0)
  final String quote;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final Uint8List image;

  QuotesWithImagesHiveEntity(
      {required this.quote, required this.author, required this.image});
}
