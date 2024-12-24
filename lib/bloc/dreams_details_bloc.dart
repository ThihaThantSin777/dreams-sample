import 'package:dreams_sample/data/model/dreams_model.dart';
import 'package:dreams_sample/data/model/dreams_model_impl.dart';
import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:flutter/foundation.dart';

///Dreams Details Page အတွက် BLoC class
class DreamsDetailsBloc extends ChangeNotifier {
  ///API Status ကို ကြည့်မယ့် variable
  LoadingState _loadingState = LoadingState.kLoading;

  LoadingState get getLoadingState => _loadingState;

  ///API Fetch ရင်း Error တတ်ခဲ့ရင် သုံးမယ့် variable
  String? _errorMessage;

  String? get getErrorMessage => _errorMessage;

  ///User ရွေးလိုက်တဲ့ Blog ID ပေါ်မူတည်ပီး Blog Details တွေကို model layer ကနေ ယူပီး သိမ်းပေးမယ့် variable
  List<BlogDetailsVO>? _blogDetailsList;

  ///User ရှာလိုက်တဲ့ bloc details data တွေကို သိမ်းပေးမယ့် variable
  List<BlogDetailsVO>? _searchBlogDetailsList;

  List<BlogDetailsVO>? get getSearchBlogDetailsList => _searchBlogDetailsList;

  ///Model
  final DreamsModel _dreamsModel = DreamsModelImpl();

  DreamsDetailsBloc({required int blogID}) {
    _dreamsModel.getBlogDetails().then((blocDetailsList) {
      _loadingState = LoadingState.kSuccess;
      final getBlogDetailsByBlogID = blocDetailsList.where((element) => element.blogId == blogID).toList();
      _blogDetailsList = getBlogDetailsByBlogID;
      _searchBlogDetailsList = _blogDetailsList;
      notifyListeners();
    }).catchError((error) {
      _loadingState = LoadingState.kError;
      _errorMessage = error.toString();
      notifyListeners();
    });
  }

  ///User က Blog Details တွေကို ရှာလိုက်ရင် trigger မယ့် method
  void onSearchWithKeyWord(String keyword) {
    if (keyword.isEmpty) {
      _searchBlogDetailsList = _blogDetailsList;
    } else {
      _searchBlogDetailsList = _blogDetailsList?.where((element) => element.blogContent.contains(keyword)).toList();
    }
    notifyListeners();
  }
}
