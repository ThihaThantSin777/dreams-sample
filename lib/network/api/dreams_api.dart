import 'package:dio/dio.dart';
import 'package:dreams_sample/network/api/api_constant.dart';
import 'package:dreams_sample/network/response/base_response.dart';
import 'package:dreams_sample/resources/strings.dart';

///Dreams API တွေ အဓိက fetch မယ့် class
class DreamsAPI {
  DreamsAPI._();

  static final DreamsAPI _singleton = DreamsAPI._();

  factory DreamsAPI() => _singleton;

  final Dio _dio = Dio();

  ///Dreams Data တွေကို အဓိက ယူမယ့် method
  Future<BaseResponse> getDreamsData() async {
    try {
      final response = await _dio.get(kGetDreamsDataEndPoint);
      final data = response.data;
      if (data != null) {
        final baseResponse = BaseResponse.fromJson(data);
        return baseResponse;
      }
      return Future.error(kNullValueReturnText);
    } catch (error) {
      if (error is DioException) {
        return Future.error(_throwException(error));
      }
      return Future.error(error.toString());
    }
  }

  ///API call ခေါ်ရင်းနဲ့ exception တစ်ခုခုရှိလာရင် error type ပေါ်မူတည်ပီး လိုအပ်သလို type cast ပြီး return ပေးမယ့် method
  Object _throwException(DioException error) {
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return kConnectTimeOutErrorText;
    }
    if (error.response?.data is Map<String, dynamic>) {
      ///API က error response ပြန်လာရင် type cast ပြီး return ပေးရပါမယ်။
    }
    return error.response.toString();
  }
}
