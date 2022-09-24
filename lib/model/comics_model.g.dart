// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComicsModelAdapter extends TypeAdapter<ComicsModel> {
  @override
  final int typeId = 0;

  @override
  ComicsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComicsModel(
      comicId: fields[0] as int,
      imagePath: fields[1] as String,
      comicTitle: fields[2] as String,
      comicDescription: fields[3] as String,
      characters: fields[4] as String,
      creators: fields[5] as String,
      pageCount: fields[6] as int,
      isFav: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ComicsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.comicId)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.comicTitle)
      ..writeByte(3)
      ..write(obj.comicDescription)
      ..writeByte(4)
      ..write(obj.characters)
      ..writeByte(5)
      ..write(obj.creators)
      ..writeByte(6)
      ..write(obj.pageCount)
      ..writeByte(7)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComicsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
