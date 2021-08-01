import 'package:flutter/material.dart';

class VideoCollection extends StatefulWidget {
  VideoCollection(
      {Key? key,
      required this.title,
      required this.handleClick,
      required this.data})
      : super(key: key);

  final String title;
  final Function handleClick;
  final List data;

  @override
  _VideoCollection createState() =>
      _VideoCollection(title: title, handleClick: handleClick, data: data);
}

class _VideoCollection extends State<VideoCollection> {
  _VideoCollection(
      {required this.title, required this.handleClick, required this.data});

  final String title;
  final Function handleClick;
  final List data;
  // 当前播放集数
  int currentCollection = 0;

  List<Widget> getCollection(color) {
    // if (data == null) return [];

    return data.asMap().entries.map((entry) {
      final item = entry.value;
      final int index = entry.key;

      return Padding(
        padding: EdgeInsets.only(right: 10, left: 0, top: 5),
        child: SizedBox(
          height: 46,
          child: TextButton(
              onPressed: () {
                this.handleClick(index);
                setState(() {
                  currentCollection = index;
                });
              },
              onLongPress: () {},
              child: Text(
                item['name'] ?? '',
                style: TextStyle(
                    color: currentCollection == index ? color : Colors.black87),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(237, 240, 247, 1.0),
                primary: color,
              )),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return ListBody(
      children: [
        Text(
          '$title：',
          style:
              TextStyle(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
        ),
        Scrollbar(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getCollection(color),
                )))
      ],
    );
  }
}
