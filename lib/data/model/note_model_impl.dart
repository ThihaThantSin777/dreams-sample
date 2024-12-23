import 'package:dreams_sample/data/model/note_model.dart';
import 'package:dreams_sample/persistent/dao/note_dao.dart';
import 'package:dreams_sample/persistent/dao/note_dao_impl.dart';

///Database က ရလာမယ့် user ရဲ့ note တွေကို modify လုပ်ဖို့အတွက် concrete class
class NoteModelImpl extends NoteModel {
  NoteModelImpl._();

  static final NoteModelImpl _singleton = NoteModelImpl._();

  factory NoteModelImpl() => _singleton;

  final NoteDao _noteDao = NoteDaoImpl();

  ///User Notes တွေကိုပေး မယ့် method
  @override
  Future<List<String>> getNotes() => _noteDao.getNotesFromDataBase();

  ///User Notes တွေကို save ပေး မယ့် method
  @override
  void saveNote(String note) => _noteDao.saveNote(note);
}
