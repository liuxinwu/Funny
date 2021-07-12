import 'package:dio/dio.dart';
import '/utils/request.dart';

Request request =
    new Request(new BaseOptions(baseUrl: 'http://cms.daxjgxx.com'));

final cmsRequest = {
  'list': () {
    return request.request('/api.php/provide/vod');
  }
}


// request.request('/api.php/provide/vod/', queryParameters: {
//           'ac': 'list'
//         });