import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:funny/components/FToast.dart';

// TODO
// 重复请求未处理

const _customConfig = const CustomConfig(true, true, true);

class Request {
  BaseOptions options = new BaseOptions(
      baseUrl: '', connectTimeout: 1000 * 10, receiveTimeout: 1000 * 10);
  Dio? dio;
  CustomConfig customConfig;

  Request(BaseOptions options, {this.customConfig = _customConfig}) {
    this.options = options;
    this.init();
    this.interceptors();
  }

  init() {
    Dio dio = Dio();
    dio.options.baseUrl = options.baseUrl;
    dio.options.connectTimeout = options.connectTimeout;
    dio.options.receiveTimeout = options.receiveTimeout;
    this.dio = dio;
  }

  interceptors() {
    final dio = this.dio!;

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('request before');
      this.handleToken(options);
      this.handleLoading(true);
      return handler.next(options);
    }, onResponse: (response, handler) {
      this.handleLoading(false);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      this.handleLoading(false);
      return handler.next(e);
    }));
  }

  void handleToken(RequestOptions options) {
    final isNeedToken = this.customConfig.isNeedToken;

    if (isNeedToken) {
      options.headers = {...options.headers, 'funny_token': 123};
    }
  }

  void handleLoading(isItOpen) {
    if (!this.customConfig.isNeedLoading) return;

    isItOpen ? print('开启loading') : print('关闭loading');
  }

  Future<ResponseData> request(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) async {
    final dio = this.dio!;

    try {
      final res = await dio.request(path,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      final data = jsonDecode(res.data);
      return ResponseData(res.statusCode ?? 200, 0, data, 'success');
    } catch (err) {
      // 可以进行更详细的错误处理
      FToast.showToast(msg: '太火爆了，请稍后再试！');
      // 延迟
      // Future.delayed(const Duration(milliseconds: 1000), () {
      //   FToast.hiddenToast();
      // });
      throw ResponseData(500, 0, {}, 'error');
      // return ResponseData(500, 0, {}, 'error');
    }
  }
}

// 响应数据类型
class ResponseData {
  int status;
  int code;
  Map<String, dynamic> data;
  String msg;

  ResponseData(this.status, this.code, this.data, this.msg);
}

// 自定义配置项
class CustomConfig {
  final bool isNeedToken;
  final bool isNeedLoading;
  final bool isNeedHandleError;

  // 常量构造函数
  // https://blog.csdn.net/mqdxiaoxiao/article/details/102599856
  const CustomConfig(
      this.isNeedToken, this.isNeedLoading, this.isNeedHandleError);
}
