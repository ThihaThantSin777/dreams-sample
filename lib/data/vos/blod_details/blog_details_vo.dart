import 'package:json_annotation/json_annotation.dart';

part 'blog_details_vo.g.dart';

///Blog Details Attribute အတွက် VO class
@JsonSerializable()
class BlogDetail {
  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'BlogId')
  final int blogId;

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Content')
  final String content;

  BlogDetail({
    required this.id,
    required this.blogId,
    required this.title,
    required this.content,
  });

  factory BlogDetail.fromJson(Map<String, dynamic> json) => _$BlogDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailToJson(this);
}
