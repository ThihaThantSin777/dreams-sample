import 'package:json_annotation/json_annotation.dart';

part 'blog_header_vo.g.dart';

///Blog Header attribute အတွက် VO class
@JsonSerializable()
class BlogHeaderVO {
  @JsonKey(name: 'BlogId')
  final int id;

  @JsonKey(name: 'BlogTitle')
  final String title;

  String? prefixWord;

  BlogHeaderVO({
    required this.id,
    required this.title,
    this.prefixWord,

  });

  factory BlogHeaderVO.fromJson(Map<String, dynamic> json) => _$BlogHeaderVOFromJson(json);

  Map<String, dynamic> toJson() => _$BlogHeaderVOToJson(this);
}
