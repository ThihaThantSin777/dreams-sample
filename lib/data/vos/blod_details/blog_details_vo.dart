import 'package:json_annotation/json_annotation.dart';

part 'blog_details_vo.g.dart';

///Blog Details Attribute အတွက် VO class
@JsonSerializable()
class BlogDetailsVO {
  @JsonKey(name: 'BlogDetailId')
  final int blogDetailId;

  @JsonKey(name: 'BlogId')
  final int blogId;

  @JsonKey(name: 'BlogContent')
  final String blogContent;

  BlogDetailsVO({
    required this.blogDetailId,
    required this.blogId,
    required this.blogContent,
  });

  factory BlogDetailsVO.fromJson(Map<String, dynamic> json) => _$BlogDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailsVOToJson(this);
}
