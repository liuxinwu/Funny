import 'package:flutter/material.dart';
import './components/head.dart';
import './components/classify.dart';
import 'package:funny/components/fSwiper.dart';
import './components/links.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [Head(), Classify()],
        ),
        new Expanded(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              // swiper 不加高度报错
              Container(
                height: 200,
                child: FSwiper(),
              ),
              Links()
            ],
          ),
        )
      ],
    );
  }
}
