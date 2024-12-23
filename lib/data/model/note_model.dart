///Database က ရလာမယ့် user ရဲ့ note တွေကို modify လုပ်ဖို့အတွက် abstract model class
abstract class NoteModel {
  ///User Notes တွေကိုပေး မယ့် method
  Future<List<String>> getNotes();

  ///User Notes တွေကို save ပေး မယ့် method
  void saveNote(String note);
}
