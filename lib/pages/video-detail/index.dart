import 'package:flutter/material.dart';
import 'package:funny/pages/video-detail/components/videoCollection.dart';
import 'package:funny/pages/video-detail/components/videoComment.dart';
import 'package:funny/pages/video-detail/components/videoDesc.dart';
import 'package:funny/pages/video-detail/components/videoInfo.dart';

class VideoDetail extends StatefulWidget {
  VideoDetail({Key? key, this.routeArgs}) : super(key: key);

  final routeArgs;

  @override
  _VideoDetailState createState() => _VideoDetailState(routeArgs: routeArgs);
}

class _VideoDetailState extends State {
  _VideoDetailState({this.routeArgs}) : super();

  final routeArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频详情'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Scrollbar(
            controller: ScrollController(initialScrollOffset: 0),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoInfo(),
                VideoCollection(
                  handleClick: () {
                    Navigator.pushNamed(context, 'videoPlayPage');
                  },
                ),
                VideoDesc(),
                VideoComment()
              ],
            ))),
      ),
    );
  }
}
