// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_header_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogHeaderVO _$BlogHeaderVOFromJson(Map<String, dynamic> json) => BlogHeaderVO(
      id: (json['Id'] as num).toInt(),
      title: json['Title'] as String,
    );

Map<String, dynamic> _$BlogHeaderVOToJson(BlogHeaderVO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
    };
