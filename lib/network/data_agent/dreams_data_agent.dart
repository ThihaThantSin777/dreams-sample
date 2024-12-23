import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';

///Dreams API က ရလာတဲ့ data တွေကို filter ပေးမယ့် data agent abstract class
abstract class DreamsDataAgent {
  ///Dreams Blog Header တွေကိုပဲ filter မယ့် method
  Future<BlogHeaderVO> getBlogHeaders();

  ///Dreams Blog Details တွေကိုပဲ filter မယ့် method
  Future<BlogDetailsVO> getBlogDetails();
}
