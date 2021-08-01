import 'package:fijkplayer/fijkplayer.dart';
import 'package:fijkplayer_skin/fijkplayer_skin.dart';
import 'package:flutter/material.dart';
import 'package:funny/utils/evnet.dart';

class FPlayer extends StatefulWidget {
  FPlayer({Key? key, required this.data}) : super(key: key);

  final List data;

  @override
  _FPlayerState createState() => _FPlayerState(
        data: data,
      );
}

class _FPlayerState extends State<FPlayer> {
  _FPlayerState({
    required this.data,
  });

  final List data;

  // FijkPlayer实例
  FijkPlayer player = FijkPlayer();
  // 当前tab的index，默认0
  int _curTabIdx = 0;
  int _curActiveIdx = 0;
  // 视频源列表，请参考当前videoList完整例子
  Map<String, List<Map<String, dynamic>>> videoList = {
    "video": [
      {"name": "资源列表", "list": []},
    ]
  };

  void playConllection(int curActiveIdx) {
    // 这里有个小问题标题没有更新
    _curActiveIdx = curActiveIdx;
    (() async {
      await player.stop();
      await player.reset();
      player.setDataSource(
        data[_curActiveIdx]['url'],
        autoPlay: true,
      );
    })();
  }

  @override
  void initState() {
    videoList['video']![0]['list'] = data;
    eventCenter['on'](playConllection);
    super.initState();
  }

  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  // 播放器内部切换视频钩子，回调，tabIdx 和 activeIdx
  void onChangeVideo(int curTabIdx, int curActiveIdx) {
    setState(() {
      _curActiveIdx = curActiveIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * 9 / 16;
    final Color primaryColor = Theme.of(context).primaryColor;

    if (data == null || data.length == 0)
      return Container(
        height: height,
        color: primaryColor,
      );
    final String title = data[_curActiveIdx]['name'] ?? '';

    return
        // 这里 FijkView 开始为自定义 UI 部分
        FijkView(
      height: height,
      color: primaryColor,
      fit: FijkFit.ar16_9,
      player: player,
      panelBuilder: (
        FijkPlayer player,
        FijkData data,
        BuildContext context,
        Size viewSize,
        Rect texturePos,
      ) {
        /// 使用自定义的布局
        return CustomFijkPanel(
          player: player,
          // 传递 context 用于左上角返回箭头关闭当前页面，不要传递错误 context，
          // 如果要点击箭头关闭当前的页面，那必须传递当前组件的根 context
          // pageContent: context,
          viewSize: viewSize,
          texturePos: texturePos,
          // 是否显示顶部，如果要显示顶部标题栏 + 返回键，那么就传递 true
          showTopCon: false,
          // 标题 当前页面顶部的标题部分，可以不传，默认空字符串
          playerTitle: title,
          // 当前视频改变钩子
          onChangeVideo: onChangeVideo,
          // 视频源列表
          videoList: videoList,
          // 当前视频源tabIndex
          curTabIdx: _curTabIdx,
          // 当前视频源activeIndex
          curActiveIdx: _curActiveIdx,
        );
      },
    );
  }
}
