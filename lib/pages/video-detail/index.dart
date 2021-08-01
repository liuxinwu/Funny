import 'package:flutter/material.dart';
import 'package:funny/api/cmsApi.dart';
import 'package:funny/components/fHorizontalVideo.dart';
import 'package:funny/components/fNav.dart';
import 'package:funny/components/fPlayer.dart';
import 'package:funny/utils/evnet.dart';

import 'components/playVideoInfo.dart';
import 'components/videoCollection.dart';
import 'components/videoComment.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key? key, this.routeArgs}) : super(key: key);

  final routeArgs;

  @override
  _PlayPage createState() => _PlayPage(routeArgs: routeArgs);
}

class _PlayPage extends State<PlayPage> {
  _PlayPage({this.routeArgs});

  final routeArgs;
  Map videoInfo = {};
  // 推荐列表
  List recommendList = [];
  // 热播视频
  List hotList = [];

  getVideoInfo() async {
    print(routeArgs);
    final res =
        await CmsApi.getDetail(queryParameters: {'ids': routeArgs['videoId']});
    final data = res.data[0] ?? [];

    setState(() {
      videoInfo = data;
    });
  }

  getRecommendList() async {
    final res =
        await CmsApi.getList(queryParameters: {'ids': videoInfo['typeId']});
    setState(() {
      recommendList = res.data;
    });
  }

  getHotList() async {
    final res = await CmsApi.getHotList();
    setState(() {
      hotList = res.data;
    });
  }

  @override
  void initState() {
    (() async {
      await this.getVideoInfo();
      Future.delayed(Duration(milliseconds: 500), () {
        this.getRecommendList();
        this.getHotList();
      });
    })();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoInfo['vodName'] ?? ''),
      ),
      body: Column(
        children: [
          FPlayer(
            key: Key(videoInfo['vodPlayUrl'].toString()),
            data: videoInfo['vodPlayUrl'] ?? [],
          ),
          Expanded(
              child: Scrollbar(
            controller: ScrollController(initialScrollOffset: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 视频信息
                        PlayVideoInfo(
                          data: videoInfo,
                        ),
                        // 选集
                        VideoCollection(
                          key: Key(videoInfo['vodPlayUrl'].toString()),
                          data: videoInfo['vodPlayUrl'] ?? [],
                          title: '剧集与更新',
                          handleClick: (int index) {
                            print('集数$index');
                            eventCenter['emit'](index);
                          },
                        ),
                        FNav(title: '相似视频'),
                        FHorizontalVideo(
                          list: recommendList,
                          jumpMethod: (arguments) => {
                            Navigator.pushReplacementNamed(
                                context, 'videoPlayPage',
                                arguments: arguments)
                          },
                        ),
                        FNav(title: '热播剧'),
                        FHorizontalVideo(
                          list: hotList,
                          jumpMethod: (arguments) => {
                            Navigator.pushReplacementNamed(
                                context, 'videoPlayPage',
                                arguments: arguments)
                          },
                        ),
                        // 评论
                        VideoComment()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
