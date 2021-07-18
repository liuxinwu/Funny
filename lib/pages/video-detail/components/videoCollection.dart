import 'package:flutter/material.dart';

class VideoCollection extends StatelessWidget {
  VideoCollection({Key? key, this.title = '在线播放', required this.handleClick})
      : super(key: key);

  final String title;
  final Function handleClick;

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
          spacing: 10,
          children: [
            TextButton(
                onPressed: () {
                  this.handleClick();
                },
                child: Text('第1集'),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: Colors.black87)),
                    overlayColor: MaterialStateProperty.all(color),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.blue, width: 1)))),
            TextButton(
              onPressed: () {},
              child: Text('第2集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
            TextButton(
              onPressed: () {},
              child: Text('第3集'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black87)),
                  overlayColor: MaterialStateProperty.all(color),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1))),
            ),
          ],
        )
      ],
    );
  }
}
