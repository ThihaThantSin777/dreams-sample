import 'package:dreams_sample/data/model/dreams_model.dart';
import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/network/data_agent/dreams_data_agent.dart';
import 'package:dreams_sample/network/data_agent/dreams_data_agent_impl.dart';
import 'package:dreams_sample/persistent/dao/dreams_dao.dart';
import 'package:dreams_sample/persistent/dao/dreams_dao_impl.dart';

///DataAgent က ရလာမယ့် dreams data တွေကို modify လုပ်ဖို့အတွက် concrete class
class DreamsModelImpl extends DreamsModel {
  DreamsModelImpl._();

  static final DreamsModelImpl _singleton = DreamsModelImpl._();

  factory DreamsModelImpl() => _singleton;

  final DreamsDataAgent _dreamsDataAgent = DreamsDataAgentImpl();
  final DreamsDao _dreamsDao = DreamsDaoImpl();

  ///Dreams Blog Details တွေကိုပေး မယ့် method
  @override
  Future<List<BlogDetailsVO>> getBlogDetails() async {
    try {
      ///DataBase ထဲမှာ Dreams Response ထဲက Blog Details တွေရှိမရှိစစ်မယ်။
      ///ရှိတယ်ဆို Database ထဲမှာရှိနေတဲ့ Blog Details data ကိုပဲ ပြန်ပေးလိုက်မယ်။
      final dataFromDataBase = _dreamsDao.getDreamsResponseFromDataBase();
      if (dataFromDataBase.blogDetail.isNotEmpty) {
        return dataFromDataBase.blogDetail;
      }

      ///Database ထဲမှာ Blog Details data မရှိတဲ့အတွက် Blog Details API ခေါ်မယ်။
      ///API က ရလာတဲ့ data ကိုမှာ သိမ်းလိုက်မယ်။
      final result = await _dreamsDataAgent.getBlogDetails();
      dataFromDataBase.blogDetail = result;
      _dreamsDao.saveDreamsResponse(dataFromDataBase);

      return result;
    } catch (error) {
      rethrow;
    }
  }

  ///Dreams Blog Header တွေကိုပေး မယ့် method
  @override
  Future<List<BlogHeaderVO>> getBlogHeaders() async {
    try {
      ///DataBase ထဲမှာ Dreams Response ထဲက Blog Header တွေရှိမရှိစစ်မယ်။
      ///ရှိတယ်ဆို Database ထဲမှာရှိနေတဲ့ Blog Header data ကိုပဲ ပြန်ပေးလိုက်မယ်။
      final dataFromDataBase = _dreamsDao.getDreamsResponseFromDataBase();
      if (dataFromDataBase.blogHeader.isNotEmpty) {
        var result = dataFromDataBase.blogHeader;

        ///title ထဲက prefix စာလုံးတွေကို သပ်သပ်ဆွဲယူပြီး prefixWord attribute ထဲ ထည့်မယ်။
        result = result.map((element) {
          element.prefixWord = _getPrefixWord(element.title);
          return element;
        }).toList();
        return result;
      }

      ///Database ထဲမှာ Blog Header data မရှိတဲ့အတွက် Blog Header API ခေါ်မယ်။
      ///API က ရလာတဲ့ data ကိုမှာ သိမ်းလိုက်မယ်။
      var result = await _dreamsDataAgent.getBlogHeaders();

      ///title ထဲက prefix စာလုံးတွေကို သပ်သပ်ဆွဲယူပြီး prefixWord attribute ထဲ ထည့်မယ်။
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
