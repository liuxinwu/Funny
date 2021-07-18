import 'package:flutter/material.dart';

class PlayVideoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '我的邻居长不大',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, height: 2),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
              color: Theme.of(context).primaryColor,
              child: Text(
                '5.8',
                style: TextStyle(color: Colors.white, fontSize: 12, height: 1),
              ),
            )
          ],
        )
      ],
    );
  }
}
