import 'package:flutter/cupertino.dart';

// 在配置 confront 的时候，如果没有显示图标并且没有报错的话
// 重启一下就好了

IconData generateIcon(int codePoint) {
  return IconData(codePoint, fontFamily: 'FunnyIcon', matchTextDirection: true);
}

class FIcons {
  // 记录
  static final IconData recording = generateIcon(0xe61b);

  // 下载
  static final IconData download = generateIcon(0xe60f);

  // 首页
  static final IconData home = generateIcon(0xe61f);

  // 我的
  static final IconData my = generateIcon(0xe60c);

  // 更多
  static final IconData more = generateIcon(0xe643);

  // 大于
  static final IconData gt = generateIcon(0xe631);

  // 分享
  static final IconData share = generateIcon(0xe619);

  // 收藏
  static final IconData collection = generateIcon(0xe687);

  // 点赞
  static final IconData likes = generateIcon(0xe612);
}
