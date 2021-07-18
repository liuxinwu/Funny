import 'package:flutter/material.dart';

class VideoComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '评论：',
          style:
              TextStyle(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
