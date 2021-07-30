// cms 域名下的 API 管理

import '/utils/request.dart';
import './index.dart';

class CmsApi {
  // 分类
  static Future<ResponseData> getClassify(
      {Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/cms-video/classify-list',
        queryParameters: queryParameters);
  }

  // 猜你喜欢
  static Future<ResponseData> getLikes(String ids) {
    return cmsRequest
        .request('/cms-video/like-list', queryParameters: {'ids': ids});
  }

  // 最新
  static Future<ResponseData> getNewList() {
    return cmsRequest.request('/cms-video/new-list');
  }

  // 最热
  static Future<ResponseData> getHotList() {
    return cmsRequest.request('/cms-video/hot-list');
  }

  // 列表
  static Future<ResponseData> getList({Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/cms-video/video-list',
        queryParameters: queryParameters);
  }

  // 列表
  static Future<ResponseData> getDetail(
      {Map<String, dynamic>? queryParameters}) {
    return cmsRequest.request('/cms-video/video-detail',
        queryParameters: queryParameters);
  }
}
