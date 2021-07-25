import 'package:flutter/material.dart';

class VideoCollection extends StatelessWidget {
  VideoCollection(
      {Key? key,
      this.title = '在线播放',
      required this.handleClick,
      required this.data})
      : super(key: key);

  final String title;
  final Function handleClick;
  final String data;

  List<Widget> getCollection(color) {
    if (data == null) return [];

    final urlList = data.split('#');
    return urlList.asMap().entries.map((entry) {
      final item = entry.value;
      final int index = entry.key;

      return TextButton(
          onPressed: () {
            this.handleClick(index);
          },
          child: Text(item.split('\$')[0]),
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(TextStyle(color: Colors.black87)),
              overlayColor: MaterialStateProperty.all(color),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.blue, width: 1))));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title：',
          style:
              TextStyle(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 20,
          children: getCollection(color),
        )
      ],
    );
  }
}
