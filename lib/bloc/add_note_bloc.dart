import 'package:dreams_sample/data/model/note_model.dart';
import 'package:dreams_sample/data/model/note_model_impl.dart';
import 'package:flutter/foundation.dart';

///Add Note Page အတွက် BLoC class
class AddNoteBloc extends ChangeNotifier {
  ///User ရိုက်ထည့်တဲ့ note တွေကို သိမ်းပေးမယ့် variable
  String? _userNote;

  ///Model
  final NoteModel _noteModel = NoteModelImpl();

  void setUserNote(String userNote) {
    _userNote = userNote;
  }

  ///User က Note ရေးပြီး add လိုက်ရင် trigger မယ့် method
  void onTapAdd() {
    _noteModel.saveNote(_userNote ?? '');
  }
}
