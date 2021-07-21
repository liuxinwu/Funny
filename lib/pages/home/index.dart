import 'package:flutter/material.dart';
import 'package:funny/components/fHorizontalVideo.dart';
import 'package:funny/components/fSwiper.dart';
import 'package:funny/components/fNav.dart';

import './components/classify.dart';
import './components/classifyBlock.dart';
import './components/head.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [Head(), Classify()],
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
                    height: 200,
                    child: FSwiper(),
                  ),
                  FNav(
                    title: '猜你喜欢',
                    left: 16,
                    right: 16,
                  ),
                  FHorizontalVideo(
                    list: [1, 2, 3, 4, 5],
                  ),
                  ClassifyBlock(),
                  ClassifyBlock()
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
