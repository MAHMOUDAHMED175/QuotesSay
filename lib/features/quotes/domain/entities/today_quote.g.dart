// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_quote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodayQuoteEntityAdapter extends TypeAdapter<TodayQuoteEntity> {
  @override
  final int typeId = 3;

  @override
  TodayQuoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodayQuoteEntity(
      quote: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodayQuoteEntity obj) {
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
      other is TodayQuoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
