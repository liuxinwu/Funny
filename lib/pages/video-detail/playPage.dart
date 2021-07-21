import 'package:flutter/material.dart';
import 'package:funny/components/fHorizontalVideo.dart';
import 'package:funny/components/fPlayer.dart';
import 'package:funny/pages/video-detail/components/videoCollection.dart';
import 'package:funny/components/fNav.dart';

import 'components/playVideoInfo.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key? key, this.routeArgs}) : super(key: key);

  final routeArgs;

  @override
  _PlayPage createState() => _PlayPage(routeArgs: routeArgs);
}

class _PlayPage extends State<PlayPage> {
  _PlayPage({this.routeArgs});

  final routeArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频播放页'),
      ),
      body: Scrollbar(
        controller: ScrollController(initialScrollOffset: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FPlayer(),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlayVideoInfo(),
                    VideoCollection(
                      title: '选集',
                      handleClick: () {
                        print('集数');
                      },
                    ),
                    FNav(title: '与该视频类型'),
                    FHorizontalVideo(
                      list: [1, 2],
                    ),
                    FHorizontalVideo(),
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
