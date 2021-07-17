import 'package:flutter/material.dart';
import './components/head.dart';
import './components/classify.dart';
import 'package:funny/components/fSwiper.dart';
import './components/links.dart';
import './components/classifyBlock.dart';

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
                return Container(child: Text('无更多'),);
              }
              return Wrap(
                children: [
                  // swiper 不加高度报错
                  Container(
                    height: 200,
                    child: FSwiper(),
                  ),
                  Links(),
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
