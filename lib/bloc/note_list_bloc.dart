import 'package:dreams_sample/data/model/note_model.dart';
import 'package:dreams_sample/data/model/note_model_impl.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:flutter/foundation.dart';

/// Note List  Page အတွက် BLoC class
class NoteListBloc extends ChangeNotifier {
  ///User save ထားတဲ့ note list တွေကို သိမ်းပေးမယ့် variable
  List<String>? _userNoteList;

  List<String>? get getUserNoteList => _userNoteList;

  ///Database Fetch Status ကို ကြည့်မယ့် variable
  LoadingState _loadingState = LoadingState.kLoading;

  LoadingState get getLoadingState => _loadingState;

  ///Database Fetch ရင်း Error တတ်ခဲ့ရင် သုံးမယ့် variable
  String? _errorMessage;

  String? get getErrorMessage => _errorMessage;

  ///Model
  final NoteModel _noteModel = NoteModelImpl();

  NoteListBloc() {
    _noteModel.getNotes().then((userNoteList) {
      _loadingState = LoadingState.kSuccess;
      _userNoteList = userNoteList;
      notifyListeners();
    }).catchError((error) {
      _loadingState = LoadingState.kError;
      _errorMessage = error.toString();
      notifyListeners();
    });
  }
}
