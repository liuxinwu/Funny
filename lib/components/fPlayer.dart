import 'package:fijkplayer/fijkplayer.dart';
import 'package:fijkplayer_skin/fijkplayer_skin.dart';
import 'package:flutter/material.dart';

class FPlayer extends StatefulWidget {
  @override
  _FPlayer createState() => _FPlayer();
}

class _FPlayer extends State<FPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: VideoScreen(),
    );
  }
}

class VideoScreen extends StatefulWidget {
  VideoScreen();

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // FijkPlayer实例
  final FijkPlayer player = FijkPlayer();
  // 当前tab的index，默认0
  int _curTabIdx = 0;
  // 当前选中的tablist index，默认0
  int _curActiveIdx = 0;
  // 视频源列表，请参考当前videoList完整例子
  var videoList = {
    "video": [
      {
        "name": "天空资源",
        "list": [
          {
            "url":
                "https:\/\/vod8.wenshibaowenbei.com\/20210625\/Mt2RR4Gx\/index.m3u8",
            "name": "综艺"
          },
          {
            "url": "https://static.smartisanos.cn/common/video/t1-ui.mp4",
            "name": "锤子1"
          },
          {
            "url": "https://static.smartisanos.cn/common/video/video-jgpro.mp4",
            "name": "锤子2"
          }
        ]
      },
      {
        "name": "天空资源",
        "list": [
          {
            "url": "https://n1.szjal.cn/20210428/lsNZ6QAL/index.m3u8",
            "name": "综艺"
          },
          {
            "url": "https://static.smartisanos.cn/common/video/t1-ui.mp4",
            "name": "锤子1"
          },
          {
            "url": "https://static.smartisanos.cn/common/video/video-jgpro.mp4",
            "name": "锤子2"
          }
        ]
      },
    ]
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // 播放器内部切换视频钩子，回调，tabIdx 和 activeIdx
  void onChangeVideo(int curTabIdx, int curActiveIdx) {
    this.setState(() {
      _curTabIdx = curTabIdx;
      _curActiveIdx = curActiveIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        // 这里 FijkView 开始为自定义 UI 部分
        child: FijkView(
          height: 240,
          color: Colors.black,
          fit: FijkFit.cover,
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
              pageContent: context,
              viewSize: viewSize,
              texturePos: texturePos,
              // 是否显示顶部，如果要显示顶部标题栏 + 返回键，那么就传递 true
              showTopCon: true,
              // 标题 当前页面顶部的标题部分，可以不传，默认空字符串
              playerTitle: "标题",
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
        ));
  }
}
