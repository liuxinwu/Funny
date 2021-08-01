import 'package:flutter/material.dart';
import 'package:funny/components/fVideoCard.dart';

const defalutListVal = [];

class FHorizontalVideo extends StatelessWidget {
  FHorizontalVideo({this.list = defalutListVal, this.jumpMethod});

  final List list;
  final jumpMethod;

  List<Widget> getList() {
    return list
        .map((item) => Container(
              constraints: BoxConstraints(maxWidth: 150),
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: FVideoCard(
                  url: item['vodPic'],
                  name: item['vodName'],
                  subName: item['vodSub'],
                  id: item['vodId'],
                  jumpMethod: jumpMethod,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Scrollbar(
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
