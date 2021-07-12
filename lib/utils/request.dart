import 'package:dio/dio.dart';
import 'dart:convert';

class Request {
  BaseOptions options = new BaseOptions(
      baseUrl: '', connectTimeout: 1000 * 10, receiveTimeout: 1000 * 10);
  Dio? dio;

  Request(BaseOptions options) {
    this.options = options;
    this.init();
    this.interceptors();
    print('构造函数');
  }

  init() {
    Dio dio = Dio();
    dio.options.baseUrl = options.baseUrl;
    this.dio = dio;
  }

  interceptors() {
    final dio = this.dio;
    if (dio == null) return;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('request before');
      options.headers = {...options.headers, 'funny': 123};
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
  }

  Future<Response<T>> request<T>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) async {
    final dio = this.dio!;

    return await dio.request(path);
    // try {
    //   final res = await dio.request(path);
    //   print('success');
    //   return jsonDecode(res.data)['list'];
    // } catch (err) {
    //   print('error');
    // }
  }
}
