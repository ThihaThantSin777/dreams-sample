import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dreams_response.g.dart';

///Dreams API မှ ရလာမယ့် response အတွက် class
@JsonSerializable()
class DreamsResponse {
  @JsonKey(name: 'BlogHeader')
  final List<BlogHeaderVO> blogHeader;

  @JsonKey(name: 'BlogDetails')
  final List<BlogDetailsVO> blogDetail;

  DreamsResponse({required this.blogHeader, required this.blogDetail});

  factory DreamsResponse.fromJson(Map<String, dynamic> json) => _$DreamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DreamsResponseToJson(this);
}
