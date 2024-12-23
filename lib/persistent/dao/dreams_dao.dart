import 'package:dreams_sample/network/response/dreams_response/dreams_response.dart';

///Dreams Response ကို သိမ်းထားပေးမယ့် dao abstract class
abstract class DreamsDao {
  ///Dreams Response တွေကို သိမ်းပေးမယ့် method
  void saveDreamsResponse(DreamsResponse response);

  ///Dreams Response တွေကို ပြန်ထုတ်ပေးမယ့် method
  DreamsResponse getDreamsResponseFromDataBase();
}
