// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_with_images_hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotesWithImagesHiveEntityAdapter
    extends TypeAdapter<QuotesWithImagesHiveEntity> {
  @override
  final int typeId = 1;

  @override
  QuotesWithImagesHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuotesWithImagesHiveEntity(
      quote: fields[0] as String,
      author: fields[1] as String,
      image: fields[2] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, QuotesWithImagesHiveEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotesWithImagesHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
