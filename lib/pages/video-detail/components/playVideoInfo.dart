import 'package:flutter/material.dart';

class PlayVideoInfo extends StatelessWidget {
  PlayVideoInfo({required this.data});

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data['vodName'] ?? '',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, height: 2),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
              color: Theme.of(context).primaryColor,
              child: Text(
                data['vodScore'] ?? '0',
                style: TextStyle(color: Colors.white, fontSize: 12, height: 1),
              ),
            )
          ],
        )
      ],
    );
  }
}
