import 'package:dreams_sample/persistent/constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_details_vo.g.dart';

///Blog Details Attribute အတွက် VO class
@JsonSerializable()
@HiveType(typeId: kHiveKeyForDreamsBlogDetails)
class BlogDetailsVO {
  @JsonKey(name: 'BlogDetailId')
  @HiveField(0)
  final int blogDetailId;

  @JsonKey(name: 'BlogId')
  @HiveField(1)
  final int blogId;

  @JsonKey(name: 'BlogContent')
  @HiveField(2)
  final String blogContent;

  BlogDetailsVO({
    required this.blogDetailId,
    required this.blogId,
    required this.blogContent,
  });

  factory BlogDetailsVO.fromJson(Map<String, dynamic> json) => _$BlogDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailsVOToJson(this);
}
