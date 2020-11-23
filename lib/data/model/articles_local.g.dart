// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleLocalAdapter extends TypeAdapter<ArticleLocal> {
  @override
  ArticleLocal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleLocal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage)
      ..writeByte(5)
      ..write(obj.publishedAt);
  }
}
