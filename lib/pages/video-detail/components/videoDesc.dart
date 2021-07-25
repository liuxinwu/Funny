import 'package:flutter/material.dart';

class VideoDesc extends StatelessWidget {
  VideoDesc({required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    print(data);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '剧情介绍：',
          style:
              TextStyle(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
        ),
        Text(
          '         $data',
          style: TextStyle(
              fontSize: 12, height: 1.8, textBaseline: TextBaseline.alphabetic),
        )
      ],
    );
  }
}
