// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dreams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamsResponse _$DreamsResponseFromJson(Map<String, dynamic> json) => DreamsResponse(
      blogHeader: BlogHeader.fromJson(json['BlogHeader'] as Map<String, dynamic>),
      blogDetail: BlogDetail.fromJson(json['BlogDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DreamsResponseToJson(DreamsResponse instance) => <String, dynamic>{
      'BlogHeader': instance.blogHeader,
      'BlogDetails': instance.blogDetail,
    };
