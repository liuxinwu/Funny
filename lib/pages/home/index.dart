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
  int currentClassify = 0;
  List<Map<String, dynamic>> homeList = [
    {'title': '最新资源', 'list': []},
    {'title': '最热资源', 'list': []},
    {'title': '热播电视剧', 'list': []},
    {'title': '热播电影', 'list': []},
  ];

  setCurrentClassify(_currentClassify) {
    print(_currentClassify);
    setState(() {
      currentClassify = _currentClassify;
    });
  }

  List<Widget> getListWidget() {
    switch (currentClassify) {
      case 0:
        return [
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
              .map((e) => ClassifyBlock(title: e['title'], list: e['list']))
              .toList())
        ];
      default:
        return [Text('$currentClassify')];
    }
    return [];
  }

  getClassify() async {
    final res = await CmsApi.getClassify(queryParameters: {'pid': 0});
    setState(() {
      (res.data ?? []).insertAll(0, [
        {'type_id': 0, 'type_name': '精选'}
      ]);
      classifyList = res.data;
    });
  }

  getLikes() async {
    final res = await CmsApi.getLikes('2');
    print(res);
    setState(() {
      linksList = res.data;
    });
  }

  getNew() async {
    final res = await CmsApi.getNewList();
    setState(() {
      homeList[0]['list'] = res.data;
    });
  }

  getTvPlay() async {
    final res = await CmsApi.getList(queryParameters: {'parentIds': 12});
    setState(() {
      homeList[2]['list'] = res.data;
    });
  }

  getMove() async {
    final res = await CmsApi.getList(queryParameters: {'parentIds': 1});
    setState(() {
      homeList[3]['list'] = res.data;
    });
  }

  getHot() async {
    final res = await CmsApi.getHotList();
    setState(() {
      homeList[1]['list'] = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getClassify();
    this.getLikes();
    this.getNew();
    this.getHot();
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
                key: Key(classifyList.toString()),
                currentClassify: currentClassify,
                classifyList: classifyList,
                setCurrentClassify: setCurrentClassify)
          ],
        ),
        new Expanded(
          child: ListView.builder(
            itemCount: 2,
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              print(index);
              if (index >= 1) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text('已经到底了'),
                  ),
                );
              }
              return Wrap(
                children: getListWidget(),
              );
            },
          ),
        )
      ],
    );
  }
}
