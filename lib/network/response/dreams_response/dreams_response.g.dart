// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dreams_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DreamsResponseAdapter extends TypeAdapter<DreamsResponse> {
  @override
  final int typeId = 1;

  @override
  DreamsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DreamsResponse(
      blogHeader: (fields[0] as List).cast<BlogHeaderVO>(),
      blogDetail: (fields[1] as List).cast<BlogDetailsVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, DreamsResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.blogHeader)
      ..writeByte(1)
      ..write(obj.blogDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DreamsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamsResponse _$DreamsResponseFromJson(Map<String, dynamic> json) =>
    DreamsResponse(
      blogHeader: (json['BlogHeader'] as List<dynamic>)
          .map((e) => BlogHeaderVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogDetail: (json['BlogDetail'] as List<dynamic>)
          .map((e) => BlogDetailsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DreamsResponseToJson(DreamsResponse instance) =>
    <String, dynamic>{
      'BlogHeader': instance.blogHeader,
      'BlogDetail': instance.blogDetail,
    };
