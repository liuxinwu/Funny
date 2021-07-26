import 'package:flutter/material.dart';
import 'package:funny/api/cmsApi.dart';
import 'package:funny/components/fHorizontalVideo.dart';
import 'package:funny/components/fNav.dart';
import 'package:funny/components/fSwiper.dart';

import './components/classify.dart';
import './components/classifyBlock.dart';
import './components/head.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List classifyList = [];
  List linksList = [];
  List<Map<String, dynamic>> homeList = [
    {'title': '最新', 'list': []},
    {'title': '热播电视剧', 'list': []},
    {'title': '热播电影', 'list': []},
  ];

  getClassify() async {
    final res = await CmsApi.getClassify();
    setState(() {
      classifyList = res.data;
      classifyList.length = 8;
    });
  }

  getLikes() async {
    final res = await CmsApi.getLikes('');
    setState(() {
      linksList = res.data;
    });
  }

  getNew() async {
    final res = await CmsApi.getList();
    setState(() {
      homeList[0]['list'] = res.data;
    });
  }

  getTvPlay() async {
    final res = await CmsApi.getList(queryParameters: {'pg': 6});
    setState(() {
      homeList[1]['list'] = res.data;
    });
  }

  getMove() async {
    final res = await CmsApi.getList(queryParameters: {'pg': 3});
    setState(() {
      homeList[2]['list'] = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getClassify();
    this.getLikes();
    this.getNew();
    this.getTvPlay();
    this.getMove();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Head(),
            Classify(
              key: UniqueKey(),
              classifyList: classifyList,
            )
          ],
        ),
        new Expanded(
          child: ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              print(index);
              if (index >= 1) {
                return Container(
                  child: Text('无更多'),
                );
              }
              return Wrap(
                children: [
                  // swiper 不加高度报错
                  Container(
                    height: MediaQuery.of(context).size.width * .6,
                    child: FSwiper(),
                  ),
                  FNav(
                    title: '猜你喜欢',
                    left: 16,
                    right: 16,
                  ),
                  FHorizontalVideo(
                    list: linksList,
                  ),
                  ...(homeList
                      .map((e) =>
                          ClassifyBlock(title: e['title'], list: e['list']))
                      .toList())
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
