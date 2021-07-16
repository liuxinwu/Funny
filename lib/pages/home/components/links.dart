import 'package:flutter/material.dart';
import 'package:funny/components/fNav.dart';
import 'package:funny/components/fVideoCard.dart';

class Links extends StatelessWidget {
  List list = [];

  List<Widget> getList() {
    return list
        .map((item) => SizedBox(
              width: 150,
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: FVideoCard(
                    url:
                        'https://m.ykimg.com/0527000060EBFAB213EA3508D5A14108'),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    list.length = 8;
    list.fillRange(0, 8, 1);

    return Wrap(
      children: [
        FNav(),
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
