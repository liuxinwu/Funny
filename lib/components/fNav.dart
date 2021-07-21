import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class FNav extends StatelessWidget {
  FNav({required this.title, this.left = 0, this.right = 0});

  final String title;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 10, right, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Icon(
            FIcons.gt,
            color: Colors.black54,
            size: 14,
          )
        ],
      ),
    );
  }
}
