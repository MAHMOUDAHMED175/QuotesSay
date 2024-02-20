// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_quote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomQuoteEntityAdapter extends TypeAdapter<RandomQuoteEntity> {
  @override
  final int typeId = 2;

  @override
  RandomQuoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomQuoteEntity(
      quote: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RandomQuoteEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomQuoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
