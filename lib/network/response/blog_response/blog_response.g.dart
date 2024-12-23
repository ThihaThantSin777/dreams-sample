// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) => BlogResponse(
      blogHeader:
          BlogHeader.fromJson(json['BlogHeader'] as Map<String, dynamic>),
      blogDetail:
          BlogDetail.fromJson(json['BlogDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'BlogHeader': instance.blogHeader,
      'BlogDetails': instance.blogDetail,
    };
