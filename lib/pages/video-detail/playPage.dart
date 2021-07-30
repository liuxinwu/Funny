import 'package:flutter/material.dart';
import 'package:funny/api/cmsApi.dart';
import 'package:funny/components/fPlayer.dart';

import 'components/playVideoInfo.dart';
import 'components/videoCollection.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key? key, this.routeArgs}) : super(key: key);

  final routeArgs;

  @override
  _PlayPage createState() => _PlayPage(routeArgs: routeArgs);
}

class _PlayPage extends State<PlayPage> {
  _PlayPage({this.routeArgs});

  final routeArgs;
  Map videoDetail = {};
  List videoUrl = [];

  getVideoDetail() async {
    print(routeArgs);
    final res =
        await CmsApi.getDetail(queryParameters: {'ids': routeArgs['videoId']});
    final data = res.data[0] ?? [];

    setState(() {
      videoDetail = data;
      videoUrl = data['vodPlayUrl'] ?? [];
    });
  }

  @override
  void initState() {
    this.getVideoDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(videoUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(videoDetail['vodName'] ?? ''),
      ),
      body: Scrollbar(
        controller: ScrollController(initialScrollOffset: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FPlayer(key: UniqueKey(), data: videoUrl),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlayVideoInfo(
                      data: videoDetail,
                    ),
                    VideoCollection(
                      data: videoDetail['vodPlayUrl'] ?? [],
                      title: '选集',
                      handleClick: () {
                        print('集数');
                      },
                    ),
                    // FNav(title: '与该视频类型'),
                    // FHorizontalVideo(
                    //   list: [1, 2],
                    // ),
                    // FHorizontalVideo(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
