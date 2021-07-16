import 'package:flutter/material.dart';

class FVideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Image.network(
      "https://public-static-edu.codemao.cn/upload/1550226072000/%E5%B9%B3%E5%8F%B0%E8%A7%86%E9%A2%91banner2.png",
      fit: BoxFit.fill,
    ),
        Text('天涯明月刀'),
        Text('钟汉良')
      ],
    );
  }
}