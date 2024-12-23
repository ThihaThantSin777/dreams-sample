///User ရဲ့ note တွေကို သိမ်းပေးမယ့် dao abstract class
abstract class NoteDao {
  ///User ရဲ့ note တွေကို သိမ်းပေးမယ့် method
  Future saveNote(String note);

  ///User ရဲ့ note တွေကို List<String> အနေနဲ့ ပြန်ထုတ်ပေးမယ့် method
  Future<List<String>> getNotesFromDataBase();
}
