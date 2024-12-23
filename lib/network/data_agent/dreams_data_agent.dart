import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';

abstract class DreamsDataAgent {
  Future<BlogHeaderVO> getBlogHeaders();

  Future<BlogDetailsVO> getBlogDetails();
}
