/**
 * 不同域名下的请求实例
 */

import 'package:dio/dio.dart';

import '/utils/request.dart';

// cms dio 实例
Request cmsRequest =
    new Request(new BaseOptions(baseUrl: 'http://192.168.104.115:3000'));
