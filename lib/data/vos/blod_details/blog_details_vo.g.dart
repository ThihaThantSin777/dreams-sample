// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_details_vo.dart';

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
