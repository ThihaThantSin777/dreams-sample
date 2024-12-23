import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/network/api/dreams_api.dart';
import 'package:dreams_sample/network/data_agent/dreams_data_agent.dart';
import 'package:dreams_sample/network/response/dreams_response/dreams_response.dart';

///Dreams API က ရလာတဲ့ data တွေကို filter ပေးမယ့် data agent concrete class
class DreamsDataAgentImpl extends DreamsDataAgent {
  DreamsDataAgentImpl._();

  static final DreamsDataAgentImpl _singleton = DreamsDataAgentImpl._();

  factory DreamsDataAgentImpl() => _singleton;

  final DreamsAPI _dreamsAPI = DreamsAPI();

  ///Dreams Blog Details တွေကိုပဲ filter မယ့် method
  @override
  Future<List<BlogDetailsVO>> getBlogDetails() async {
    try {
      final result = await _dreamsAPI.getDreamsData();
      if (result.status) {
        final dreamsResponse = DreamsResponse.fromJson(result.data as Map<String, dynamic>);
        return dreamsResponse.blogDetail;
      }
      return Future.error(result.message);
    } catch (error) {
      rethrow;
    }
  }

  ///Dreams Blog Header တွေကိုပဲ filter မယ့် method
  @override
  Future<List<BlogHeaderVO>> getBlogHeaders() async {
    try {
      final result = await _dreamsAPI.getDreamsData();
      if (result.status) {
        final dreamsResponse = DreamsResponse.fromJson(result.data as Map<String, dynamic>);
        return dreamsResponse.blogHeader;
      }
      return Future.error(result.message);
    } catch (error) {
      rethrow;
    }
  }
}
