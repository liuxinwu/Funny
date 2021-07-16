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
        FNav(),
        FVideoCard(
            url:
                'https://liangcang-material.alicdn.com/prod/upload/fe84b0f297e34aef8ce6b0e6699ca371.jpg'),
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
                          'https://liangcang-material.alicdn.com/prod/upload/fe84b0f297e34aef8ce6b0e6699ca371.jpg'),
                ),
              ),
              SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(left: _spacing),
                  child: FVideoCard(
                      url:
                          'https://liangcang-material.alicdn.com/prod/upload/fe84b0f297e34aef8ce6b0e6699ca371.jpg'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
