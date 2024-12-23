import 'package:dreams_sample/persistent/dao/note_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

///User ရဲ့ note တွေကို သိမ်းပေးမယ့် dao concrete class
class NoteDaoImpl extends NoteDao {
  NoteDaoImpl._();

  static final NoteDaoImpl _singleton = NoteDaoImpl._();

  factory NoteDaoImpl() => _singleton;

  ///User ရဲ့ note တွေကို List<String> အနေနဲ့ ပြန်ထုတ်ပေးမယ့် method
  @override
  Future<List<String>> getNotesFromDataBase() async {
    final prefers = await SharedPreferences.getInstance();
    final keys = prefers.getKeys();
    List<String> result = [];

    for (var key in keys) {
      final data = prefers.getString(key);
      if (data != null && data.isNotEmpty) {
        result.add(data);
      }
    }
    return result;
  }

  ///User ရဲ့ note တွေကို သိမ်းပေးမယ့် method
  @override
  Future saveNote(String note) async {
    final prefers = await SharedPreferences.getInstance();
    prefers.setString(DateTime.now().millisecondsSinceEpoch.toString(), note);
  }
}
