import 'package:flutter/material.dart';
import 'package:funny/components/fVideoCard.dart';
import 'package:funny/components/fNav.dart';

class ClassifyBlock extends StatelessWidget {
  static const _spacing = 2.5;
  double computedWidth(width) {
    return width / 2;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Column(
      children: [
        FNav(
          title: '热播',
          left: 16,
          right: 16,
        ),
        FVideoCard(
          url:
              'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg',
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: [
              SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(right: _spacing),
                  child: FVideoCard(
                      url:
                          'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg'),
                ),
              ),
              SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(left: _spacing),
                  child: FVideoCard(
                      url:
                          'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg'),
                ),
              ),
              SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(right: _spacing),
                  child: FVideoCard(
                      url:
                          'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg'),
                ),
              ),
              SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(left: _spacing),
                  child: FVideoCard(
                      url:
                          'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
