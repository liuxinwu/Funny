// 父组件状态更新子组件不更新问题  https://www.jianshu.com/p/510c72cecf26

import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class Classify extends StatefulWidget {
  Classify({
    Key? key,
    required this.classifyList,
  }) : super(key: key);

  final List classifyList;

  _ClassifyState createState() =>
      new _ClassifyState(classifyList: classifyList);
}

class _ClassifyState extends State {
  _ClassifyState({
    required this.classifyList,
  });

  final List classifyList;
  int currentClassify = 0;

  setCurrentClassify(int _currentClassify) {
    setState(() {
      currentClassify = _currentClassify;
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
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                                  child: GestureDetector(
                                    onTap: () =>
                                        setCurrentClassify(item['type_id']),
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(milliseconds: 200),
                                      style: currentClassify == item['type_id']
                                          ? TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          : TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
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
                        top: -4,
                        right: 3,
                        child: Icon(
                          FIcons.more,
                          size: 25,
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
