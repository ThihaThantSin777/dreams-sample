import 'package:json_annotation/json_annotation.dart';

part 'blog_header_vo.g.dart';

///Blog Header attribute အတွက် VO class
@JsonSerializable()
class BlogHeader {
  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'Title')
  final String title;

  BlogHeader({required this.id, required this.title});

  factory BlogHeader.fromJson(Map<String, dynamic> json) => _$BlogHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$BlogHeaderToJson(this);
}
