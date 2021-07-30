import 'package:flutter/material.dart';
import 'package:funny/components/fVideoCard.dart';

const defalutListVal = [];

class FHorizontalVideo extends StatelessWidget {
  FHorizontalVideo({this.list = defalutListVal});

  final List list;

  List<Widget> getList() {
    return list
        .map((item) => SizedBox(
              width: 150,
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: FVideoCard(
                    url: item['vodPic'],
                    name: item['vodName'],
                    subName: item['vodSub'],
                    id: item['vodId']),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Scrollbar(
            controller: ScrollController(initialScrollOffset: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: getList(),
              ),
            ))
      ],
    );
  }
}
