import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class FNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '猜你喜欢',
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
