import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/persistent/constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dreams_response.g.dart';

///Dreams API မှ ရလာမယ့် response အတွက် class
@JsonSerializable()
@HiveType(typeId: kHiveKeyForDreamsResponse)
class DreamsResponse {
  @JsonKey(name: 'BlogHeader')
  @HiveField(0)
  List<BlogHeaderVO> blogHeader;

  @JsonKey(name: 'BlogDetail')
  @HiveField(1)
  List<BlogDetailsVO> blogDetail;

  DreamsResponse({required this.blogHeader, required this.blogDetail});

  factory DreamsResponse.fromJson(Map<String, dynamic> json) => _$DreamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DreamsResponseToJson(this);
}
