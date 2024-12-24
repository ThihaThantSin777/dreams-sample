import 'package:dreams_sample/data/model/dreams_model.dart';
import 'package:dreams_sample/data/model/dreams_model_impl.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:flutter/foundation.dart';

class DreamsListBloc extends ChangeNotifier {
  ///Dreams Blog Header List တွေကို သိမ်းပေးမယ့် variable
  List<BlogHeaderVO>? _blogHeaderList;

  List<BlogHeaderVO>? get getBlogHeaderList => _blogHeaderList;

  ///API Status ကို ကြည့်မယ့် variable
  LoadingState _loadingState = LoadingState.kLoading;

  LoadingState get getLoadingState => _loadingState;

  ///API Fetch ရင်း Error တတ်ခဲ့ရင် သုံးမယ့် variable
  String? _errorMessage;

  String? get getErrorMessage => _errorMessage;

  ///Model
  final DreamsModel _dreamsModel = DreamsModelImpl();

  DreamsListBloc() {
    _dreamsModel.getBlogHeaders().then((blogHeaderList) {
      _loadingState = LoadingState.kSuccess;
      _blogHeaderList = blogHeaderList;
      notifyListeners();
    }).catchError((error) {
      _loadingState = LoadingState.kError;
      _errorMessage = error.toString();
      notifyListeners();
    });
  }
}
