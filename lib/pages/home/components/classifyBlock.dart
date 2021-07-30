import 'package:flutter/material.dart';
import 'package:funny/components/fNav.dart';
import 'package:funny/components/fVideoCard.dart';

class ClassifyBlock extends StatelessWidget {
  ClassifyBlock({required this.title, required this.list});

  final String title;
  final List list;

  static const _spacing = 2.5;
  double computedWidth(width) {
    return width / 2;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final firstVideo = list.take(1).toList();
    final otherVideo = list.skip(1).toList();

    return Column(
      children: [
        FNav(
          title: title,
          left: 16,
          right: 16,
        ),
        ...(firstVideo.map((item) => FVideoCard(
              id: item['vodId'],
              url: item['vodPic'],
              name: item['vodName'],
              subName: item['vodSub'],
              maxHeight: 200,
            ))),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: otherVideo.asMap().entries.map((entry) {
              final item = entry.value;
              final int index = entry.key;

              return SizedBox(
                width: computedWidth(width),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: index % 2 == 0 ? _spacing : 0,
                      left: index % 2 != 0 ? _spacing : 0),
                  child: FVideoCard(
                      url: item['vodPic'],
                      name: item['vodName'],
                      subName: item['vodSub'],
                      id: item['vodId']),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
