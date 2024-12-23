// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogDetailsVO _$BlogDetailsVOFromJson(Map<String, dynamic> json) => BlogDetailsVO(
      id: (json['Id'] as num).toInt(),
      blogId: (json['BlogId'] as num).toInt(),
      title: json['Title'] as String,
      content: json['Content'] as String,
    );

Map<String, dynamic> _$BlogDetailsVOToJson(BlogDetailsVO instance) => <String, dynamic>{
      'Id': instance.id,
      'BlogId': instance.blogId,
      'Title': instance.title,
      'Content': instance.content,
    };
