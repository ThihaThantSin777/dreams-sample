// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_header_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogHeaderVOAdapter extends TypeAdapter<BlogHeaderVO> {
  @override
  final int typeId = 2;

  @override
  BlogHeaderVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogHeaderVO(
      id: fields[0] as int,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogHeaderVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogHeaderVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogHeaderVO _$BlogHeaderVOFromJson(Map<String, dynamic> json) => BlogHeaderVO(
      id: (json['BlogId'] as num).toInt(),
      title: json['BlogTitle'] as String,
      prefixWord: json['prefixWord'] as String?,
    );

Map<String, dynamic> _$BlogHeaderVOToJson(BlogHeaderVO instance) =>
    <String, dynamic>{
      'BlogId': instance.id,
      'BlogTitle': instance.title,
      'prefixWord': instance.prefixWord,
    };
