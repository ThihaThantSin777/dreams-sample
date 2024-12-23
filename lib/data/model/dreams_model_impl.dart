import 'package:dreams_sample/data/model/dreams_model.dart';
import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/network/data_agent/dreams_data_agent.dart';
import 'package:dreams_sample/network/data_agent/dreams_data_agent_impl.dart';

///DataAgent က ရလာမယ့် dreams data တွေကို modify လုပ်ဖို့အတွက် concrete class
class DreamsModelImpl extends DreamsModel {
  DreamsModelImpl._();

  static final DreamsModelImpl _singleton = DreamsModelImpl._();

  factory DreamsModelImpl() => _singleton;

  final DreamsDataAgent _dreamsDataAgent = DreamsDataAgentImpl();

  ///Dreams Blog Details တွေကိုပေး မယ့် method
  @override
  Future<List<BlogDetailsVO>> getBlogDetails() async {
    try {
      final result = await _dreamsDataAgent.getBlogDetails();
      return result;
    } catch (error) {
      rethrow;
    }
  }

  ///Dreams Blog Header တွေကိုပေး မယ့် method
  @override
  Future<List<BlogHeaderVO>> getBlogHeaders() async {
    try {
      var result = await _dreamsDataAgent.getBlogHeaders();
      result = result.map((element) {
        element.prefixWord = _getPrefixWord(element.title);
        return element;
      }).toList();
      return result;
    } catch (error) {
      rethrow;
    }
  }

  ///Dreams Blog Header ထဲကနေ မြန်မာ အက္ခရာ တစ်လုံးကို ယူပေးမယ့် method
  String _getPrefixWord(String text) {
    RegExp regex = RegExp(r'\[ (.*?) \]');
    final match = regex.firstMatch(text);
    String extractedValue = match?.group(1) ?? '';
    return extractedValue;
  }
}
