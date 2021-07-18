import 'package:flutter/material.dart';

class FVideoCard extends StatelessWidget {
  FVideoCard(
      {Key? key, required String this.url, double this.maxHeight = 160.0})
      : super(key: key);

  final url;
  final maxHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: Image.network(
                url,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '我的邻居长不大',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '年下小狼狗追御姐',
                style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(153, 153, 153, 1),
                    height: 1.3),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, 'videoDetail',
              arguments: {'videoId': 1});
        });
  }
}
