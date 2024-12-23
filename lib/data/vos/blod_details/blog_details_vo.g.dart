// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogDetailsVOAdapter extends TypeAdapter<BlogDetailsVO> {
  @override
  final int typeId = 3;

  @override
  BlogDetailsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogDetailsVO(
      blogDetailId: fields[0] as int,
      blogId: fields[1] as int,
      blogContent: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogDetailsVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.blogDetailId)
      ..writeByte(1)
      ..write(obj.blogId)
      ..writeByte(2)
      ..write(obj.blogContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogDetailsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogDetailsVO _$BlogDetailsVOFromJson(Map<String, dynamic> json) =>
    BlogDetailsVO(
      blogDetailId: (json['BlogDetailId'] as num).toInt(),
      blogId: (json['BlogId'] as num).toInt(),
      blogContent: json['BlogContent'] as String,
    );

Map<String, dynamic> _$BlogDetailsVOToJson(BlogDetailsVO instance) =>
    <String, dynamic>{
      'BlogDetailId': instance.blogDetailId,
      'BlogId': instance.blogId,
      'BlogContent': instance.blogContent,
    };
