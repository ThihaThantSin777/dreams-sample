import 'package:json_annotation/json_annotation.dart';

part 'blog_details_vo.g.dart';

///Blog Details Attribute အတွက် VO class
@JsonSerializable()
class BlogDetailsVO {
  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'BlogId')
  final int blogId;

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Content')
  final String content;

  BlogDetailsVO({
    required this.id,
    required this.blogId,
    required this.title,
    required this.content,
  });

  factory BlogDetailsVO.fromJson(Map<String, dynamic> json) => _$BlogDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailsVOToJson(this);
}
