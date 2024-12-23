// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_header_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogHeader _$BlogHeaderFromJson(Map<String, dynamic> json) => BlogHeader(
      id: (json['Id'] as num).toInt(),
      title: json['Title'] as String,
    );

Map<String, dynamic> _$BlogHeaderToJson(BlogHeader instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
    };
