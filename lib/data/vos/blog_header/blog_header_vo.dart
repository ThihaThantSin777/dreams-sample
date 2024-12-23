import 'package:dreams_sample/persistent/constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_header_vo.g.dart';

///Blog Header attribute အတွက် VO class
@JsonSerializable()
@HiveType(typeId: kHiveKeyForDreamsBlogHeader)
class BlogHeaderVO {
  @JsonKey(name: 'BlogId')
  @HiveField(0)
  final int id;

  @JsonKey(name: 'BlogTitle')
  @HiveField(1)
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
