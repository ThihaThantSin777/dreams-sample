// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dreams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamsResponse _$DreamsResponseFromJson(Map<String, dynamic> json) =>
    DreamsResponse(
      blogHeader: (json['BlogHeader'] as List<dynamic>)
          .map((e) => BlogHeaderVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogDetail: (json['BlogDetails'] as List<dynamic>)
          .map((e) => BlogDetailsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DreamsResponseToJson(DreamsResponse instance) =>
    <String, dynamic>{
      'BlogHeader': instance.blogHeader,
      'BlogDetails': instance.blogDetail,
    };
