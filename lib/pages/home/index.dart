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
  // 分类列表
  List classifyList = [];
  // 当前分类
  Map currentClassify = {'typeId': 0, 'typeName': '精选'};
  // 猜你喜欢
  List linksList = [];
  // 滚动控制器
  ScrollController _controller = new ScrollController();
  // 精选页
  List<Map<String, dynamic>> selectionList = [
    {'title': '最新资源', 'list': []},
    {'title': '最热资源', 'list': []},
    {'title': '热播电视剧', 'list': []},
    {'title': '热播电影', 'list': []},
  ];
  // 除精选外的其它列表数据
  Map otherPageData = {};

  // 设置当前分类
  setCurrentClassify(Map _currentClassify) {
    setState(() {
      currentClassify = _currentClassify;
    });

    // 排除精选
    if (_currentClassify['typeId'] != 0) {
      this.getSecondClassifyList();
    }

    _controller.jumpTo(currentClassify['offset'] ?? 0);
  }

  // 渲染列表
  // 需要优化渲染机制
  List<Widget> getListWidget() {
    final typeId = currentClassify["typeId"];
    switch (typeId) {
      case 0:
        {
          return [
            FNav(
              title: '猜你喜欢',
              left: 16,
              right: 16,
            ),
            FHorizontalVideo(
              list: linksList,
            ),
            ...(selectionList
                .map((e) => ClassifyBlock(title: e['title'], list: e['list']))
                .toList())
          ];
        }
      default:
        return [
          ...((otherPageData[typeId] ?? [])
              .map((e) => ClassifyBlock(title: e['title'], list: e['list']))
              .toList())
        ];
    }
  }

  // 二级分类
  getSecondClassifyList() async {
    List _otherPageData = otherPageData[currentClassify['typeId']] ?? [];
    // 访问过就返回
    if (_otherPageData.length > 0) return;

    final res = await CmsApi.getClassify(
        queryParameters: {'pid': currentClassify['typeId']});
    List tempData = [];

    for (Map classify in (res.data ?? [])) {
      final res =
          await CmsApi.getList(queryParameters: {'ids': classify['typeId']});
      tempData.add({'title': classify['typeName'], 'list': res.data ?? []});
    }

    setState(() {
      otherPageData[currentClassify['typeId']] = tempData;
    });
  }

  // 分类
  getClassify() async {
    final res = await CmsApi.getClassify(queryParameters: {'pid': 0});
    // 追加 精选
    (res.data ?? []).insertAll(0, [currentClassify]);
    setState(() {
      classifyList = res.data;
    });
  }

  // 喜欢
  getLikes() async {
    final res = await CmsApi.getLikes('2');
    print(res);
    setState(() {
      linksList = res.data;
    });
  }

  // 最新
  getNew() async {
    final res = await CmsApi.getNewList();
    setState(() {
      selectionList[0]['list'] = res.data;
    });
  }

  // 电视剧
  getTvPlay() async {
    final res = await CmsApi.getList(queryParameters: {'parentIds': 12});
    setState(() {
      selectionList[2]['list'] = res.data;
    });
  }

  // 电影
  getMove() async {
    final res = await CmsApi.getList(queryParameters: {'parentIds': 1});
    setState(() {
      selectionList[3]['list'] = res.data;
    });
  }

  // 最热
  getHot() async {
    final res = await CmsApi.getHotList();
    setState(() {
      selectionList[1]['list'] = res.data;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getClassify();
    this.getLikes();
    this.getNew();

    // 延迟加载不在第一屏的数据
    Future.delayed(Duration(milliseconds: 500), () {
      this.getHot();
      this.getTvPlay();
      this.getMove();
    });

    // 需要截流
    _controller.addListener(() {
      currentClassify['offset'] = _controller.offset;
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
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
            controller: _controller,
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
                children: [
                  // swiper 不加高度报错
                  Container(
                    height: MediaQuery.of(context).size.width * .6,
                    child: FSwiper(),
                  ),
                  ...getListWidget()
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
