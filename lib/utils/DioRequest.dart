import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';

class DioRequest {
  final Dio dio = Dio();
  DioRequest() {
    dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);

    addInterceptors();
  }

  void addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return handler.next(response);
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return handleResponse(dio.get(url, queryParameters: params));
  }

  Future<dynamic> handleResponse(Future<Response<dynamic>> task) async {
    try {
      final response = await task;
      final data = response.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["result"];
      }

      throw Exception(data["msg"]);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

final dioRequest = DioRequest();
