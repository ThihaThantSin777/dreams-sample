// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dreams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamsResponse _$DreamsResponseFromJson(Map<String, dynamic> json) => DreamsResponse(
      blogHeader: BlogHeaderVO.fromJson(json['BlogHeader'] as Map<String, dynamic>),
      blogDetail: BlogDetailsVO.fromJson(json['BlogDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DreamsResponseToJson(DreamsResponse instance) => <String, dynamic>{
      'BlogHeader': instance.blogHeader,
      'BlogDetails': instance.blogDetail,
    };
