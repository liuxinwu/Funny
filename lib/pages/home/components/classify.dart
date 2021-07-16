import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class Classify extends StatefulWidget {
  _ClassifyState createState() => new _ClassifyState();
}

class _ClassifyState extends State {
  List classifyList = [
    {"type_id": 1, "type_name": "电影"},
    {"type_id": 2, "type_name": "连续剧"},
    {"type_id": 3, "type_name": "综艺"},
    {"type_id": 4, "type_name": "动漫"},
    {"type_id": 5, "type_name": "资讯"},
    {"type_id": 6, "type_name": "动作片"},
    {"type_id": 7, "type_name": "喜剧片"},
    {"type_id": 8, "type_name": "爱情片"},
    {"type_id": 9, "type_name": "科幻片"},
    {"type_id": 10, "type_name": "恐怖片"},
    {"type_id": 11, "type_name": "剧情片"},
    {"type_id": 12, "type_name": "战争片"},
    {"type_id": 13, "type_name": "国产剧"},
    {"type_id": 14, "type_name": "港台剧"},
    {"type_id": 15, "type_name": "日韩剧"},
    {"type_id": 16, "type_name": "欧美剧"},
    {"type_id": 17, "type_name": "公告"},
    {"type_id": 18, "type_name": "头条"},
    {"type_id": 20, "type_name": "犯罪片"},
    {"type_id": 21, "type_name": "大陆综艺"},
    {"type_id": 22, "type_name": "日韩综艺"}
  ];
  int currentClassify = 1;

  handleTap(int newClassify) {
    setState(() {
      currentClassify = newClassify;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
                child: Scrollbar(
                    controller: ScrollController(initialScrollOffset: 0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: classifyList
                              .map(
                                (item) => Padding(
                                  padding: EdgeInsets.fromLTRB(8, 5, 8, 10),
                                  child: GestureDetector(
                                    onTap: () => handleTap(item['type_id']),
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: currentClassify == item['type_id']
                                          ? TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          : TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white60),
                                      child: Text(item['type_name']),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )))),
            GestureDetector(
              onTap: () => {print('更多')},
              child: Container(
                width: 33,
                height: 25,
                color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    Positioned(
                        top: -5,
                        right: 3,
                        child: Icon(
                          FIcons.more,
                          size: 30,
                          color: Colors.white70,
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
