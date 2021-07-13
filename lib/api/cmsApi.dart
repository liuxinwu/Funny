import '/utils/request.dart';
import './index.dart';

class CmsApi {
  static Future<ResponseData> getList({Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/api.php/provide/vod', queryParameters: queryParameters);
  }
}