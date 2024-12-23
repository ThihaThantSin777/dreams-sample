import 'package:dio/dio.dart';
import 'package:dreams_sample/network/api/api_constant.dart';
import 'package:dreams_sample/network/response/base_response.dart';

///
class DreamsAPI {
  DreamsAPI._();

  static final DreamsAPI _singleton = DreamsAPI._();

  factory DreamsAPI() => _singleton;

  final Dio _dio = Dio();

  Future<BaseResponse> getDreamsData() async {
    try {
      final response = await _dio.get(kGetDreamsDataEndPoint);
      final data = response.data;
      if (data != null) {
        final baseResponse = BaseResponse.fromJson(data);
        return baseResponse;
      }
      return Future.error('Fetching API got null value');
    } catch (error) {
      if (error is DioException) {
        return Future.error(_throwException(error));
      }
      return Future.error(error.toString());
    }
  }

  Object _throwException(DioException error) {
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return "Unable to connect to the server. Please check your internet connection and try again.";
    }
    if (error.response?.data is Map<String, dynamic>) {
      ///API က error response ပြန်လာရင် type cast ပြီး return ပေးရပါမယ်။
    }
    return error.response.toString();
  }
}
