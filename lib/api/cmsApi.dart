/**
 * cms 域名下的 API 管理
 */
import '/utils/request.dart';
import './index.dart';

class CmsApi {
  // 分类
  static Future<ResponseData> getClassify(
      {Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/video/classify',
        queryParameters: queryParameters);
  }

  // 猜你喜欢
  static Future<ResponseData> getLikes(String ids) {
    return cmsRequest.request('/video/like', queryParameters: {'ids': ids});
  }

  // 列表
  static Future<ResponseData> getList({Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/video/list', queryParameters: queryParameters);
  }

  // 列表
  static Future<ResponseData> getDetail(
      {Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/video/detail',
        queryParameters: queryParameters);
  }
}
