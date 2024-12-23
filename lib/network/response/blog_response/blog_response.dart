import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_response.g.dart';

@JsonSerializable()
class BlogResponse {
  @JsonKey(name: 'BlogHeader')
  final BlogHeader blogHeader;

  @JsonKey(name: 'BlogDetails')
  final BlogDetail blogDetail;

  BlogResponse({required this.blogHeader, required this.blogDetail});

  factory BlogResponse.fromJson(Map<String, dynamic> json) => _$BlogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);
}
