import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';

///DataAgent က ရလာမယ့် dreams data တွေကို modify လုပ်ဖို့အတွက် abstract class
abstract class DreamsModel {
  ///Dreams Blog Header တွေကိုပေး မယ့် method
  Future<List<BlogHeaderVO>> getBlogHeaders();

  ///Dreams Blog Details တွေကိုပေး မယ့် method
  Future<List<BlogDetailsVO>> getBlogDetails();
}
