import 'package:dreams_sample/network/response/dreams_response/dreams_response.dart';
import 'package:dreams_sample/persistent/constant.dart';
import 'package:dreams_sample/persistent/dao/dreams_dao.dart';
import 'package:hive/hive.dart';

///Dreams Response ကို သိမ်းထားပေးမယ့် dao concrete class
class DreamsDaoImpl extends DreamsDao {
  DreamsDaoImpl._();

  static final DreamsDaoImpl _singleton = DreamsDaoImpl._();

  factory DreamsDaoImpl() => _singleton;

  @override
  DreamsResponse getDreamsResponseFromDataBase() {
    final data = _getDreamsResponseBox().get(kDreamsResponseSaveKey);
    if (data != null) {
      return data;
    }
    return DreamsResponse(blogDetail: [], blogHeader: []);
  }

  @override
  void saveDreamsResponse(DreamsResponse response) {
    _getDreamsResponseBox().put(kDreamsResponseSaveKey, response);
  }

  Box<DreamsResponse> _getDreamsResponseBox() => Hive.box<DreamsResponse>(kHiveBoxForDreamsResponse);
}
