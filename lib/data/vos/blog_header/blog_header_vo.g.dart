// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_header_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogHeaderVO _$BlogHeaderVOFromJson(Map<String, dynamic> json) => BlogHeaderVO(
      id: (json['BlogId'] as num).toInt(),
      title: json['BlogTitle'] as String,
    );

Map<String, dynamic> _$BlogHeaderVOToJson(BlogHeaderVO instance) => <String, dynamic>{
      'BlogId': instance.id,
      'BlogTitle': instance.title,
    };
